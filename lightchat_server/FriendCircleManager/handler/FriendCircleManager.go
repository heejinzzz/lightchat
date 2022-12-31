package handler

import (
	"context"
	"github.com/heejinzzz/clog"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	pb "lightchat_server/FriendCircleManager/proto"
	"sort"
	"sync"
)

type FriendCircleManagerServer struct {
	logger *clog.Logger
	mutex  sync.Mutex
}

func NewFriendCircleManagerServer(logger *clog.Logger) *FriendCircleManagerServer {
	return &FriendCircleManagerServer{logger: logger}
}

func (s *FriendCircleManagerServer) findUserRecord(userId string) (*UserRecord, error) {
	collection := mongodbClient.Database("FriendCircle").Collection("UserRecord")
	res := collection.FindOne(context.Background(), bson.M{"id": userId})
	if res.Err() == mongo.ErrNoDocuments {
		return &UserRecord{Id: userId, FriendCircles: []int64{}}, res.Err()
	}
	if res.Err() != nil {
		return nil, res.Err()
	}
	userRecord := &UserRecord{}
	err := res.Decode(userRecord)
	if err != nil {
		return nil, err
	}
	return userRecord, nil
}

func (s *FriendCircleManagerServer) replaceUserRecord(userRecord *UserRecord) error {
	collection := mongodbClient.Database("FriendCircle").Collection("UserRecord")
	_, err := collection.ReplaceOne(context.Background(), bson.M{"id": userRecord.Id}, userRecord)
	return err
}

func (s *FriendCircleManagerServer) insertUserRecord(userRecord *UserRecord) error {
	collection := mongodbClient.Database("FriendCircle").Collection("UserRecord")
	_, err := collection.InsertOne(context.Background(), userRecord)
	return err
}

func (s *FriendCircleManagerServer) findFriendCircle(id int64) (*pb.FriendCircle, error) {
	collection := mongodbClient.Database("FriendCircle").Collection("FriendCircle")
	res := collection.FindOne(context.Background(), bson.M{"id": id})
	if res.Err() != nil {
		return nil, res.Err()
	}
	friendCircle := &pb.FriendCircle{}
	err := res.Decode(friendCircle)
	if err != nil {
		return nil, err
	}
	return friendCircle, nil
}

func (s *FriendCircleManagerServer) replaceFriendCircle(friendCircle *pb.FriendCircle) error {
	collection := mongodbClient.Database("FriendCircle").Collection("FriendCircle")
	_, err := collection.ReplaceOne(context.Background(), bson.M{"id": friendCircle.Id}, friendCircle)
	return err
}

func (s *FriendCircleManagerServer) insertFriendCircle(friendCircle *pb.FriendCircle) error {
	collection := mongodbClient.Database("FriendCircle").Collection("FriendCircle")
	_, err := collection.InsertOne(context.Background(), friendCircle)
	return err
}

func (s *FriendCircleManagerServer) getAndAddMaxId() (int64, error) {
	collection := mongodbClient.Database("FriendCircle").Collection("count")
	res := collection.FindOne(context.Background(), bson.M{"name": "friendCircleMaxId"})
	if res.Err() == mongo.ErrNoDocuments {
		_, err := collection.InsertOne(context.Background(), bson.M{"name": "friendCircleMaxId", "value": 1})
		return 0, err
	}
	if res.Err() != nil {
		return 0, res.Err()
	}
	temp := &struct {
		Name  string `bson:"name"`
		Value int64  `bson:"value"`
	}{}
	err := res.Decode(temp)
	if err != nil {
		return 0, err
	}
	_, err = collection.UpdateOne(context.Background(), bson.M{"name": "friendCircleMaxId"}, bson.M{"$set": bson.M{"value": temp.Value + 1}})
	if err != nil {
		return 0, err
	}
	return temp.Value, nil
}

