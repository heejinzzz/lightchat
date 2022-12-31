package handler

import (
	"context"
	"encoding/json"
	"github.com/heejinzzz/clog"
	"github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/common"
	"github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/common/errors"
	"github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/common/profile"
	sms "github.com/tencentcloud/tencentcloud-sdk-go/tencentcloud/sms/v20210111"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	pb "lightchat_server/UserManager/proto"
	"math/rand"
	"strconv"
	"sync"
)

const (
	SecretId           = "************************************"
	SecretKey          = "********************************"
	SmsSdkAppId        = "**********"
	SignName           = "轻聊LightChat"
	RegisterTemplateId = "*******"
	LoginTemplateId    = "*******"
)

type UserManagerServer struct {
	logger *clog.Logger
	mutex  sync.Mutex // lock for mongodb
}

func NewUserManagerServer(logger *clog.Logger) *UserManagerServer {
	return &UserManagerServer{logger: logger}
}

func (s *UserManagerServer) GetUserInfoById(ctx context.Context, req *pb.GetUserInfoByIdRequest) (*pb.GetUserInfoByIdResponse, error) {
	s.logger.Infof("Get GetUserInfoById Request: %v", req)

	user := &User{}
	collection := mongodbClient.Database("User").Collection("User")
	res := collection.FindOne(context.Background(), bson.M{"id": req.Id})
	if res.Err() == mongo.ErrNoDocuments {
		return &pb.GetUserInfoByIdResponse{Exist: false}, nil
	}
	if res.Err() != nil {
		s.logger.Error("Get UserInfo from MongoDB failed: ", res.Err())
		return nil, res.Err()
	}
	err := res.Decode(user)
	if err != nil {
		s.logger.Error("Decode User Info failed: ", err)
		return nil, err
	}
	return &pb.GetUserInfoByIdResponse{
		Exist:  true,
		Name:   user.Name,
		Gender: user.Gender,
	}, nil
}

func (s *UserManagerServer) getUserFullInfoByNumber(number string) (*User, bool, error) {
	user := &User{}
	collection := mongodbClient.Database("User").Collection("User")
	res := collection.FindOne(context.Background(), bson.M{"number": number})
	if res.Err() == mongo.ErrNoDocuments {
		return nil, false, nil
	}
	if res.Err() != nil {
		s.logger.Error("Get UserInfo from MongoDB failed: ", res.Err())
		return nil, false, res.Err()
	}
	err := res.Decode(user)
	if err != nil {
		s.logger.Error("Decode User Info failed: ", err)
		return nil, false, err
	}
	return user, true, nil
}

func (s *UserManagerServer) GetUserInfoByNumber(ctx context.Context, req *pb.GetUserInfoByNumberRequest) (*pb.GetUserInfoByNumberResponse, error) {
	s.logger.Infof("Get GetUserInfoByNumber Request: %v", req)

	user, exist, err := s.getUserFullInfoByNumber(req.Number)
	if err != nil {
		return nil, err
	}
	if !exist {
		return &pb.GetUserInfoByNumberResponse{Exist: false}, nil
	}
	return &pb.GetUserInfoByNumberResponse{
		Exist:  true,
		Id:     user.Id,
		Name:   user.Name,
		Gender: user.Gender,
	}, nil
}

func (s *UserManagerServer) LoginWithPassword(ctx context.Context, req *pb.LoginWithPasswordRequest) (*pb.LoginWithPasswordResponse, error) {
	s.logger.Infof("Get LoginWithPassword Request: %v", req)

	user, exist, err := s.getUserFullInfoByNumber(req.Number)
	if err != nil {
		return nil, err
	}
	if !exist || user.Password != req.Password {
		return &pb.LoginWithPasswordResponse{Succeed: false}, nil
	}
	return &pb.LoginWithPasswordResponse{Succeed: true, Id: user.Id}, nil
}

func (s *UserManagerServer) LoginWithSMS(ctx context.Context, req *pb.LoginWithSMSRequest) (*pb.LoginWithSMSResponse, error) {
	s.logger.Infof("Get LoginWithSMS Request: %v", req)

	user, exist, err := s.getUserFullInfoByNumber(req.Number)
	if err != nil {
		return nil, err
	}
	if !exist {
		return &pb.LoginWithSMSResponse{Succeed: false}, nil
	}
	return &pb.LoginWithSMSResponse{Succeed: true, Id: user.Id}, nil
}

func (s *UserManagerServer) ChangeUserName(ctx context.Context, req *pb.ChangeUserNameRequest) (*pb.ChangeUserNameResponse, error) {
	s.logger.Infof("Get ChangeUserName Request: %v", req)

	collection := mongodbClient.Database("User").Collection("User")
	filter := bson.M{"id": req.Id}
	update := bson.M{"$set": bson.M{"name": req.NewName}}
	_, err := collection.UpdateOne(context.Background(), filter, update)
	if err != nil {
		s.logger.Errorf("Change Name for user: %s Failed: %v", req.Id, err)
		return &pb.ChangeUserNameResponse{Succeed: false}, nil
	}
	return &pb.ChangeUserNameResponse{Succeed: true}, nil
}

