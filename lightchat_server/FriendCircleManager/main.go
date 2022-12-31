package main

import (
	"github.com/heejinzzz/clog"
	"google.golang.org/grpc"
	"lightchat_server/FriendCircleManager/handler"
	pb "lightchat_server/FriendCircleManager/proto"
	"net"
	"os"
)

const ServerAddr = ":7063"

func main() {
	logger := clog.New(os.Stdout, "[FriendCircleManager]")

	lis, err := net.Listen("tcp", ServerAddr)
	if err != nil {
		logger.Fatalf("Listen %v Failed", ServerAddr)
		panic(err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterFriendCircleManagerServer(grpcServer, handler.NewFriendCircleManagerServer(logger))
	logger.Debug("Server Start")
	logger.Fatal("Start Server Failed: ", grpcServer.Serve(lis))
}
