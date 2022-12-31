package ChatStream

import (
	"github.com/gorilla/websocket"
	pb "lightchat_server/ChatManager/proto"
)

type Signal int8

type Server struct {
	Conn    *websocket.Conn
	Chan    chan *pb.MessageTile
	Close   chan Signal
	isClose bool
}

func (s *Server) Serve() {
	for {
		select {
		case message := <-s.Chan:
			err := s.Conn.WriteJSON(message)
			if err != nil {
				streamServer.logger.Infof("Lost Connection from %s: %s", s.Conn.RemoteAddr().String(), err)
				s.isClose = true
				return
			}
		case <-s.Close:
			s.isClose = true
			return
		}
	}
}
