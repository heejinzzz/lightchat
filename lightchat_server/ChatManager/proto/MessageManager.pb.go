// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.21.1
// source: proto/MessageManager.proto

package proto

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type GetRequestType int32

const (
	GetRequestType_CHAT    GetRequestType = 0
	GetRequestType_HISTORY GetRequestType = 1
)

// Enum value maps for GetRequestType.
var (
	GetRequestType_name = map[int32]string{
		0: "CHAT",
		1: "HISTORY",
	}
	GetRequestType_value = map[string]int32{
		"CHAT":    0,
		"HISTORY": 1,
	}
)

func (x GetRequestType) Enum() *GetRequestType {
	p := new(GetRequestType)
	*p = x
	return p
}

func (x GetRequestType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (GetRequestType) Descriptor() protoreflect.EnumDescriptor {
	return file_proto_MessageManager_proto_enumTypes[0].Descriptor()
}

func (GetRequestType) Type() protoreflect.EnumType {
	return &file_proto_MessageManager_proto_enumTypes[0]
}

func (x GetRequestType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use GetRequestType.Descriptor instead.
func (GetRequestType) EnumDescriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{0}
}

type MessageType int32

const (
	MessageType_TEXT  MessageType = 0
	MessageType_IMAGE MessageType = 1
	MessageType_VIDEO MessageType = 2
	MessageType_FILE  MessageType = 3
)

// Enum value maps for MessageType.
var (
	MessageType_name = map[int32]string{
		0: "TEXT",
		1: "IMAGE",
		2: "VIDEO",
		3: "FILE",
	}
	MessageType_value = map[string]int32{
		"TEXT":  0,
		"IMAGE": 1,
		"VIDEO": 2,
		"FILE":  3,
	}
)

func (x MessageType) Enum() *MessageType {
	p := new(MessageType)
	*p = x
	return p
}

func (x MessageType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (MessageType) Descriptor() protoreflect.EnumDescriptor {
	return file_proto_MessageManager_proto_enumTypes[1].Descriptor()
}

func (MessageType) Type() protoreflect.EnumType {
	return &file_proto_MessageManager_proto_enumTypes[1]
}

func (x MessageType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use MessageType.Descriptor instead.
func (MessageType) EnumDescriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{1}
}

type MessageTile struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MessageId string      `protobuf:"bytes,1,opt,name=messageId,proto3" json:"messageId,omitempty" bson:"messageId"`
	CountId   int64       `protobuf:"varint,2,opt,name=countId,proto3" json:"countId,omitempty" bson:"countId"`
	UserId    string      `protobuf:"bytes,3,opt,name=userId,proto3" json:"userId,omitempty" bson:"userId"`
	Type      MessageType `protobuf:"varint,4,opt,name=type,proto3,enum=MessageType" json:"type,omitempty" bson:"type"`
	Content   string      `protobuf:"bytes,5,opt,name=content,proto3" json:"content,omitempty" bson:"content"`
	Size      int64       `protobuf:"varint,6,opt,name=size,proto3" json:"size,omitempty" bson:"size"`
	Timestamp int64       `protobuf:"varint,7,opt,name=timestamp,proto3" json:"timestamp,omitempty" bson:"timestamp"`
}

func (x *MessageTile) Reset() {
	*x = MessageTile{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *MessageTile) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*MessageTile) ProtoMessage() {}

func (x *MessageTile) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use MessageTile.ProtoReflect.Descriptor instead.
func (*MessageTile) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{0}
}

func (x *MessageTile) GetMessageId() string {
	if x != nil {
		return x.MessageId
	}
	return ""
}

func (x *MessageTile) GetCountId() int64 {
	if x != nil {
		return x.CountId
	}
	return 0
}

func (x *MessageTile) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *MessageTile) GetType() MessageType {
	if x != nil {
		return x.Type
	}
	return MessageType_TEXT
}

func (x *MessageTile) GetContent() string {
	if x != nil {
		return x.Content
	}
	return ""
}

func (x *MessageTile) GetSize() int64 {
	if x != nil {
		return x.Size
	}
	return 0
}

func (x *MessageTile) GetTimestamp() int64 {
	if x != nil {
		return x.Timestamp
	}
	return 0
}

type CreateSessionRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionId string `protobuf:"bytes,1,opt,name=sessionId,proto3" json:"sessionId,omitempty"`
	UserId    string `protobuf:"bytes,2,opt,name=userId,proto3" json:"userId,omitempty"`
}

func (x *CreateSessionRequest) Reset() {
	*x = CreateSessionRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateSessionRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateSessionRequest) ProtoMessage() {}

