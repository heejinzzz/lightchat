package main

import (
	"github.com/heejinzzz/clog"
	"google.golang.org/grpc"
	"lightchat_server/UserManager/handler"
	pb "lightchat_server/UserManager/proto"
	"net"
	"os"
)

var ServerAddr = ":7060"

func main() {
	logger := clog.New(os.Stdout, "[UserManager]")

	lis, err := net.Listen("tcp", ServerAddr)
	if err != nil {
		logger.Fatalf("Listen %v Failed", ServerAddr)
		panic(err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterUserManagerServer(grpcServer, handler.NewUserManagerServer(logger))
	logger.Debug("Server Start")
	logger.Fatal("Start Server Failed: ", grpcServer.Serve(lis))
}
