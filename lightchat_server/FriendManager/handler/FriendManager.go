package handler

import (
	"context"
	"github.com/heejinzzz/clog"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	pb "lightchat_server/FriendManager/proto"
	"sync"
)

type FriendManagerServer struct {
	logger *clog.Logger
	mutex  sync.Mutex
}

func NewFriendManagerServer(logger *clog.Logger) *FriendManagerServer {
	return &FriendManagerServer{logger: logger}
}

func (s *FriendManagerServer) CheckFriend(_ context.Context, req *pb.CheckFriendRequest) (*pb.CheckFriendResponse, error) {
	s.logger.Infof("Get CheckFriend Request: %v", req)

	isFriend, remarkName, err := s.checkFriend(req.Id, req.TargetId)
	if err != nil {
		s.logger.Error("Check Friend in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.CheckFriendResponse{IsFriend: isFriend, RemarkName: remarkName}, nil
}

func (s *FriendManagerServer) checkFriend(id, targetId string) (bool, string, error) {
	collection := mongodbClient.Database("Friend").Collection(id)
	res := collection.FindOne(context.Background(), bson.M{"id": targetId})
	if res.Err() == mongo.ErrNoDocuments {
		return false, "", nil
	}
	if res.Err() != nil {
		return false, "", res.Err()
	}
	friend := &FriendInfo{}
	err := res.Decode(friend)
	if err != nil {
		return false, "", err
	}
	return true, friend.RemarkName, nil
}

func (s *FriendManagerServer) AcceptNewFriend(_ context.Context, req *pb.NewFriendRequest) (*pb.AcceptNewFriendResponse, error) {
	s.logger.Infof("Get AcceptNewFriend Request: %v", req)

	err := s.changeNewFriendRequest(req, pb.NewFriendRequestState_ACCEPTED)
	if err != nil {
		s.logger.Error("Change NewFriendRequest State Failed: ", err)
		return nil, err
	}

	s.mutex.Lock()
	defer s.mutex.Unlock()

	isFriend, _, err := s.checkFriend(req.ToId, req.FromId)
	if err != nil {
		s.logger.Error("Check Friend in MongoDB Failed: ", err)
		return nil, err
	}
	if isFriend {
		return &pb.AcceptNewFriendResponse{Succeed: true}, nil
	}
	err = s.addFriend(req.FromId, req.ToId, req.FromRemarkName, req.ToRemarkName)
	if err != nil {
		s.logger.Error("Add new friend in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.AcceptNewFriendResponse{Succeed: true}, nil
}

func (s *FriendManagerServer) RejectNewFriend(_ context.Context, req *pb.NewFriendRequest) (*pb.RejectNewFriendResponse, error) {
	s.logger.Infof("Get RejectNewFriend Request: %v", req)

	err := s.changeNewFriendRequest(req, pb.NewFriendRequestState_REJECTED)
	if err != nil {
		s.logger.Error("Change NewFriendRequest State Failed: ", err)
		return nil, err
	}
	return &pb.RejectNewFriendResponse{Succeed: true}, nil
}

func (s *FriendManagerServer) changeNewFriendRequest(req *pb.NewFriendRequest, state pb.NewFriendRequestState) error {
	fromId, toId := req.FromId, req.ToId
	collection := mongodbClient.Database("NewFriendRequest").Collection(fromId)
	filter := bson.M{"requestId": req.RequestId}
	update := bson.M{"$set": bson.M{"state": state, "toRemarkName": req.ToRemarkName}}
	_, err := collection.UpdateOne(context.Background(), filter, update)
	if err != nil {
		return err
	}

	collection = mongodbClient.Database("NewFriendRequest").Collection(toId)
	filter = bson.M{"requestId": req.RequestId}
	update = bson.M{"$set": bson.M{"state": state, "toRemarkName": req.ToRemarkName}}
	_, err = collection.UpdateOne(context.Background(), filter, update)
	return err
}

func (s *FriendManagerServer) addFriend(aId, bId, aRemarkName, bRemarkName string) error {
	collection := mongodbClient.Database("Friend").Collection(aId)
	_, err := collection.InsertOne(context.Background(), bson.M{"id": bId, "remarkName": aRemarkName})
	if err != nil {
		return err
	}

	collection = mongodbClient.Database("Friend").Collection(bId)
	_, err = collection.InsertOne(context.Background(), bson.M{"id": aId, "remarkName": bRemarkName})
	return err
}

func (s *FriendManagerServer) ChangeRemarkName(_ context.Context, req *pb.ChangeRemarkNameRequest) (*pb.ChangeRemarkNameResponse, error) {
	s.logger.Infof("Get ChangeRemarkName Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	isFriend, _, err := s.checkFriend(req.Id, req.FriendId)
	if err != nil {
		s.logger.Error("Check Friend in MongoDB Failed: ", err)
		return nil, err
	}
	if !isFriend {
		return &pb.ChangeRemarkNameResponse{IsFriend: false}, nil
	}

	collection := mongodbClient.Database("Friend").Collection(req.Id)
	filter := bson.M{"id": req.FriendId}
	update := bson.M{"$set": bson.M{"remarkName": req.NewRemarkName}}
	_, err = collection.UpdateOne(context.Background(), filter, update)
	if err != nil {
		s.logger.Error("Change remark name in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.ChangeRemarkNameResponse{IsFriend: true, Succeed: true}, nil
}

func (s *FriendManagerServer) DeleteFriend(_ context.Context, req *pb.DeleteFriendRequest) (*pb.DeleteFriendResponse, error) {
	s.logger.Infof("Get DeleteFriend Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	aId, bId := req.Id, req.FriendId
	collection := mongodbClient.Database("Friend").Collection(aId)
	_, err := collection.DeleteOne(context.Background(), bson.M{"id": bId})
	if err != nil {
		s.logger.Error("Delete friend in MongoDB Failed: ", err)
		return nil, err
	}
	collection = mongodbClient.Database("Friend").Collection(bId)
	_, err = collection.DeleteOne(context.Background(), bson.M{"id": aId})
	if err != nil {
		s.logger.Error("Delete friend in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.DeleteFriendResponse{Succeed: true}, nil
}

func (s *FriendManagerServer) GetFriends(_ context.Context, req *pb.GetFriendsRequest) (*pb.GetFriendsResponse, error) {
	s.logger.Infof("Get GetFriends Request: %v", req)

	collection := mongodbClient.Database("Friend").Collection(req.Id)
	cur, err := collection.Find(context.Background(), bson.M{})
	if err != nil {
		s.logger.Error("Find friends in MongoDB Failed: ", err)
		return nil, err
	}
	var friends []FriendInfo
	err = cur.All(context.Background(), &friends)
	if err != nil {
		s.logger.Error("Decode friends info Failed: ", err)
		return nil, err
	}

	var ids []string
	for _, friend := range friends {
		ids = append(ids, friend.Id)
	}
	return &pb.GetFriendsResponse{Ids: ids}, nil
}

func (s *FriendManagerServer) GetNewFriendRequests(_ context.Context, req *pb.GetNewFriendRequestsRequest) (*pb.GetNewFriendRequestsResponse, error) {
	s.logger.Infof("Get GetNewFriendRequests Request: %v", req)

	collection := mongodbClient.Database("NewFriendRequest").Collection(req.Id)
	cur, err := collection.Find(context.Background(), bson.M{}, &options.FindOptions{Sort: bson.M{"requestId": -1}})
	if err != nil {
		s.logger.Error("Find NewFriendRequests in MongoDB Failed: ", err)
		return nil, err
	}
	var requests []*pb.NewFriendRequest
	err = cur.All(context.Background(), &requests)
	if err != nil {
		s.logger.Error("Decode NewFriendRequests info Failed: ", err)
		return nil, err
	}
	return &pb.GetNewFriendRequestsResponse{Requests: requests}, nil
}

func (s *FriendManagerServer) SendNewFriendRequest(_ context.Context, req *pb.NewFriendRequest) (*pb.SendNewFriendRequestResponse, error) {
	s.logger.Infof("Get SendNewFriendRequests Request: %v", req)

	id, err := s.getAndAddMaxRequestId()
	if err != nil {
		s.logger.Error("Get and add MaxRequestId in MongoDB Failed: ", err)
		return nil, err
	}
	req.RequestId = id
	req.State = pb.NewFriendRequestState_WAIT_FOR_ACCEPT
	req.ToRemarkName = ""

	collection := mongodbClient.Database("NewFriendRequest").Collection(req.FromId)
	_, err = collection.InsertOne(context.Background(), req)
	if err != nil {
		s.logger.Error("Insert a NewFriendRequest in MongoDB Failed: ", err)
		return nil, err
	}

	collection = mongodbClient.Database("NewFriendRequest").Collection(req.ToId)
	_, err = collection.InsertOne(context.Background(), req)
	if err != nil {
		s.logger.Error("Insert a NewFriendRequest in MongoDB Failed: ", err)
		return nil, err
	}

	return &pb.SendNewFriendRequestResponse{Succeed: true}, nil
}

func (s *FriendManagerServer) getAndAddMaxRequestId() (int64, error) {
	type Count struct {
		Name  string `bson:"name"`
		MaxId int64  `bson:"maxId"`
	}

	collection := mongodbClient.Database("NewFriendRequest").Collection("count")
	res := collection.FindOne(context.Background(), bson.M{"name": "maxRequestId"})
	if res.Err() == mongo.ErrNoDocuments {
		_, err := collection.InsertOne(context.Background(), bson.M{"name": "maxRequestId", "maxId": 1})
		return 0, err
	}
	if res.Err() != nil {
		return 0, res.Err()
	}
	count := &Count{}
	err := res.Decode(count)
	if err != nil {
		return 0, err
	}
	filter := bson.M{"name": "maxRequestId"}
	update := bson.M{"$set": bson.M{"maxId": count.MaxId + 1}}
	_, err = collection.UpdateOne(context.Background(), filter, update)
	if err != nil {
		return 0, err
	}
	return count.MaxId, nil
}