func (x *CreateSessionRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateSessionRequest.ProtoReflect.Descriptor instead.
func (*CreateSessionRequest) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{1}
}

func (x *CreateSessionRequest) GetSessionId() string {
	if x != nil {
		return x.SessionId
	}
	return ""
}

func (x *CreateSessionRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

type CreateSessionResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Succeed bool `protobuf:"varint,1,opt,name=succeed,proto3" json:"succeed,omitempty"`
}

func (x *CreateSessionResponse) Reset() {
	*x = CreateSessionResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *CreateSessionResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*CreateSessionResponse) ProtoMessage() {}

func (x *CreateSessionResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use CreateSessionResponse.ProtoReflect.Descriptor instead.
func (*CreateSessionResponse) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{2}
}

func (x *CreateSessionResponse) GetSucceed() bool {
	if x != nil {
		return x.Succeed
	}
	return false
}

type GetMessagesRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	SessionId       string         `protobuf:"bytes,1,opt,name=sessionId,proto3" json:"sessionId,omitempty"`
	Type            GetRequestType `protobuf:"varint,2,opt,name=type,proto3,enum=GetRequestType" json:"type,omitempty"`
	TargetMessageId string         `protobuf:"bytes,3,opt,name=targetMessageId,proto3" json:"targetMessageId,omitempty"`
	IsStartPage     bool           `protobuf:"varint,4,opt,name=isStartPage,proto3" json:"isStartPage,omitempty"`
	LastMessageId   string         `protobuf:"bytes,5,opt,name=lastMessageId,proto3" json:"lastMessageId,omitempty"`
}

func (x *GetMessagesRequest) Reset() {
	*x = GetMessagesRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetMessagesRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetMessagesRequest) ProtoMessage() {}

func (x *GetMessagesRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetMessagesRequest.ProtoReflect.Descriptor instead.
func (*GetMessagesRequest) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{3}
}

func (x *GetMessagesRequest) GetSessionId() string {
	if x != nil {
		return x.SessionId
	}
	return ""
}

func (x *GetMessagesRequest) GetType() GetRequestType {
	if x != nil {
		return x.Type
	}
	return GetRequestType_CHAT
}

func (x *GetMessagesRequest) GetTargetMessageId() string {
	if x != nil {
		return x.TargetMessageId
	}
	return ""
}

func (x *GetMessagesRequest) GetIsStartPage() bool {
	if x != nil {
		return x.IsStartPage
	}
	return false
}

func (x *GetMessagesRequest) GetLastMessageId() string {
	if x != nil {
		return x.LastMessageId
	}
	return ""
}

type GetMessagesResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Messages   []*MessageTile `protobuf:"bytes,1,rep,name=messages,proto3" json:"messages,omitempty"`
	IsLastPage bool           `protobuf:"varint,2,opt,name=isLastPage,proto3" json:"isLastPage,omitempty"`
}

func (x *GetMessagesResponse) Reset() {
	*x = GetMessagesResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetMessagesResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetMessagesResponse) ProtoMessage() {}

func (x *GetMessagesResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetMessagesResponse.ProtoReflect.Descriptor instead.
func (*GetMessagesResponse) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{4}
}

func (x *GetMessagesResponse) GetMessages() []*MessageTile {
	if x != nil {
		return x.Messages
	}
	return nil
}

func (x *GetMessagesResponse) GetIsLastPage() bool {
	if x != nil {
		return x.IsLastPage
	}
	return false
}

type GetSessionListRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserId string `protobuf:"bytes,1,opt,name=userId,proto3" json:"userId,omitempty"`
}

func (x *GetSessionListRequest) Reset() {
	*x = GetSessionListRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetSessionListRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetSessionListRequest) ProtoMessage() {}

func (x *GetSessionListRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetSessionListRequest.ProtoReflect.Descriptor instead.
func (*GetSessionListRequest) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{5}
}

func (x *GetSessionListRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

type GetSessionListResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Messages []*MessageTile `protobuf:"bytes,1,rep,name=messages,proto3" json:"messages,omitempty"`
}

func (x *GetSessionListResponse) Reset() {
	*x = GetSessionListResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetSessionListResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetSessionListResponse) ProtoMessage() {}

func (x *GetSessionListResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetSessionListResponse.ProtoReflect.Descriptor instead.
func (*GetSessionListResponse) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{6}
}

func (x *GetSessionListResponse) GetMessages() []*MessageTile {
	if x != nil {
		return x.Messages
	}
	return nil
}

type SearchRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserId  string `protobuf:"bytes,1,opt,name=userId,proto3" json:"userId,omitempty"`
	Keyword string `protobuf:"bytes,2,opt,name=keyword,proto3" json:"keyword,omitempty"`
}

func (x *SearchRequest) Reset() {
	*x = SearchRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SearchRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SearchRequest) ProtoMessage() {}

func (x *SearchRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SearchRequest.ProtoReflect.Descriptor instead.
func (*SearchRequest) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{7}
}

func (x *SearchRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *SearchRequest) GetKeyword() string {
	if x != nil {
		return x.Keyword
	}
	return ""
}

type SearchResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Messages []*MessageTile `protobuf:"bytes,1,rep,name=messages,proto3" json:"messages,omitempty"`
}

func (x *SearchResponse) Reset() {
	*x = SearchResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[8]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SearchResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SearchResponse) ProtoMessage() {}

func (x *SearchResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[8]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SearchResponse.ProtoReflect.Descriptor instead.
func (*SearchResponse) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{8}
}

func (x *SearchResponse) GetMessages() []*MessageTile {
	if x != nil {
		return x.Messages
	}
	return nil
}

type SendMessageResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MessageId string `protobuf:"bytes,1,opt,name=messageId,proto3" json:"messageId,omitempty"`
}

func (x *SendMessageResponse) Reset() {
	*x = SendMessageResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_MessageManager_proto_msgTypes[9]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SendMessageResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SendMessageResponse) ProtoMessage() {}

