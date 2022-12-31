// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.21.1
// source: proto/MessageManager.proto

package proto

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// MessageManagerClient is the client API for MessageManager service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type MessageManagerClient interface {
	CreateSession(ctx context.Context, in *CreateSessionRequest, opts ...grpc.CallOption) (*CreateSessionResponse, error)
	GetMessages(ctx context.Context, in *GetMessagesRequest, opts ...grpc.CallOption) (*GetMessagesResponse, error)
	GetSessionList(ctx context.Context, in *GetSessionListRequest, opts ...grpc.CallOption) (*GetSessionListResponse, error)
	Search(ctx context.Context, in *SearchRequest, opts ...grpc.CallOption) (*SearchResponse, error)
	SendMessage(ctx context.Context, in *MessageTile, opts ...grpc.CallOption) (*SendMessageResponse, error)
}

type messageManagerClient struct {
	cc grpc.ClientConnInterface
}

func NewMessageManagerClient(cc grpc.ClientConnInterface) MessageManagerClient {
	return &messageManagerClient{cc}
}

func (c *messageManagerClient) CreateSession(ctx context.Context, in *CreateSessionRequest, opts ...grpc.CallOption) (*CreateSessionResponse, error) {
	out := new(CreateSessionResponse)
	err := c.cc.Invoke(ctx, "/MessageManager/createSession", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *messageManagerClient) GetMessages(ctx context.Context, in *GetMessagesRequest, opts ...grpc.CallOption) (*GetMessagesResponse, error) {
	out := new(GetMessagesResponse)
	err := c.cc.Invoke(ctx, "/MessageManager/getMessages", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *messageManagerClient) GetSessionList(ctx context.Context, in *GetSessionListRequest, opts ...grpc.CallOption) (*GetSessionListResponse, error) {
	out := new(GetSessionListResponse)
	err := c.cc.Invoke(ctx, "/MessageManager/getSessionList", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *messageManagerClient) Search(ctx context.Context, in *SearchRequest, opts ...grpc.CallOption) (*SearchResponse, error) {
	out := new(SearchResponse)
	err := c.cc.Invoke(ctx, "/MessageManager/search", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *messageManagerClient) SendMessage(ctx context.Context, in *MessageTile, opts ...grpc.CallOption) (*SendMessageResponse, error) {
	out := new(SendMessageResponse)
	err := c.cc.Invoke(ctx, "/MessageManager/sendMessage", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// MessageManagerServer is the server API for MessageManager service.
// All implementations should embed UnimplementedMessageManagerServer
// for forward compatibility
type MessageManagerServer interface {
	CreateSession(context.Context, *CreateSessionRequest) (*CreateSessionResponse, error)
	GetMessages(context.Context, *GetMessagesRequest) (*GetMessagesResponse, error)
	GetSessionList(context.Context, *GetSessionListRequest) (*GetSessionListResponse, error)
	Search(context.Context, *SearchRequest) (*SearchResponse, error)
	SendMessage(context.Context, *MessageTile) (*SendMessageResponse, error)
}

// UnimplementedMessageManagerServer should be embedded to have forward compatible implementations.
type UnimplementedMessageManagerServer struct {
}

func (UnimplementedMessageManagerServer) CreateSession(context.Context, *CreateSessionRequest) (*CreateSessionResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method CreateSession not implemented")
}
func (UnimplementedMessageManagerServer) GetMessages(context.Context, *GetMessagesRequest) (*GetMessagesResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetMessages not implemented")
}
func (UnimplementedMessageManagerServer) GetSessionList(context.Context, *GetSessionListRequest) (*GetSessionListResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetSessionList not implemented")
}
func (UnimplementedMessageManagerServer) Search(context.Context, *SearchRequest) (*SearchResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Search not implemented")
}
func (UnimplementedMessageManagerServer) SendMessage(context.Context, *MessageTile) (*SendMessageResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SendMessage not implemented")
}

// UnsafeMessageManagerServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to MessageManagerServer will
// result in compilation errors.
type UnsafeMessageManagerServer interface {
	mustEmbedUnimplementedMessageManagerServer()
}

func RegisterMessageManagerServer(s grpc.ServiceRegistrar, srv MessageManagerServer) {
	s.RegisterService(&MessageManager_ServiceDesc, srv)
}

func _MessageManager_CreateSession_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(CreateSessionRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MessageManagerServer).CreateSession(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/MessageManager/createSession",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MessageManagerServer).CreateSession(ctx, req.(*CreateSessionRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _MessageManager_GetMessages_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetMessagesRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MessageManagerServer).GetMessages(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/MessageManager/getMessages",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MessageManagerServer).GetMessages(ctx, req.(*GetMessagesRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _MessageManager_GetSessionList_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(GetSessionListRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MessageManagerServer).GetSessionList(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/MessageManager/getSessionList",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MessageManagerServer).GetSessionList(ctx, req.(*GetSessionListRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _MessageManager_Search_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(SearchRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MessageManagerServer).Search(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/MessageManager/search",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MessageManagerServer).Search(ctx, req.(*SearchRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _MessageManager_SendMessage_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(MessageTile)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MessageManagerServer).SendMessage(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/MessageManager/sendMessage",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MessageManagerServer).SendMessage(ctx, req.(*MessageTile))
	}
	return interceptor(ctx, in, info, handler)
}

// MessageManager_ServiceDesc is the grpc.ServiceDesc for MessageManager service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var MessageManager_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "MessageManager",
	HandlerType: (*MessageManagerServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "createSession",
			Handler:    _MessageManager_CreateSession_Handler,
		},
		{
			MethodName: "getMessages",
			Handler:    _MessageManager_GetMessages_Handler,
		},
		{
			MethodName: "getSessionList",
			Handler:    _MessageManager_GetSessionList_Handler,
		},
		{
			MethodName: "search",
			Handler:    _MessageManager_Search_Handler,
		},
		{
			MethodName: "sendMessage",
			Handler:    _MessageManager_SendMessage_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "proto/MessageManager.proto",
}