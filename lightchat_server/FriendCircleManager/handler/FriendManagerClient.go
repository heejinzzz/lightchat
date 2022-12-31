package handler

import (
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	pb "lightchat_server/FriendCircleManager/proto"
)

const FriendManagerAddr = "LightChat-FriendManager:7062"

var FriendManagerClient pb.FriendManagerClient

func ConnectFriendManager() {
	conn, err := grpc.Dial(FriendManagerAddr, grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		panic(err)
	}

	FriendManagerClient = pb.NewFriendManagerClient(conn)
}
