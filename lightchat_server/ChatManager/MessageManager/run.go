package MessageManager

import (
	"github.com/heejinzzz/clog"
	"google.golang.org/grpc"
	"lightchat_server/ChatManager/MessageManager/handler"
	pb "lightchat_server/ChatManager/proto"
	"net"
	"os"
	"sync"
)

const serverAddr = ":7064"

func RunMessageManager(wg *sync.WaitGroup) {
	defer wg.Done()
	logger := clog.New(os.Stdout, "[MessageManager] ")

	lis, err := net.Listen("tcp", serverAddr)
	if err != nil {
		logger.Fatalf("Listen %v Failed", serverAddr)
		panic(err)
	}

	grpcServer := grpc.NewServer()
	pb.RegisterMessageManagerServer(grpcServer, handler.NewMessageManagerServer(logger))
	logger.Debug("MessageManager Start")
	logger.Fatal("Start MessageManager Failed: ", grpcServer.Serve(lis))
}
