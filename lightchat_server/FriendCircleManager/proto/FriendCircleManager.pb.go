// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.21.1
// source: proto/FriendCircleManager.proto

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

type CommentType int32

const (
	CommentType_COMMENT CommentType = 0
	CommentType_REPLY   CommentType = 1
)

// Enum value maps for CommentType.
var (
	CommentType_name = map[int32]string{
		0: "COMMENT",
		1: "REPLY",
	}
	CommentType_value = map[string]int32{
		"COMMENT": 0,
		"REPLY":   1,
	}
)

func (x CommentType) Enum() *CommentType {
	p := new(CommentType)
	*p = x
	return p
}

func (x CommentType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (CommentType) Descriptor() protoreflect.EnumDescriptor {
	return file_proto_FriendCircleManager_proto_enumTypes[0].Descriptor()
}

func (CommentType) Type() protoreflect.EnumType {
	return &file_proto_FriendCircleManager_proto_enumTypes[0]
}

func (x CommentType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use CommentType.Descriptor instead.
func (CommentType) EnumDescriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{0}
}

type ThumbType int32

const (
	ThumbType_THUMB_UP   ThumbType = 0
	ThumbType_THUMB_DOWN ThumbType = 1
)

// Enum value maps for ThumbType.
var (
	ThumbType_name = map[int32]string{
		0: "THUMB_UP",
		1: "THUMB_DOWN",
	}
	ThumbType_value = map[string]int32{
		"THUMB_UP":   0,
		"THUMB_DOWN": 1,
	}
)

func (x ThumbType) Enum() *ThumbType {
	p := new(ThumbType)
	*p = x
	return p
}

func (x ThumbType) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (ThumbType) Descriptor() protoreflect.EnumDescriptor {
	return file_proto_FriendCircleManager_proto_enumTypes[1].Descriptor()
}

func (ThumbType) Type() protoreflect.EnumType {
	return &file_proto_FriendCircleManager_proto_enumTypes[1]
}

func (x ThumbType) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use ThumbType.Descriptor instead.
func (ThumbType) EnumDescriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{1}
}

type Comment struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Type      CommentType `protobuf:"varint,1,opt,name=type,proto3,enum=CommentType" json:"type,omitempty"`
	FromId    string      `protobuf:"bytes,2,opt,name=fromId,proto3" json:"fromId,omitempty"`
	ToId      string      `protobuf:"bytes,3,opt,name=toId,proto3" json:"toId,omitempty"`
	Content   string      `protobuf:"bytes,4,opt,name=content,proto3" json:"content,omitempty"`
	Timestamp int64       `protobuf:"varint,5,opt,name=timestamp,proto3" json:"timestamp,omitempty"`
}

func (x *Comment) Reset() {
	*x = Comment{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Comment) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Comment) ProtoMessage() {}

func (x *Comment) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Comment.ProtoReflect.Descriptor instead.
func (*Comment) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{0}
}

func (x *Comment) GetType() CommentType {
	if x != nil {
		return x.Type
	}
	return CommentType_COMMENT
}

func (x *Comment) GetFromId() string {
	if x != nil {
		return x.FromId
	}
	return ""
}

func (x *Comment) GetToId() string {
	if x != nil {
		return x.ToId
	}
	return ""
}

func (x *Comment) GetContent() string {
	if x != nil {
		return x.Content
	}
	return ""
}

func (x *Comment) GetTimestamp() int64 {
	if x != nil {
		return x.Timestamp
	}
	return 0
}

