package handler

import (
	"context"
	"github.com/heejinzzz/clog"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"lightchat_server/ChatManager/ChatStream"
	pb "lightchat_server/ChatManager/proto"
	"sort"
	"strconv"
	"strings"
	"sync"
	"time"
)

type MessageManagerServer struct {
	logger *clog.Logger
	mutex  sync.Mutex
}

func NewMessageManagerServer(logger *clog.Logger) *MessageManagerServer {
	return &MessageManagerServer{logger: logger}
}

func (s *MessageManagerServer) getSessions(userId string) ([]string, error) {
	var sessionIds []string
	collection := mongodbClient.Database("Session").Collection(userId)
	cur, err := collection.Find(context.Background(), bson.M{})
	if err != nil {
		return nil, err
	}
	defer cur.Close(context.Background())
	for cur.Next(context.Background()) {
		temp := bson.M{}
		if err = cur.Decode(&temp); err != nil {
			return nil, err
		}
		sessionIds = append(sessionIds, temp["sessionId"].(string))
	}
	if sessionIds == nil {
		sessionIds = []string{}
	}
	return sessionIds, nil
}

func (s *MessageManagerServer) insertNewSession(userId, sessionId string) error {
	collection := mongodbClient.Database("Session").Collection(userId)
	_, err := collection.InsertOne(context.Background(), bson.M{"sessionId": sessionId})
	return err
}

func (s *MessageManagerServer) insertNewMessage(message *pb.MessageTile) error {
	pieces := strings.Split(message.MessageId, "-")
	sessionId := strings.Join(pieces[:2], "-")
	collection := mongodbClient.Database("Message").Collection(sessionId)
	_, err := collection.InsertOne(context.Background(), message)
	return err
}

func (s *MessageManagerServer) getNextMessageId(sessionId string) (int64, error) {
	collection := mongodbClient.Database("Message").Collection(sessionId)
	res := collection.FindOne(context.Background(), bson.M{}, &options.FindOneOptions{
		Projection: bson.M{"countId": 1},
		Sort:       bson.M{"countId": -1},
	})
	if res.Err() == mongo.ErrNoDocuments {
		return 0, nil
	}
	if res.Err() != nil {
		return 0, res.Err()
	}
	temp := bson.M{}
	err := res.Decode(&temp)
	if err != nil {
		return 0, err
	}
	return temp["countId"].(int64) + 1, nil
}