func (s *UserManagerServer) ChangeUserGender(ctx context.Context, req *pb.ChangeUserGenderRequest) (*pb.ChangeUserGenderResponse, error) {
	s.logger.Infof("Get ChangeUserGender Request: %v", req)

	collection := mongodbClient.Database("User").Collection("User")
	filter := bson.M{"id": req.Id}
	update := bson.M{"$set": bson.M{"gender": req.NewGender}}
	_, err := collection.UpdateOne(context.Background(), filter, update)
	if err != nil {
		s.logger.Errorf("Change Gender for user: %s Failed: %v", req.Id, err)
		return &pb.ChangeUserGenderResponse{Succeed: false}, nil
	}
	return &pb.ChangeUserGenderResponse{Succeed: true}, nil
}

func (s *UserManagerServer) Register(ctx context.Context, req *pb.RegisterRequest) (*pb.RegisterResponse, error) {
	s.logger.Infof("Get Register Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	res, err := s.GetUserInfoById(context.Background(), &pb.GetUserInfoByIdRequest{Id: req.Id})
	if err != nil {
		return nil, err
	}
	if res.Exist {
		return &pb.RegisterResponse{IdCheck: false}, nil
	}
	_, exist, err := s.getUserFullInfoByNumber(req.Number)
	if err != nil {
		return nil, err
	}
	if exist {
		return &pb.RegisterResponse{IdCheck: true, NumberCheck: false}, nil
	}
	collection := mongodbClient.Database("User").Collection("User")
	_, err = collection.InsertOne(context.Background(), &User{
		Id:       req.Id,
		Number:   req.Number,
		Password: req.Password,
		Name:     req.Name,
		Gender:   req.Gender,
	})
	if err != nil {
		return nil, err
	}
	return &pb.RegisterResponse{IdCheck: true, NumberCheck: true}, nil
}

func (s *UserManagerServer) RequestSMS(ctx context.Context, req *pb.RequestSMSRequest) (*pb.RequestSMSResponse, error) {
	s.logger.Infof("Get RequestSMS Request: %v", req)

	codeLength, validMinutes := 6, 5
	code := ""
	for i := 0; i < codeLength; i++ {
		code += strconv.Itoa(rand.Intn(10))
	}

	res, err := s.sendSMS(req.Type, req.Number, code, validMinutes)
	if _, ok := err.(*errors.TencentCloudSDKError); ok {
		s.logger.Warn("Return an API error: ", err)
	} else if err != nil {
		s.logger.Warn("Send SMS Failed: ", err)
	} else {
		b, _ := json.Marshal(res.Response)
		s.logger.Infof("Get response from Tencent SMS Service: %s", b)
	}

	return &pb.RequestSMSResponse{Code: code, ValidMinutes: int32(validMinutes)}, nil
}

func (s *UserManagerServer) sendSMS(smsType pb.SMSType, number string, code string, validMinutes int) (*sms.SendSmsResponse, error) {
	/* 实例化一个认证对象，入参需要传入腾讯云账户密钥对secretId，secretKey。*/
	credential := common.NewCredential(
		SecretId,
		SecretKey,
	)

	/* 实例化一个客户端配置对象，可以指定超时时间等配置 */
	cpf := profile.NewClientProfile()

	/* SDK默认使用POST方法。
	 * 如果你一定要使用GET方法，可以在这里设置。GET方法无法处理一些较大的请求 */
	cpf.HttpProfile.ReqMethod = "POST"

	/* 指定接入地域域名，默认就近地域接入域名为 sms.tencentcloudapi.com ，也支持指定地域域名访问，例如广州地域的域名为 sms.ap-guangzhou.tencentcloudapi.com */
	cpf.HttpProfile.Endpoint = "sms.tencentcloudapi.com"

	/* SDK默认用TC3-HMAC-SHA256进行签名，非必要请不要修改这个字段 */
	cpf.SignMethod = "HmacSHA1"

	/* 实例化要请求产品(以sms为例)的client对象
	 * 第二个参数是地域信息，可以直接填写字符串ap-guangzhou，支持的地域列表参考 https://cloud.tencent.com/document/api/382/52071#.E5.9C.B0.E5.9F.9F.E5.88.97.E8.A1.A8 */
	client, err := sms.NewClient(credential, "ap-nanjing", cpf)
	if err != nil {
		return nil, err
	}

	/* 实例化一个请求对象，根据调用的接口和实际情况，可以进一步设置请求参数*/
	request := sms.NewSendSmsRequest()

	/* 短信应用ID: 短信SdkAppId在 [短信控制台] 添加应用后生成的实际SdkAppId */
	request.SmsSdkAppId = common.StringPtr(SmsSdkAppId)

	/* 短信签名内容: 使用 UTF-8 编码，必须填写已审核通过的签名 */
	request.SignName = common.StringPtr(SignName)

	/* 模板 ID: 必须填写已审核通过的模板 ID */
	if smsType == pb.SMSType_REGISTER {
		request.TemplateId = common.StringPtr(RegisterTemplateId)
	} else {
		request.TemplateId = common.StringPtr(LoginTemplateId)
	}

	/* 模板参数: 模板参数的个数需要与 TemplateId 对应模板的变量个数保持一致，若无模板参数，则设置为空*/
	request.TemplateParamSet = common.StringPtrs([]string{code, strconv.Itoa(validMinutes)})

	/* 下发手机号码，采用 E.164 标准，+[国家或地区码][手机号]
	 * 示例如：+8613711112222， 其中前面有一个+号 ，86为国家码，13711112222为手机号，最多不要超过200个手机号*/
	request.PhoneNumberSet = common.StringPtrs([]string{"+86" + number})

	// 通过client对象调用想要访问的接口，需要传入请求对象
	return client.SendSms(request)
}
