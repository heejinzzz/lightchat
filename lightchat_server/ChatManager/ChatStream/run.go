package ChatStream

import (
	"github.com/gorilla/websocket"
	"github.com/heejinzzz/clog"
	pb "lightchat_server/ChatManager/proto"
	"net/http"
	"os"
	"strings"
	"sync"
)

const serverAddr = ":7065"

var streamServer *StreamServer

type StreamServer struct {
	logger   *clog.Logger
	servers  map[string]*Server // key:userId, value:*Server
	upgrader websocket.Upgrader
	mutex    sync.Mutex // protect `Servers`
}

func (s *StreamServer) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	s.logger.Infof("Get connect request from: %s", req.RemoteAddr)

	conn, err := s.upgrader.Upgrade(w, req, nil)
	if err != nil {
		s.logger.Errorf("Upgrade connection from %s failed: %s", req.RemoteAddr, err)
		return
	}
	_, userId, err := conn.ReadMessage()
	if err != nil {
		s.logger.Errorf("Read userId from connection(%s) failed: %s", req.RemoteAddr, err)
		return
	}
	s.mutex.Lock()
	if server, ok := s.servers[string(userId)]; ok {
		server.Close <- 0
		s.servers[string(userId)] = nil
		delete(s.servers, string(userId))
	}
	server := &Server{
		Conn:    conn,
		Chan:    make(chan *pb.MessageTile, 10),
		Close:   make(chan Signal, 1),
		isClose: false,
	}
	s.servers[string(userId)] = server
	s.mutex.Unlock()
	go server.Serve()
}

func TrySendMessage(message *pb.MessageTile) {
	pieces := strings.Split(message.MessageId, "-")
	userId := pieces[0]
	if pieces[0] == message.UserId {
		userId = pieces[1]
	}
	server := streamServer.servers[userId]
	if server != nil && !server.isClose {
		server.Chan <- message
	}
}

func RunChatStream(wg *sync.WaitGroup) {
	defer wg.Done()
	upgrader := websocket.Upgrader{
		ReadBufferSize:  1024 * 1024,
		WriteBufferSize: 1024 * 1024,
	}
	logger := clog.New(os.Stdout, "[ChatStream]     ")
	streamServer = &StreamServer{
		logger:   logger,
		servers:  map[string]*Server{},
		upgrader: upgrader,
	}
	logger.Debug("ChatStream Start")
	logger.Fatalf("Start ChatStream Failed: %s", http.ListenAndServe(serverAddr, streamServer))
}
