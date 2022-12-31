///
//  Generated code. Do not modify.
//  source: FriendCircleManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'FriendCircleManager.pbenum.dart';

export 'FriendCircleManager.pbenum.dart';

class Comment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Comment', createEmptyInstance: create)
    ..e<CommentType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: CommentType.COMMENT, valueOf: CommentType.valueOf, enumValues: CommentType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromId', protoName: 'fromId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toId', protoName: 'toId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  Comment._() : super();
  factory Comment({
    CommentType? type,
    $core.String? fromId,
    $core.String? toId,
    $core.String? content,
    $fixnum.Int64? timestamp,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (fromId != null) {
      _result.fromId = fromId;
    }
    if (toId != null) {
      _result.toId = toId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    return _result;
  }
  factory Comment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Comment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Comment clone() => Comment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Comment copyWith(void Function(Comment) updates) => super.copyWith((message) => updates(message as Comment)) as Comment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Comment create() => Comment._();
  Comment createEmptyInstance() => create();
  static $pb.PbList<Comment> createRepeated() => $pb.PbList<Comment>();
  @$core.pragma('dart2js:noInline')
  static Comment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Comment>(create);
  static Comment? _defaultInstance;

  @$pb.TagNumber(1)
  CommentType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(CommentType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fromId => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toId => $_getSZ(2);
  @$pb.TagNumber(3)
  set toId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToId() => $_has(2);
  @$pb.TagNumber(3)
  void clearToId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);
}

class FriendCircle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FriendCircle', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageNum', $pb.PbFieldType.O3, protoName: 'imageNum')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..pPS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumbUpIds', protoName: 'thumbUpIds')
    ..pc<Comment>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: Comment.create)
    ..hasRequiredFields = false
  ;

  FriendCircle._() : super();
  factory FriendCircle({
    $fixnum.Int64? id,
    $core.String? userId,
    $core.String? content,
    $core.int? imageNum,
    $fixnum.Int64? timestamp,
    $core.Iterable<$core.String>? thumbUpIds,
    $core.Iterable<Comment>? comments,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (content != null) {
      _result.content = content;
    }
    if (imageNum != null) {
      _result.imageNum = imageNum;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (thumbUpIds != null) {
      _result.thumbUpIds.addAll(thumbUpIds);
    }
    if (comments != null) {
      _result.comments.addAll(comments);
    }
    return _result;
  }
  factory FriendCircle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FriendCircle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FriendCircle clone() => FriendCircle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FriendCircle copyWith(void Function(FriendCircle) updates) => super.copyWith((message) => updates(message as FriendCircle)) as FriendCircle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendCircle create() => FriendCircle._();
  FriendCircle createEmptyInstance() => create();
  static $pb.PbList<FriendCircle> createRepeated() => $pb.PbList<FriendCircle>();
  @$core.pragma('dart2js:noInline')
  static FriendCircle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FriendCircle>(create);
  static FriendCircle? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get imageNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set imageNum($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImageNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearImageNum() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get timestamp => $_getI64(4);
  @$pb.TagNumber(5)
  set timestamp($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get thumbUpIds => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<Comment> get comments => $_getList(6);
}

class DeleteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendCircleId', protoName: 'friendCircleId')
    ..hasRequiredFields = false
  ;

  DeleteRequest._() : super();
  factory DeleteRequest({
    $core.String? userId,
    $fixnum.Int64? friendCircleId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (friendCircleId != null) {
      _result.friendCircleId = friendCircleId;
    }
    return _result;
  }
  factory DeleteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRequest clone() => DeleteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRequest copyWith(void Function(DeleteRequest) updates) => super.copyWith((message) => updates(message as DeleteRequest)) as DeleteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteRequest create() => DeleteRequest._();
  DeleteRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRequest> createRepeated() => $pb.PbList<DeleteRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRequest>(create);
  static DeleteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get friendCircleId => $_getI64(1);
  @$pb.TagNumber(2)
  set friendCircleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendCircleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendCircleId() => clearField(2);
}

class DeleteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  DeleteResponse._() : super();
  factory DeleteResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory DeleteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteResponse clone() => DeleteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteResponse copyWith(void Function(DeleteResponse) updates) => super.copyWith((message) => updates(message as DeleteResponse)) as DeleteResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteResponse create() => DeleteResponse._();
  DeleteResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteResponse> createRepeated() => $pb.PbList<DeleteResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteResponse>(create);
  static DeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class GetFriendCirclesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFriendCirclesRequest', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'broadcast')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  GetFriendCirclesRequest._() : super();
  factory GetFriendCirclesRequest({
    $core.bool? broadcast,
    $core.String? userId,
  }) {
    final _result = create();
    if (broadcast != null) {
      _result.broadcast = broadcast;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory GetFriendCirclesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFriendCirclesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFriendCirclesRequest clone() => GetFriendCirclesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFriendCirclesRequest copyWith(void Function(GetFriendCirclesRequest) updates) => super.copyWith((message) => updates(message as GetFriendCirclesRequest)) as GetFriendCirclesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFriendCirclesRequest create() => GetFriendCirclesRequest._();
  GetFriendCirclesRequest createEmptyInstance() => create();
  static $pb.PbList<GetFriendCirclesRequest> createRepeated() => $pb.PbList<GetFriendCirclesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFriendCirclesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFriendCirclesRequest>(create);
  static GetFriendCirclesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get broadcast => $_getBF(0);
  @$pb.TagNumber(1)
  set broadcast($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBroadcast() => $_has(0);
  @$pb.TagNumber(1)
  void clearBroadcast() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);
}

class GetFriendCirclesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetFriendCirclesResponse', createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  GetFriendCirclesResponse._() : super();
  factory GetFriendCirclesResponse({
    $core.Iterable<$fixnum.Int64>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory GetFriendCirclesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFriendCirclesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFriendCirclesResponse clone() => GetFriendCirclesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFriendCirclesResponse copyWith(void Function(GetFriendCirclesResponse) updates) => super.copyWith((message) => updates(message as GetFriendCirclesResponse)) as GetFriendCirclesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetFriendCirclesResponse create() => GetFriendCirclesResponse._();
  GetFriendCirclesResponse createEmptyInstance() => create();
  static $pb.PbList<GetFriendCirclesResponse> createRepeated() => $pb.PbList<GetFriendCirclesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFriendCirclesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFriendCirclesResponse>(create);
  static GetFriendCirclesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get ids => $_getList(0);
}

class GetDetailRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetDetailRequest', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  GetDetailRequest._() : super();
  factory GetDetailRequest({
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory GetDetailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetDetailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetDetailRequest clone() => GetDetailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetDetailRequest copyWith(void Function(GetDetailRequest) updates) => super.copyWith((message) => updates(message as GetDetailRequest)) as GetDetailRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetDetailRequest create() => GetDetailRequest._();
  GetDetailRequest createEmptyInstance() => create();
  static $pb.PbList<GetDetailRequest> createRepeated() => $pb.PbList<GetDetailRequest>();
  @$core.pragma('dart2js:noInline')
  static GetDetailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetDetailRequest>(create);
  static GetDetailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class PublishResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PublishResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PublishResponse._() : super();
  factory PublishResponse({
    $core.bool? succeed,
    $fixnum.Int64? id,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory PublishResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishResponse clone() => PublishResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishResponse copyWith(void Function(PublishResponse) updates) => super.copyWith((message) => updates(message as PublishResponse)) as PublishResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PublishResponse create() => PublishResponse._();
  PublishResponse createEmptyInstance() => create();
  static $pb.PbList<PublishResponse> createRepeated() => $pb.PbList<PublishResponse>();
  @$core.pragma('dart2js:noInline')
  static PublishResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishResponse>(create);
  static PublishResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get id => $_getI64(1);
  @$pb.TagNumber(2)
  set id($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class SendCommentRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendCommentRequest', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendCircleId', protoName: 'friendCircleId')
    ..aOM<Comment>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment', subBuilder: Comment.create)
    ..hasRequiredFields = false
  ;

  SendCommentRequest._() : super();
  factory SendCommentRequest({
    $fixnum.Int64? friendCircleId,
    Comment? comment,
  }) {
    final _result = create();
    if (friendCircleId != null) {
      _result.friendCircleId = friendCircleId;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    return _result;
  }
  factory SendCommentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendCommentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendCommentRequest clone() => SendCommentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendCommentRequest copyWith(void Function(SendCommentRequest) updates) => super.copyWith((message) => updates(message as SendCommentRequest)) as SendCommentRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendCommentRequest create() => SendCommentRequest._();
  SendCommentRequest createEmptyInstance() => create();
  static $pb.PbList<SendCommentRequest> createRepeated() => $pb.PbList<SendCommentRequest>();
  @$core.pragma('dart2js:noInline')
  static SendCommentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendCommentRequest>(create);
  static SendCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get friendCircleId => $_getI64(0);
  @$pb.TagNumber(1)
  set friendCircleId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFriendCircleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFriendCircleId() => clearField(1);

  @$pb.TagNumber(2)
  Comment get comment => $_getN(1);
  @$pb.TagNumber(2)
  set comment(Comment v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasComment() => $_has(1);
  @$pb.TagNumber(2)
  void clearComment() => clearField(2);
  @$pb.TagNumber(2)
  Comment ensureComment() => $_ensure(1);
}

class SendCommentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendCommentResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  SendCommentResponse._() : super();
  factory SendCommentResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory SendCommentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendCommentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendCommentResponse clone() => SendCommentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendCommentResponse copyWith(void Function(SendCommentResponse) updates) => super.copyWith((message) => updates(message as SendCommentResponse)) as SendCommentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendCommentResponse create() => SendCommentResponse._();
  SendCommentResponse createEmptyInstance() => create();
  static $pb.PbList<SendCommentResponse> createRepeated() => $pb.PbList<SendCommentResponse>();
  @$core.pragma('dart2js:noInline')
  static SendCommentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendCommentResponse>(create);
  static SendCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class ThumbRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ThumbRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendCircleId', protoName: 'friendCircleId')
    ..e<ThumbType>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ThumbType.THUMB_UP, valueOf: ThumbType.valueOf, enumValues: ThumbType.values)
    ..hasRequiredFields = false
  ;

  ThumbRequest._() : super();
  factory ThumbRequest({
    $core.String? userId,
    $fixnum.Int64? friendCircleId,
    ThumbType? type,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (friendCircleId != null) {
      _result.friendCircleId = friendCircleId;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ThumbRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ThumbRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ThumbRequest clone() => ThumbRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ThumbRequest copyWith(void Function(ThumbRequest) updates) => super.copyWith((message) => updates(message as ThumbRequest)) as ThumbRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ThumbRequest create() => ThumbRequest._();
  ThumbRequest createEmptyInstance() => create();
  static $pb.PbList<ThumbRequest> createRepeated() => $pb.PbList<ThumbRequest>();
  @$core.pragma('dart2js:noInline')
  static ThumbRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ThumbRequest>(create);
  static ThumbRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get friendCircleId => $_getI64(1);
  @$pb.TagNumber(2)
  set friendCircleId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendCircleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendCircleId() => clearField(2);

  @$pb.TagNumber(3)
  ThumbType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(ThumbType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

class ThumbResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ThumbResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  ThumbResponse._() : super();
  factory ThumbResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory ThumbResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ThumbResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ThumbResponse clone() => ThumbResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ThumbResponse copyWith(void Function(ThumbResponse) updates) => super.copyWith((message) => updates(message as ThumbResponse)) as ThumbResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ThumbResponse create() => ThumbResponse._();
  ThumbResponse createEmptyInstance() => create();
  static $pb.PbList<ThumbResponse> createRepeated() => $pb.PbList<ThumbResponse>();
  @$core.pragma('dart2js:noInline')
  static ThumbResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ThumbResponse>(create);
  static ThumbResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