func (s *MessageManagerServer) CreateSession(_ context.Context, req *pb.CreateSessionRequest) (*pb.CreateSessionResponse, error) {
	s.logger.Infof("Get CreateSession Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	pieces := strings.Split(req.SessionId, "-")
	userId := pieces[0]
	sessionIds, err := s.getSessions(userId)
	if err != nil {
		s.logger.Errorf("Get SessionIds in MongoDB Failed: %s", err)
		return nil, err
	}
	exist := false
	for _, id := range sessionIds {
		if id == req.SessionId {
			exist = true
			break
		}
	}
	if !exist {
		err = s.insertNewSession(userId, req.SessionId)
		if err != nil {
			s.logger.Errorf("Insert new session in MongoDB Failed: %s", err)
			return nil, err
		}
	}
	userId = pieces[1]
	sessionIds, err = s.getSessions(userId)
	if err != nil {
		s.logger.Errorf("Get SessionIds in MongoDB Failed: %s", err)
		return nil, err
	}
	exist = false
	for _, id := range sessionIds {
		if id == req.SessionId {
			exist = true
			break
		}
	}
	if !exist {
		err = s.insertNewSession(userId, req.SessionId)
		if err != nil {
			s.logger.Errorf("Insert new session in MongoDB Failed: %s", err)
			return nil, err
		}
	}
	countId, err := s.getNextMessageId(req.SessionId)
	if err != nil {
		s.logger.Errorf("Get Next message countId in MongoDB Failed: %s", err)
		return nil, err
	}
	message := &pb.MessageTile{
		MessageId: req.SessionId + "-" + strconv.FormatInt(countId, 10),
		CountId:   countId,
		UserId:    req.UserId,
		Type:      pb.MessageType_TEXT,
		Content:   "我同意了你的添加联系人申请，现在我们可以开始聊天了",
		Size:      0,
		Timestamp: time.Now().UnixMilli(),
	}
	err = s.insertNewMessage(message)
	if err != nil {
		s.logger.Errorf("Insert new message in MongoDB Failed: %s", err)
		return nil, err
	}
	ChatStream.TrySendMessage(message)
	return &pb.CreateSessionResponse{Succeed: true}, nil
}

func (s *MessageManagerServer) SendMessage(_ context.Context, message *pb.MessageTile) (*pb.SendMessageResponse, error) {
	s.logger.Infof("Get SendMessage Request: %v", message)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	pieces := strings.Split(message.MessageId, "-")
	sessionId := strings.Join(pieces[:2], "-")
	countId, err := s.getNextMessageId(sessionId)
	if err != nil {
		s.logger.Errorf("Get Next message countId in MongoDB Failed: %s", err)
		return nil, err
	}
	messageId := sessionId + "-" + strconv.FormatInt(countId, 10)
	message.MessageId = messageId
	message.CountId = countId
	err = s.insertNewMessage(message)
	if err != nil {
		s.logger.Errorf("Insert new message in MongoDB Failed: %s", err)
		return nil, err
	}
	ChatStream.TrySendMessage(message)
	return &pb.SendMessageResponse{MessageId: messageId}, nil
}

func (s *MessageManagerServer) getMessages(sessionId string, getLatest bool, lastMessageCountId int64, getNum int64) ([]*pb.MessageTile, bool, error) {
	option := &options.FindOptions{}
	option.Limit = &getNum
	if getLatest {
		option.Sort = bson.M{"countId": -1}
	} else {
		option.Sort = bson.M{"countId": 1}
		if lastMessageCountId >= getNum {
			skip := lastMessageCountId - getNum
			option.Skip = &skip
		} else {
			option.Limit = &lastMessageCountId
		}
	}
	collection := mongodbClient.Database("Message").Collection(sessionId)
	cur, err := collection.Find(context.Background(), bson.M{}, option)
	if err != nil {
		return nil, false, err
	}
	defer cur.Close(context.Background())
	var messages []*pb.MessageTile
	err = cur.All(context.Background(), &messages)
	if err != nil {
		return nil, false, err
	}
	if !getLatest {
		half := len(messages) / 2
		left, right := half-1, half
		if len(messages)%2 == 1 {
			right++
		}
		for left >= 0 && right < len(messages) {
			messages[left], messages[right] = messages[right], messages[left]
			left--
			right++
		}
	}
	if messages == nil {
		messages = []*pb.MessageTile{}
	}
	if len(messages) == 0 || messages[len(messages)-1].CountId == 0 {
		return messages, true, nil
	}
	return messages, false, nil
}

func (s *MessageManagerServer) getHistory(sessionId string, targetMessageCountId int64) ([]*pb.MessageTile, error) {
	collection := mongodbClient.Database("Message").Collection(sessionId)
	cur, err := collection.Find(context.Background(), bson.M{}, &options.FindOptions{Skip: &targetMessageCountId})
	if err != nil {
		return nil, err
	}
	defer cur.Close(context.Background())
	var messages []*pb.MessageTile
	err = cur.All(context.Background(), &messages)
	if err != nil {
		return nil, err
	}
	half := len(messages) / 2
	left, right := half-1, half
	if len(messages)%2 == 1 {
		right++
	}
	for left >= 0 && right < len(messages) {
		messages[left], messages[right] = messages[right], messages[left]
		left--
		right++
	}
	if messages == nil {
		messages = []*pb.MessageTile{}
	}
	return messages, nil
}

func (s *MessageManagerServer) GetMessages(_ context.Context, req *pb.GetMessagesRequest) (*pb.GetMessagesResponse, error) {
	s.logger.Infof("Get GetMessages Request: %v", req)

	if req.Type == pb.GetRequestType_HISTORY {
		pieces := strings.Split(req.TargetMessageId, "-")
		countId, _ := strconv.ParseInt(pieces[2], 10, 64)
		messages, err := s.getHistory(req.SessionId, countId)
		if err != nil {
			s.logger.Errorf("Get history messages in MongoDB Failed: %s", err)
			return nil, err
		}
		return &pb.GetMessagesResponse{
			Messages:   messages,
			IsLastPage: countId == 0,
		}, nil
	}
	getNum := int64(20)
	countId := int64(0)
	if !req.IsStartPage {
		pieces := strings.Split(req.LastMessageId, "-")
		countId, _ = strconv.ParseInt(pieces[2], 10, 64)
	}
	if !req.IsStartPage && countId == 0 {
		return &pb.GetMessagesResponse{Messages: []*pb.MessageTile{}, IsLastPage: true}, nil
	}
	messages, isLastPage, err := s.getMessages(req.SessionId, req.IsStartPage, countId, getNum)
	if err != nil {
		s.logger.Errorf("Get chat messages in MongoDB Failed: %s", err)
		return nil, err
	}
	return &pb.GetMessagesResponse{
		Messages:   messages,
		IsLastPage: isLastPage,
	}, nil
}

func (s *MessageManagerServer) GetSessionList(_ context.Context, req *pb.GetSessionListRequest) (*pb.GetSessionListResponse, error) {
	s.logger.Infof("Get GetSessionList Request: %v", req)

	sessionIds, err := s.getSessions(req.UserId)
	if err != nil {
		s.logger.Errorf("Get SessionIds in MongoDB Failed: %s", err)
		return nil, err
	}
	list := SortMessages{}
	for _, sessionId := range sessionIds {
		messages, _, err := s.getMessages(sessionId, true, 0, 1)
		if err != nil {
			s.logger.Errorf("Get latest message in MongoDB Failed: %s", err)
			return nil, err
		}
		list = append(list, messages...)
	}
	sort.Sort(list)
	return &pb.GetSessionListResponse{Messages: list}, nil
}

type SortMessages []*pb.MessageTile

func (sm SortMessages) Len() int {
	return len(sm)
}

func (sm SortMessages) Less(i, j int) bool {
	return sm[i].Timestamp > sm[j].Timestamp
}

func (sm SortMessages) Swap(i, j int) {
	sm[i], sm[j] = sm[j], sm[i]
}

func (s *MessageManagerServer) searchKeyword(sessionId, keyWord string) ([]*pb.MessageTile, error) {
	collection := mongodbClient.Database("Message").Collection(sessionId)
	cur, err := collection.Find(context.Background(), bson.M{"content": bson.M{"$regex": keyWord}})
	if err != nil {
		return nil, err
	}
	messages := []*pb.MessageTile{}
	err = cur.All(context.Background(), &messages)
	if err != nil {
		return nil, err
	}
	return messages, nil
}

func (s *MessageManagerServer) Search(_ context.Context, req *pb.SearchRequest) (*pb.SearchResponse, error) {
	s.logger.Infof("Get Search Request: %v", req)

	sessionIds, err := s.getSessions(req.UserId)
	if err != nil {
		s.logger.Errorf("Get SessionIds in MongoDB Failed: %s", err)
		return nil, err
	}
	list := SortMessages{}
	for _, sessionId := range sessionIds {
		messages, err := s.searchKeyword(sessionId, req.Keyword)
		if err != nil {
			s.logger.Errorf("Search Keyword in MongoDB Failed: %s", err)
			return nil, err
		}
		list = append(list, messages...)
	}
	sort.Sort(list)
	return &pb.SearchResponse{Messages: list}, nil
}