func (s *FriendCircleManagerServer) Delete(_ context.Context, req *pb.DeleteRequest) (*pb.DeleteResponse, error) {
	s.logger.Infof("Get Delete Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	record, err := s.findUserRecord(req.UserId)
	if err != nil {
		s.logger.Error("Find UserRecord in MongoDB Failed: ", err)
		return nil, err
	}
	for i, friendCircleId := range record.FriendCircles {
		if friendCircleId == req.FriendCircleId {
			record.FriendCircles = append(record.FriendCircles[:i], record.FriendCircles[i+1:]...)
			break
		}
	}
	err = s.replaceUserRecord(record)
	if err != nil {
		s.logger.Error("Replace UserRecord in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.DeleteResponse{Succeed: true}, nil
}

func (s *FriendCircleManagerServer) Publish(_ context.Context, req *pb.FriendCircle) (*pb.PublishResponse, error) {
	s.logger.Infof("Get Publish Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	maxId, err := s.getAndAddMaxId()
	if err != nil {
		s.logger.Error("Get FriendCircle MaxId in MongoDB Failed: ", err)
		return nil, err
	}
	req.Id = maxId
	err = s.insertFriendCircle(req)
	if err != nil {
		s.logger.Error("Insert FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	record, err := s.findUserRecord(req.UserId)
	if err == mongo.ErrNoDocuments {
		record.FriendCircles = append(record.FriendCircles, maxId)
		err = s.insertUserRecord(record)
		if err != nil {
			s.logger.Error("Insert UserRecord in MongoDB Failed: ", err)
			return nil, err
		}
		return &pb.PublishResponse{Succeed: true, Id: maxId}, nil
	}
	if err != nil {
		s.logger.Error("Find UserRecord in MongoDB Failed: ", err)
		return nil, err
	}
	record.FriendCircles = append(record.FriendCircles, maxId)
	err = s.replaceUserRecord(record)
	if err != nil {
		s.logger.Error("Replace UserRecord in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.PublishResponse{Succeed: true, Id: maxId}, nil
}

func (s *FriendCircleManagerServer) SendComment(_ context.Context, req *pb.SendCommentRequest) (*pb.SendCommentResponse, error) {
	s.logger.Infof("Get SendComment Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	friendCircle, err := s.findFriendCircle(req.FriendCircleId)
	if err != nil {
		s.logger.Error("Find FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	friendCircle.Comments = append(friendCircle.Comments, req.Comment)
	err = s.replaceFriendCircle(friendCircle)
	if err != nil {
		s.logger.Error("Replace FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.SendCommentResponse{Succeed: true}, nil
}

func (s *FriendCircleManagerServer) Thumb(_ context.Context, req *pb.ThumbRequest) (*pb.ThumbResponse, error) {
	s.logger.Infof("Get Thumb Request: %v", req)

	s.mutex.Lock()
	defer s.mutex.Unlock()

	friendCircle, err := s.findFriendCircle(req.FriendCircleId)
	if err != nil {
		s.logger.Error("Find FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	if req.Type == pb.ThumbType_THUMB_UP {
		exist := false
		for _, id := range friendCircle.ThumbUpIds {
			if id == req.UserId {
				exist = true
				break
			}
		}
		if !exist {
			friendCircle.ThumbUpIds = append(friendCircle.ThumbUpIds, req.UserId)
		}
	} else {
		for i, id := range friendCircle.ThumbUpIds {
			if id == req.UserId {
				friendCircle.ThumbUpIds = append(friendCircle.ThumbUpIds[:i], friendCircle.ThumbUpIds[i+1:]...)
				break
			}
		}
	}
	err = s.replaceFriendCircle(friendCircle)
	if err != nil {
		s.logger.Error("Replace FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	return &pb.ThumbResponse{Succeed: true}, nil
}

func (s *FriendCircleManagerServer) GetDetail(_ context.Context, req *pb.GetDetailRequest) (*pb.FriendCircle, error) {
	s.logger.Infof("Get GetDetail Request: %v", req)

	friendCircle, err := s.findFriendCircle(req.Id)
	if err != nil {
		s.logger.Error("Find FriendCircle in MongoDB Failed: ", err)
		return nil, err
	}
	return friendCircle, nil
}

func (s *FriendCircleManagerServer) GetFriendCircles(_ context.Context, req *pb.GetFriendCirclesRequest) (*pb.GetFriendCirclesResponse, error) {
	s.logger.Infof("Get GetFriendCircles Request: %v", req)

	if !req.Broadcast {
		record, err := s.findUserRecord(req.UserId)
		if err != mongo.ErrNoDocuments && err != nil {
			s.logger.Error("Find UserRecord in MongoDB Failed: ", err)
			return nil, err
		}
		temp := ReverseSort(record.FriendCircles)
		sort.Sort(temp)
		return &pb.GetFriendCirclesResponse{Ids: temp}, nil
	}
	response, err := FriendManagerClient.GetFriends(context.Background(), &pb.GetFriendsRequest{Id: req.UserId})
	if err != nil {
		s.logger.Error("Find Friends from FriendManager Failed: ", err)
		return nil, err
	}
	temp := ReverseSort{}
	for _, id := range response.Ids {
		record, err := s.findUserRecord(id)
		if err != mongo.ErrNoDocuments && err != nil {
			s.logger.Error("Find UserRecord in MongoDB Failed: ", err)
			return nil, err
		}
		temp = append(temp, record.FriendCircles...)
	}
	record, err := s.findUserRecord(req.UserId)
	if err != mongo.ErrNoDocuments && err != nil {
		s.logger.Error("Find UserRecord in MongoDB Failed: ", err)
		return nil, err
	}
	temp = append(temp, record.FriendCircles...)
	sort.Sort(temp)
	return &pb.GetFriendCirclesResponse{Ids: temp}, nil
}

type ReverseSort []int64

func (list ReverseSort) Len() int {
	return len(list)
}

func (list ReverseSort) Less(i, j int) bool {
	return list[i] > list[j]
}

func (list ReverseSort) Swap(i, j int) {
	list[i], list[j] = list[j], list[i]
}