func (x *SendMessageResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_MessageManager_proto_msgTypes[9]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SendMessageResponse.ProtoReflect.Descriptor instead.
func (*SendMessageResponse) Descriptor() ([]byte, []int) {
	return file_proto_MessageManager_proto_rawDescGZIP(), []int{9}
}

func (x *SendMessageResponse) GetMessageId() string {
	if x != nil {
		return x.MessageId
	}
	return ""
}

var File_proto_MessageManager_proto protoreflect.FileDescriptor

var file_proto_MessageManager_proto_rawDesc = []byte{
	0x0a, 0x1a, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x4d,
	0x61, 0x6e, 0x61, 0x67, 0x65, 0x72, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xcb, 0x01, 0x0a,
	0x0b, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x54, 0x69, 0x6c, 0x65, 0x12, 0x1c, 0x0a, 0x09,
	0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x09, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x63, 0x6f,
	0x75, 0x6e, 0x74, 0x49, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x03, 0x52, 0x07, 0x63, 0x6f, 0x75,
	0x6e, 0x74, 0x49, 0x64, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12, 0x20, 0x0a, 0x04,
	0x74, 0x79, 0x70, 0x65, 0x18, 0x04, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x0c, 0x2e, 0x4d, 0x65, 0x73,
	0x73, 0x61, 0x67, 0x65, 0x54, 0x79, 0x70, 0x65, 0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x12, 0x18,
	0x0a, 0x07, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x07, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x12, 0x12, 0x0a, 0x04, 0x73, 0x69, 0x7a, 0x65,
	0x18, 0x06, 0x20, 0x01, 0x28, 0x03, 0x52, 0x04, 0x73, 0x69, 0x7a, 0x65, 0x12, 0x1c, 0x0a, 0x09,
	0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x18, 0x07, 0x20, 0x01, 0x28, 0x03, 0x52,
	0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x22, 0x4c, 0x0a, 0x14, 0x43, 0x72,
	0x65, 0x61, 0x74, 0x65, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x73, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x64, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x73, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x64,
	0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x22, 0x31, 0x0a, 0x15, 0x43, 0x72, 0x65, 0x61,
	0x74, 0x65, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x65, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x65, 0x64, 0x22, 0xc9, 0x01, 0x0a, 0x12,
	0x47, 0x65, 0x74, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x73, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x64, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x73, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x49, 0x64,
	0x12, 0x23, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x0f,
	0x2e, 0x47, 0x65, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x54, 0x79, 0x70, 0x65, 0x52,
	0x04, 0x74, 0x79, 0x70, 0x65, 0x12, 0x28, 0x0a, 0x0f, 0x74, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0f,
	0x74, 0x61, 0x72, 0x67, 0x65, 0x74, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64, 0x12,
	0x20, 0x0a, 0x0b, 0x69, 0x73, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x67, 0x65, 0x18, 0x04,
	0x20, 0x01, 0x28, 0x08, 0x52, 0x0b, 0x69, 0x73, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x61, 0x67,
	0x65, 0x12, 0x24, 0x0a, 0x0d, 0x6c, 0x61, 0x73, 0x74, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65,
	0x49, 0x64, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0d, 0x6c, 0x61, 0x73, 0x74, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64, 0x22, 0x5f, 0x0a, 0x13, 0x47, 0x65, 0x74, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x28,
	0x0a, 0x08, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b,
	0x32, 0x0c, 0x2e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x54, 0x69, 0x6c, 0x65, 0x52, 0x08,
	0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x12, 0x1e, 0x0a, 0x0a, 0x69, 0x73, 0x4c, 0x61,
	0x73, 0x74, 0x50, 0x61, 0x67, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x08, 0x52, 0x0a, 0x69, 0x73,
	0x4c, 0x61, 0x73, 0x74, 0x50, 0x61, 0x67, 0x65, 0x22, 0x2f, 0x0a, 0x15, 0x47, 0x65, 0x74, 0x53,
	0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x22, 0x42, 0x0a, 0x16, 0x47, 0x65, 0x74,
	0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x28, 0x0a, 0x08, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x18,
	0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x0c, 0x2e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x54,
	0x69, 0x6c, 0x65, 0x52, 0x08, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x22, 0x41, 0x0a,
	0x0d, 0x53, 0x65, 0x61, 0x72, 0x63, 0x68, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x16,
	0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06,
	0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x6b, 0x65, 0x79, 0x77, 0x6f, 0x72,
	0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x6b, 0x65, 0x79, 0x77, 0x6f, 0x72, 0x64,
	0x22, 0x3a, 0x0a, 0x0e, 0x53, 0x65, 0x61, 0x72, 0x63, 0x68, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x12, 0x28, 0x0a, 0x08, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x18, 0x01,
	0x20, 0x03, 0x28, 0x0b, 0x32, 0x0c, 0x2e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x54, 0x69,
	0x6c, 0x65, 0x52, 0x08, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x22, 0x33, 0x0a, 0x13,
	0x53, 0x65, 0x6e, 0x64, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x6d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49,
	0x64, 0x2a, 0x27, 0x0a, 0x0e, 0x47, 0x65, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x54,
	0x79, 0x70, 0x65, 0x12, 0x08, 0x0a, 0x04, 0x43, 0x48, 0x41, 0x54, 0x10, 0x00, 0x12, 0x0b, 0x0a,
	0x07, 0x48, 0x49, 0x53, 0x54, 0x4f, 0x52, 0x59, 0x10, 0x01, 0x2a, 0x37, 0x0a, 0x0b, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x54, 0x79, 0x70, 0x65, 0x12, 0x08, 0x0a, 0x04, 0x54, 0x45, 0x58,
	0x54, 0x10, 0x00, 0x12, 0x09, 0x0a, 0x05, 0x49, 0x4d, 0x41, 0x47, 0x45, 0x10, 0x01, 0x12, 0x09,
	0x0a, 0x05, 0x56, 0x49, 0x44, 0x45, 0x4f, 0x10, 0x02, 0x12, 0x08, 0x0a, 0x04, 0x46, 0x49, 0x4c,
	0x45, 0x10, 0x03, 0x32, 0xb5, 0x02, 0x0a, 0x0e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x4d,
	0x61, 0x6e, 0x61, 0x67, 0x65, 0x72, 0x12, 0x40, 0x0a, 0x0d, 0x63, 0x72, 0x65, 0x61, 0x74, 0x65,
	0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x12, 0x15, 0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65,
	0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x16,
	0x2e, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x3a, 0x0a, 0x0b, 0x67, 0x65, 0x74, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x12, 0x13, 0x2e, 0x47, 0x65, 0x74, 0x4d, 0x65, 0x73,
	0x73, 0x61, 0x67, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x14, 0x2e, 0x47,
	0x65, 0x74, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x22, 0x00, 0x12, 0x43, 0x0a, 0x0e, 0x67, 0x65, 0x74, 0x53, 0x65, 0x73, 0x73, 0x69,
	0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x12, 0x16, 0x2e, 0x47, 0x65, 0x74, 0x53, 0x65, 0x73, 0x73,
	0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x17,
	0x2e, 0x47, 0x65, 0x74, 0x53, 0x65, 0x73, 0x73, 0x69, 0x6f, 0x6e, 0x4c, 0x69, 0x73, 0x74, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x2b, 0x0a, 0x06, 0x73, 0x65, 0x61,
	0x72, 0x63, 0x68, 0x12, 0x0e, 0x2e, 0x53, 0x65, 0x61, 0x72, 0x63, 0x68, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x0f, 0x2e, 0x53, 0x65, 0x61, 0x72, 0x63, 0x68, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x33, 0x0a, 0x0b, 0x73, 0x65, 0x6e, 0x64, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x12, 0x0c, 0x2e, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x54,
	0x69, 0x6c, 0x65, 0x1a, 0x14, 0x2e, 0x53, 0x65, 0x6e, 0x64, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67,
	0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x42, 0x09, 0x5a, 0x07, 0x2e,
	0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_proto_MessageManager_proto_rawDescOnce sync.Once
	file_proto_MessageManager_proto_rawDescData = file_proto_MessageManager_proto_rawDesc
)

func file_proto_MessageManager_proto_rawDescGZIP() []byte {
	file_proto_MessageManager_proto_rawDescOnce.Do(func() {
		file_proto_MessageManager_proto_rawDescData = protoimpl.X.CompressGZIP(file_proto_MessageManager_proto_rawDescData)
	})
	return file_proto_MessageManager_proto_rawDescData
}

var file_proto_MessageManager_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_proto_MessageManager_proto_msgTypes = make([]protoimpl.MessageInfo, 10)
var file_proto_MessageManager_proto_goTypes = []interface{}{
	(GetRequestType)(0),            // 0: GetRequestType
	(MessageType)(0),               // 1: MessageType
	(*MessageTile)(nil),            // 2: MessageTile
	(*CreateSessionRequest)(nil),   // 3: CreateSessionRequest
	(*CreateSessionResponse)(nil),  // 4: CreateSessionResponse
	(*GetMessagesRequest)(nil),     // 5: GetMessagesRequest
	(*GetMessagesResponse)(nil),    // 6: GetMessagesResponse
	(*GetSessionListRequest)(nil),  // 7: GetSessionListRequest
	(*GetSessionListResponse)(nil), // 8: GetSessionListResponse
	(*SearchRequest)(nil),          // 9: SearchRequest
	(*SearchResponse)(nil),         // 10: SearchResponse
	(*SendMessageResponse)(nil),    // 11: SendMessageResponse
}
var file_proto_MessageManager_proto_depIdxs = []int32{
	1,  // 0: MessageTile.type:type_name -> MessageType
	0,  // 1: GetMessagesRequest.type:type_name -> GetRequestType
	2,  // 2: GetMessagesResponse.messages:type_name -> MessageTile
	2,  // 3: GetSessionListResponse.messages:type_name -> MessageTile
	2,  // 4: SearchResponse.messages:type_name -> MessageTile
	3,  // 5: MessageManager.createSession:input_type -> CreateSessionRequest
	5,  // 6: MessageManager.getMessages:input_type -> GetMessagesRequest
	7,  // 7: MessageManager.getSessionList:input_type -> GetSessionListRequest
	9,  // 8: MessageManager.search:input_type -> SearchRequest
	2,  // 9: MessageManager.sendMessage:input_type -> MessageTile
	4,  // 10: MessageManager.createSession:output_type -> CreateSessionResponse
	6,  // 11: MessageManager.getMessages:output_type -> GetMessagesResponse
	8,  // 12: MessageManager.getSessionList:output_type -> GetSessionListResponse
	10, // 13: MessageManager.search:output_type -> SearchResponse
	11, // 14: MessageManager.sendMessage:output_type -> SendMessageResponse
	10, // [10:15] is the sub-list for method output_type
	5,  // [5:10] is the sub-list for method input_type
	5,  // [5:5] is the sub-list for extension type_name
	5,  // [5:5] is the sub-list for extension extendee
	0,  // [0:5] is the sub-list for field type_name
}

func init() { file_proto_MessageManager_proto_init() }
func file_proto_MessageManager_proto_init() {
	if File_proto_MessageManager_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_proto_MessageManager_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*MessageTile); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateSessionRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*CreateSessionResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetMessagesRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetMessagesResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetSessionListRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetSessionListResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SearchRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[8].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SearchResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_proto_MessageManager_proto_msgTypes[9].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SendMessageResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_proto_MessageManager_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   10,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_proto_MessageManager_proto_goTypes,
		DependencyIndexes: file_proto_MessageManager_proto_depIdxs,
		EnumInfos:         file_proto_MessageManager_proto_enumTypes,
		MessageInfos:      file_proto_MessageManager_proto_msgTypes,
	}.Build()
	File_proto_MessageManager_proto = out.File
	file_proto_MessageManager_proto_rawDesc = nil
	file_proto_MessageManager_proto_goTypes = nil
	file_proto_MessageManager_proto_depIdxs = nil
}