type FriendCircle struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id         int64      `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
	UserId     string     `protobuf:"bytes,2,opt,name=userId,proto3" json:"userId,omitempty"`
	Content    string     `protobuf:"bytes,3,opt,name=content,proto3" json:"content,omitempty"`
	ImageNum   int32      `protobuf:"varint,4,opt,name=imageNum,proto3" json:"imageNum,omitempty"`
	Timestamp  int64      `protobuf:"varint,5,opt,name=timestamp,proto3" json:"timestamp,omitempty"`
	ThumbUpIds []string   `protobuf:"bytes,6,rep,name=thumbUpIds,proto3" json:"thumbUpIds,omitempty"`
	Comments   []*Comment `protobuf:"bytes,7,rep,name=comments,proto3" json:"comments,omitempty"`
}

func (x *FriendCircle) Reset() {
	*x = FriendCircle{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *FriendCircle) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*FriendCircle) ProtoMessage() {}

func (x *FriendCircle) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use FriendCircle.ProtoReflect.Descriptor instead.
func (*FriendCircle) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{1}
}

func (x *FriendCircle) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

func (x *FriendCircle) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *FriendCircle) GetContent() string {
	if x != nil {
		return x.Content
	}
	return ""
}

func (x *FriendCircle) GetImageNum() int32 {
	if x != nil {
		return x.ImageNum
	}
	return 0
}

func (x *FriendCircle) GetTimestamp() int64 {
	if x != nil {
		return x.Timestamp
	}
	return 0
}

func (x *FriendCircle) GetThumbUpIds() []string {
	if x != nil {
		return x.ThumbUpIds
	}
	return nil
}

func (x *FriendCircle) GetComments() []*Comment {
	if x != nil {
		return x.Comments
	}
	return nil
}

type DeleteRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserId         string `protobuf:"bytes,1,opt,name=userId,proto3" json:"userId,omitempty"`
	FriendCircleId int64  `protobuf:"varint,2,opt,name=friendCircleId,proto3" json:"friendCircleId,omitempty"`
}

func (x *DeleteRequest) Reset() {
	*x = DeleteRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteRequest) ProtoMessage() {}

func (x *DeleteRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteRequest.ProtoReflect.Descriptor instead.
func (*DeleteRequest) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{2}
}

func (x *DeleteRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *DeleteRequest) GetFriendCircleId() int64 {
	if x != nil {
		return x.FriendCircleId
	}
	return 0
}

type DeleteResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Succeed bool `protobuf:"varint,1,opt,name=succeed,proto3" json:"succeed,omitempty"`
}

func (x *DeleteResponse) Reset() {
	*x = DeleteResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeleteResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeleteResponse) ProtoMessage() {}

func (x *DeleteResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeleteResponse.ProtoReflect.Descriptor instead.
func (*DeleteResponse) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{3}
}

func (x *DeleteResponse) GetSucceed() bool {
	if x != nil {
		return x.Succeed
	}
	return false
}

type GetFriendCirclesRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Broadcast bool   `protobuf:"varint,1,opt,name=broadcast,proto3" json:"broadcast,omitempty"`
	UserId    string `protobuf:"bytes,2,opt,name=userId,proto3" json:"userId,omitempty"`
}

func (x *GetFriendCirclesRequest) Reset() {
	*x = GetFriendCirclesRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetFriendCirclesRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetFriendCirclesRequest) ProtoMessage() {}

func (x *GetFriendCirclesRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetFriendCirclesRequest.ProtoReflect.Descriptor instead.
func (*GetFriendCirclesRequest) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{4}
}

func (x *GetFriendCirclesRequest) GetBroadcast() bool {
	if x != nil {
		return x.Broadcast
	}
	return false
}

func (x *GetFriendCirclesRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

type GetFriendCirclesResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Ids []int64 `protobuf:"varint,1,rep,packed,name=ids,proto3" json:"ids,omitempty"`
}

func (x *GetFriendCirclesResponse) Reset() {
	*x = GetFriendCirclesResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetFriendCirclesResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetFriendCirclesResponse) ProtoMessage() {}

func (x *GetFriendCirclesResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetFriendCirclesResponse.ProtoReflect.Descriptor instead.
func (*GetFriendCirclesResponse) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{5}
}

func (x *GetFriendCirclesResponse) GetIds() []int64 {
	if x != nil {
		return x.Ids
	}
	return nil
}

type GetDetailRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id int64 `protobuf:"varint,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *GetDetailRequest) Reset() {
	*x = GetDetailRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[6]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *GetDetailRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*GetDetailRequest) ProtoMessage() {}

func (x *GetDetailRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[6]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use GetDetailRequest.ProtoReflect.Descriptor instead.
func (*GetDetailRequest) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{6}
}

