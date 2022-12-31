package handler

import pb "lightchat_server/UserManager/proto"

type User struct {
	Id       string    `bson:"id"`
	Number   string    `bson:"number"`
	Password string    `bson:"password"`
	Name     string    `bson:"name"`
	Gender   pb.Gender `bson:"gender"`
}
