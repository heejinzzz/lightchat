package main

import (
	"github.com/heejinzzz/clog"
	"google.golang.org/grpc"
	"lightchat_server/FriendManager/handler"
	pb "lightchat_server/FriendManager/proto"
	"net"
	"os"
)

const ServerAddr = ":7062"

func main() {
	logger := clog.New(os.Stdout, "[FriendManager]")

	lis, err := net.Listen("tcp", ServerAddr)
	if err != nil {
		logger.Fatalf("Listen %v Failed", ServerAddr)
		panic(err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterFriendManagerServer(grpcServer, handler.NewFriendManagerServer(logger))
	logger.Debug("Server Start")
	logger.Fatal("Start Server Failed: ", grpcServer.Serve(lis))
}