func (x *GetDetailRequest) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type PublishResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Succeed bool  `protobuf:"varint,1,opt,name=succeed,proto3" json:"succeed,omitempty"`
	Id      int64 `protobuf:"varint,2,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *PublishResponse) Reset() {
	*x = PublishResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[7]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PublishResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PublishResponse) ProtoMessage() {}

func (x *PublishResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[7]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PublishResponse.ProtoReflect.Descriptor instead.
func (*PublishResponse) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{7}
}

func (x *PublishResponse) GetSucceed() bool {
	if x != nil {
		return x.Succeed
	}
	return false
}

func (x *PublishResponse) GetId() int64 {
	if x != nil {
		return x.Id
	}
	return 0
}

type SendCommentRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	FriendCircleId int64    `protobuf:"varint,1,opt,name=friendCircleId,proto3" json:"friendCircleId,omitempty"`
	Comment        *Comment `protobuf:"bytes,2,opt,name=comment,proto3" json:"comment,omitempty"`
}

func (x *SendCommentRequest) Reset() {
	*x = SendCommentRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[8]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SendCommentRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SendCommentRequest) ProtoMessage() {}

func (x *SendCommentRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[8]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SendCommentRequest.ProtoReflect.Descriptor instead.
func (*SendCommentRequest) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{8}
}

func (x *SendCommentRequest) GetFriendCircleId() int64 {
	if x != nil {
		return x.FriendCircleId
	}
	return 0
}

func (x *SendCommentRequest) GetComment() *Comment {
	if x != nil {
		return x.Comment
	}
	return nil
}

type SendCommentResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Succeed bool `protobuf:"varint,1,opt,name=succeed,proto3" json:"succeed,omitempty"`
}

func (x *SendCommentResponse) Reset() {
	*x = SendCommentResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[9]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *SendCommentResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*SendCommentResponse) ProtoMessage() {}

func (x *SendCommentResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[9]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use SendCommentResponse.ProtoReflect.Descriptor instead.
func (*SendCommentResponse) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{9}
}

func (x *SendCommentResponse) GetSucceed() bool {
	if x != nil {
		return x.Succeed
	}
	return false
}

type ThumbRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	UserId         string    `protobuf:"bytes,1,opt,name=userId,proto3" json:"userId,omitempty"`
	FriendCircleId int64     `protobuf:"varint,2,opt,name=friendCircleId,proto3" json:"friendCircleId,omitempty"`
	Type           ThumbType `protobuf:"varint,3,opt,name=type,proto3,enum=ThumbType" json:"type,omitempty"`
}

func (x *ThumbRequest) Reset() {
	*x = ThumbRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[10]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ThumbRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ThumbRequest) ProtoMessage() {}

func (x *ThumbRequest) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[10]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ThumbRequest.ProtoReflect.Descriptor instead.
func (*ThumbRequest) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{10}
}

func (x *ThumbRequest) GetUserId() string {
	if x != nil {
		return x.UserId
	}
	return ""
}

func (x *ThumbRequest) GetFriendCircleId() int64 {
	if x != nil {
		return x.FriendCircleId
	}
	return 0
}

func (x *ThumbRequest) GetType() ThumbType {
	if x != nil {
		return x.Type
	}
	return ThumbType_THUMB_UP
}

type ThumbResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Succeed bool `protobuf:"varint,1,opt,name=succeed,proto3" json:"succeed,omitempty"`
}

func (x *ThumbResponse) Reset() {
	*x = ThumbResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_proto_FriendCircleManager_proto_msgTypes[11]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ThumbResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ThumbResponse) ProtoMessage() {}

func (x *ThumbResponse) ProtoReflect() protoreflect.Message {
	mi := &file_proto_FriendCircleManager_proto_msgTypes[11]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ThumbResponse.ProtoReflect.Descriptor instead.
func (*ThumbResponse) Descriptor() ([]byte, []int) {
	return file_proto_FriendCircleManager_proto_rawDescGZIP(), []int{11}
}

func (x *ThumbResponse) GetSucceed() bool {
	if x != nil {
		return x.Succeed
	}
	return false
}

var File_proto_FriendCircleManager_proto protoreflect.FileDescriptor

var file_proto_FriendCircleManager_proto_rawDesc = []byte{
	0x0a, 0x1f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69,
	0x72, 0x63, 0x6c, 0x65, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x72, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x22, 0x8f, 0x01, 0x0a, 0x07, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x12, 0x20, 0x0a,
	0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x0c, 0x2e, 0x43, 0x6f,
	0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x54, 0x79, 0x70, 0x65, 0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x12,
	0x16, 0x0a, 0x06, 0x66, 0x72, 0x6f, 0x6d, 0x49, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x06, 0x66, 0x72, 0x6f, 0x6d, 0x49, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x74, 0x6f, 0x49, 0x64, 0x18,
	0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x74, 0x6f, 0x49, 0x64, 0x12, 0x18, 0x0a, 0x07, 0x63,
	0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x18, 0x04, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63, 0x6f,
	0x6e, 0x74, 0x65, 0x6e, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61,
	0x6d, 0x70, 0x18, 0x05, 0x20, 0x01, 0x28, 0x03, 0x52, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74,
	0x61, 0x6d, 0x70, 0x22, 0xd0, 0x01, 0x0a, 0x0c, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69,
	0x72, 0x63, 0x6c, 0x65, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x03,
	0x52, 0x02, 0x69, 0x64, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12, 0x18, 0x0a, 0x07,
	0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x63,
	0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x12, 0x1a, 0x0a, 0x08, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x4e,
	0x75, 0x6d, 0x18, 0x04, 0x20, 0x01, 0x28, 0x05, 0x52, 0x08, 0x69, 0x6d, 0x61, 0x67, 0x65, 0x4e,
	0x75, 0x6d, 0x12, 0x1c, 0x0a, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70, 0x18,
	0x05, 0x20, 0x01, 0x28, 0x03, 0x52, 0x09, 0x74, 0x69, 0x6d, 0x65, 0x73, 0x74, 0x61, 0x6d, 0x70,
	0x12, 0x1e, 0x0a, 0x0a, 0x74, 0x68, 0x75, 0x6d, 0x62, 0x55, 0x70, 0x49, 0x64, 0x73, 0x18, 0x06,
	0x20, 0x03, 0x28, 0x09, 0x52, 0x0a, 0x74, 0x68, 0x75, 0x6d, 0x62, 0x55, 0x70, 0x49, 0x64, 0x73,
	0x12, 0x24, 0x0a, 0x08, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x73, 0x18, 0x07, 0x20, 0x03,
	0x28, 0x0b, 0x32, 0x08, 0x2e, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x52, 0x08, 0x63, 0x6f,
	0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x73, 0x22, 0x4f, 0x0a, 0x0d, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49,
	0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12,
	0x26, 0x0a, 0x0e, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x49,
	0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0e, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43,
	0x69, 0x72, 0x63, 0x6c, 0x65, 0x49, 0x64, 0x22, 0x2a, 0x0a, 0x0e, 0x44, 0x65, 0x6c, 0x65, 0x74,
	0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63,
	0x63, 0x65, 0x65, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63,
	0x65, 0x65, 0x64, 0x22, 0x4f, 0x0a, 0x17, 0x47, 0x65, 0x74, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64,
	0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x1c,
	0x0a, 0x09, 0x62, 0x72, 0x6f, 0x61, 0x64, 0x63, 0x61, 0x73, 0x74, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x08, 0x52, 0x09, 0x62, 0x72, 0x6f, 0x61, 0x64, 0x63, 0x61, 0x73, 0x74, 0x12, 0x16, 0x0a, 0x06,
	0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73,
	0x65, 0x72, 0x49, 0x64, 0x22, 0x2c, 0x0a, 0x18, 0x47, 0x65, 0x74, 0x46, 0x72, 0x69, 0x65, 0x6e,
	0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x12, 0x10, 0x0a, 0x03, 0x69, 0x64, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x03, 0x52, 0x03, 0x69,
	0x64, 0x73, 0x22, 0x22, 0x0a, 0x10, 0x47, 0x65, 0x74, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01,
	0x28, 0x03, 0x52, 0x02, 0x69, 0x64, 0x22, 0x3b, 0x0a, 0x0f, 0x50, 0x75, 0x62, 0x6c, 0x69, 0x73,
	0x68, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63,
	0x63, 0x65, 0x65, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63,
	0x65, 0x65, 0x64, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x02, 0x20, 0x01, 0x28, 0x03, 0x52,
	0x02, 0x69, 0x64, 0x22, 0x60, 0x0a, 0x12, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x6d, 0x6d, 0x65,
	0x6e, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x26, 0x0a, 0x0e, 0x66, 0x72, 0x69,
	0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x49, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28,
	0x03, 0x52, 0x0e, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x49,
	0x64, 0x12, 0x22, 0x0a, 0x07, 0x63, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x08, 0x2e, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x52, 0x07, 0x63, 0x6f,
	0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x22, 0x2f, 0x0a, 0x13, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x6d,
	0x6d, 0x65, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07,
	0x73, 0x75, 0x63, 0x63, 0x65, 0x65, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73,
	0x75, 0x63, 0x63, 0x65, 0x65, 0x64, 0x22, 0x6e, 0x0a, 0x0c, 0x54, 0x68, 0x75, 0x6d, 0x62, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x16, 0x0a, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x06, 0x75, 0x73, 0x65, 0x72, 0x49, 0x64, 0x12, 0x26,
	0x0a, 0x0e, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x49, 0x64,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x03, 0x52, 0x0e, 0x66, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69,
	0x72, 0x63, 0x6c, 0x65, 0x49, 0x64, 0x12, 0x1e, 0x0a, 0x04, 0x74, 0x79, 0x70, 0x65, 0x18, 0x03,
	0x20, 0x01, 0x28, 0x0e, 0x32, 0x0a, 0x2e, 0x54, 0x68, 0x75, 0x6d, 0x62, 0x54, 0x79, 0x70, 0x65,
	0x52, 0x04, 0x74, 0x79, 0x70, 0x65, 0x22, 0x29, 0x0a, 0x0d, 0x54, 0x68, 0x75, 0x6d, 0x62, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65,
	0x65, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x65,
	0x64, 0x2a, 0x25, 0x0a, 0x0b, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x54, 0x79, 0x70, 0x65,
	0x12, 0x0b, 0x0a, 0x07, 0x43, 0x4f, 0x4d, 0x4d, 0x45, 0x4e, 0x54, 0x10, 0x00, 0x12, 0x09, 0x0a,
	0x05, 0x52, 0x45, 0x50, 0x4c, 0x59, 0x10, 0x01, 0x2a, 0x29, 0x0a, 0x09, 0x54, 0x68, 0x75, 0x6d,
	0x62, 0x54, 0x79, 0x70, 0x65, 0x12, 0x0c, 0x0a, 0x08, 0x54, 0x48, 0x55, 0x4d, 0x42, 0x5f, 0x55,
	0x50, 0x10, 0x00, 0x12, 0x0e, 0x0a, 0x0a, 0x54, 0x48, 0x55, 0x4d, 0x42, 0x5f, 0x44, 0x4f, 0x57,
	0x4e, 0x10, 0x01, 0x32, 0xd2, 0x02, 0x0a, 0x13, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69,
	0x72, 0x63, 0x6c, 0x65, 0x4d, 0x61, 0x6e, 0x61, 0x67, 0x65, 0x72, 0x12, 0x2b, 0x0a, 0x06, 0x64,
	0x65, 0x6c, 0x65, 0x74, 0x65, 0x12, 0x0e, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x0f, 0x2e, 0x44, 0x65, 0x6c, 0x65, 0x74, 0x65, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x49, 0x0a, 0x10, 0x67, 0x65, 0x74, 0x46,
	0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x73, 0x12, 0x18, 0x2e, 0x47,
	0x65, 0x74, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x73, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x19, 0x2e, 0x47, 0x65, 0x74, 0x46, 0x72, 0x69, 0x65,
	0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73,
	0x65, 0x22, 0x00, 0x12, 0x2f, 0x0a, 0x09, 0x67, 0x65, 0x74, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c,
	0x12, 0x11, 0x2e, 0x47, 0x65, 0x74, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x0d, 0x2e, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63,
	0x6c, 0x65, 0x22, 0x00, 0x12, 0x2c, 0x0a, 0x07, 0x70, 0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x12,
	0x0d, 0x2e, 0x46, 0x72, 0x69, 0x65, 0x6e, 0x64, 0x43, 0x69, 0x72, 0x63, 0x6c, 0x65, 0x1a, 0x10,
	0x2e, 0x50, 0x75, 0x62, 0x6c, 0x69, 0x73, 0x68, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65,
	0x22, 0x00, 0x12, 0x3a, 0x0a, 0x0b, 0x73, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e,
	0x74, 0x12, 0x13, 0x2e, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x14, 0x2e, 0x53, 0x65, 0x6e, 0x64, 0x43, 0x6f, 0x6d,
	0x6d, 0x65, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x12, 0x28,
	0x0a, 0x05, 0x74, 0x68, 0x75, 0x6d, 0x62, 0x12, 0x0d, 0x2e, 0x54, 0x68, 0x75, 0x6d, 0x62, 0x52,
	0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x0e, 0x2e, 0x54, 0x68, 0x75, 0x6d, 0x62, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x42, 0x09, 0x5a, 0x07, 0x2e, 0x2f, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_proto_FriendCircleManager_proto_rawDescOnce sync.Once
	file_proto_FriendCircleManager_proto_rawDescData = file_proto_FriendCircleManager_proto_rawDesc
)

func file_proto_FriendCircleManager_proto_rawDescGZIP() []byte {
	file_proto_FriendCircleManager_proto_rawDescOnce.Do(func() {
		file_proto_FriendCircleManager_proto_rawDescData = protoimpl.X.CompressGZIP(file_proto_FriendCircleManager_proto_rawDescData)
	})
	return file_proto_FriendCircleManager_proto_rawDescData
}

var file_proto_FriendCircleManager_proto_enumTypes = make([]protoimpl.EnumInfo, 2)
var file_proto_FriendCircleManager_proto_msgTypes = make([]protoimpl.MessageInfo, 12)
var file_proto_FriendCircleManager_proto_goTypes = []interface{}{
	(CommentType)(0),                 // 0: CommentType
	(ThumbType)(0),                   // 1: ThumbType
	(*Comment)(nil),                  // 2: Comment
	(*FriendCircle)(nil),             // 3: FriendCircle
	(*DeleteRequest)(nil),            // 4: DeleteRequest
	(*DeleteResponse)(nil),           // 5: DeleteResponse
	(*GetFriendCirclesRequest)(nil),  // 6: GetFriendCirclesRequest
	(*GetFriendCirclesResponse)(nil), // 7: GetFriendCirclesResponse
	(*GetDetailRequest)(nil),         // 8: GetDetailRequest
	(*PublishResponse)(nil),          // 9: PublishResponse
	(*SendCommentRequest)(nil),       // 10: SendCommentRequest
	(*SendCommentResponse)(nil),      // 11: SendCommentResponse
	(*ThumbRequest)(nil),             // 12: ThumbRequest
	(*ThumbResponse)(nil),            // 13: ThumbResponse
}
var file_proto_FriendCircleManager_proto_depIdxs = []int32{
	0,  // 0: Comment.type:type_name -> CommentType
	2,  // 1: FriendCircle.comments:type_name -> Comment
	2,  // 2: SendCommentRequest.comment:type_name -> Comment
	1,  // 3: ThumbRequest.type:type_name -> ThumbType
	4,  // 4: FriendCircleManager.delete:input_type -> DeleteRequest
	6,  // 5: FriendCircleManager.getFriendCircles:input_type -> GetFriendCirclesRequest
	8,  // 6: FriendCircleManager.getDetail:input_type -> GetDetailRequest
	3,  // 7: FriendCircleManager.publish:input_type -> FriendCircle
	10, // 8: FriendCircleManager.sendComment:input_type -> SendCommentRequest
	12, // 9: FriendCircleManager.thumb:input_type -> ThumbRequest
	5,  // 10: FriendCircleManager.delete:output_type -> DeleteResponse
	7,  // 11: FriendCircleManager.getFriendCircles:output_type -> GetFriendCirclesResponse
	3,  // 12: FriendCircleManager.getDetail:output_type -> FriendCircle
	9,  // 13: FriendCircleManager.publish:output_type -> PublishResponse
	11, // 14: FriendCircleManager.sendComment:output_type -> SendCommentResponse
	13, // 15: FriendCircleManager.thumb:output_type -> ThumbResponse
	10, // [10:16] is the sub-list for method output_type
	4,  // [4:10] is the sub-list for method input_type
	4,  // [4:4] is the sub-list for extension type_name
	4,  // [4:4] is the sub-list for extension extendee
	0,  // [0:4] is the sub-list for field type_name
}

func init() { file_proto_FriendCircleManager_proto_init() }
func file_proto_FriendCircleManager_proto_init() {
	if File_proto_FriendCircleManager_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_proto_FriendCircleManager_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Comment); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*FriendCircle); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteRequest); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeleteResponse); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetFriendCirclesRequest); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetFriendCirclesResponse); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[6].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*GetDetailRequest); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[7].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PublishResponse); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[8].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SendCommentRequest); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[9].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*SendCommentResponse); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[10].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ThumbRequest); i {
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
		file_proto_FriendCircleManager_proto_msgTypes[11].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ThumbResponse); i {
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
			RawDescriptor: file_proto_FriendCircleManager_proto_rawDesc,
			NumEnums:      2,
			NumMessages:   12,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_proto_FriendCircleManager_proto_goTypes,
		DependencyIndexes: file_proto_FriendCircleManager_proto_depIdxs,
		EnumInfos:         file_proto_FriendCircleManager_proto_enumTypes,
		MessageInfos:      file_proto_FriendCircleManager_proto_msgTypes,
	}.Build()
	File_proto_FriendCircleManager_proto = out.File
	file_proto_FriendCircleManager_proto_rawDesc = nil
	file_proto_FriendCircleManager_proto_goTypes = nil
	file_proto_FriendCircleManager_proto_depIdxs = nil
}