///
//  Generated code. Do not modify.
//  source: FriendManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'FriendManager.pbenum.dart';

export 'FriendManager.pbenum.dart';

class NewFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewFriendRequest', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', protoName: 'requestId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromId', protoName: 'fromId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toId', protoName: 'toId')
    ..e<NewFriendRequestState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: NewFriendRequestState.WAIT_FOR_ACCEPT, valueOf: NewFriendRequestState.valueOf, enumValues: NewFriendRequestState.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fromRemarkName', protoName: 'fromRemarkName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'toRemarkName', protoName: 'toRemarkName')
    ..hasRequiredFields = false
  ;

  NewFriendRequest._() : super();
  factory NewFriendRequest({
    $fixnum.Int64? requestId,
    $core.String? fromId,
    $core.String? toId,
    NewFriendRequestState? state,
    $core.String? content,
    $core.String? fromRemarkName,
    $core.String? toRemarkName,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (fromId != null) {
      _result.fromId = fromId;
    }
    if (toId != null) {
      _result.toId = toId;
    }
    if (state != null) {
      _result.state = state;
    }
    if (content != null) {
      _result.content = content;
    }
    if (fromRemarkName != null) {
      _result.fromRemarkName = fromRemarkName;
    }
    if (toRemarkName != null) {
      _result.toRemarkName = toRemarkName;
    }
    return _result;
  }
  factory NewFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewFriendRequest clone() => NewFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewFriendRequest copyWith(void Function(NewFriendRequest) updates) => super.copyWith((message) => updates(message as NewFriendRequest)) as NewFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewFriendRequest create() => NewFriendRequest._();
  NewFriendRequest createEmptyInstance() => create();
  static $pb.PbList<NewFriendRequest> createRepeated() => $pb.PbList<NewFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static NewFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewFriendRequest>(create);
  static NewFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get requestId => $_getI64(0);
  @$pb.TagNumber(1)
  set requestId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

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
  NewFriendRequestState get state => $_getN(3);
  @$pb.TagNumber(4)
  set state(NewFriendRequestState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fromRemarkName => $_getSZ(5);
  @$pb.TagNumber(6)
  set fromRemarkName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFromRemarkName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFromRemarkName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get toRemarkName => $_getSZ(6);
  @$pb.TagNumber(7)
  set toRemarkName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasToRemarkName() => $_has(6);
  @$pb.TagNumber(7)
  void clearToRemarkName() => clearField(7);
}

class acceptNewFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'acceptNewFriendResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  acceptNewFriendResponse._() : super();
  factory acceptNewFriendResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory acceptNewFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory acceptNewFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  acceptNewFriendResponse clone() => acceptNewFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  acceptNewFriendResponse copyWith(void Function(acceptNewFriendResponse) updates) => super.copyWith((message) => updates(message as acceptNewFriendResponse)) as acceptNewFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static acceptNewFriendResponse create() => acceptNewFriendResponse._();
  acceptNewFriendResponse createEmptyInstance() => create();
  static $pb.PbList<acceptNewFriendResponse> createRepeated() => $pb.PbList<acceptNewFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static acceptNewFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<acceptNewFriendResponse>(create);
  static acceptNewFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class changeRemarkNameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeRemarkNameRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendId', protoName: 'friendId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newRemarkName', protoName: 'newRemarkName')
    ..hasRequiredFields = false
  ;

  changeRemarkNameRequest._() : super();
  factory changeRemarkNameRequest({
    $core.String? id,
    $core.String? friendId,
    $core.String? newRemarkName,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (friendId != null) {
      _result.friendId = friendId;
    }
    if (newRemarkName != null) {
      _result.newRemarkName = newRemarkName;
    }
    return _result;
  }
  factory changeRemarkNameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeRemarkNameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeRemarkNameRequest clone() => changeRemarkNameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeRemarkNameRequest copyWith(void Function(changeRemarkNameRequest) updates) => super.copyWith((message) => updates(message as changeRemarkNameRequest)) as changeRemarkNameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeRemarkNameRequest create() => changeRemarkNameRequest._();
  changeRemarkNameRequest createEmptyInstance() => create();
  static $pb.PbList<changeRemarkNameRequest> createRepeated() => $pb.PbList<changeRemarkNameRequest>();
  @$core.pragma('dart2js:noInline')
  static changeRemarkNameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeRemarkNameRequest>(create);
  static changeRemarkNameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendId => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get newRemarkName => $_getSZ(2);
  @$pb.TagNumber(3)
  set newRemarkName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNewRemarkName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNewRemarkName() => clearField(3);
}

class changeRemarkNameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeRemarkNameResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFriend', protoName: 'isFriend')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  changeRemarkNameResponse._() : super();
  factory changeRemarkNameResponse({
    $core.bool? isFriend,
    $core.bool? succeed,
  }) {
    final _result = create();
    if (isFriend != null) {
      _result.isFriend = isFriend;
    }
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory changeRemarkNameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeRemarkNameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeRemarkNameResponse clone() => changeRemarkNameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeRemarkNameResponse copyWith(void Function(changeRemarkNameResponse) updates) => super.copyWith((message) => updates(message as changeRemarkNameResponse)) as changeRemarkNameResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeRemarkNameResponse create() => changeRemarkNameResponse._();
  changeRemarkNameResponse createEmptyInstance() => create();
  static $pb.PbList<changeRemarkNameResponse> createRepeated() => $pb.PbList<changeRemarkNameResponse>();
  @$core.pragma('dart2js:noInline')
  static changeRemarkNameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeRemarkNameResponse>(create);
  static changeRemarkNameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isFriend => $_getBF(0);
  @$pb.TagNumber(1)
  set isFriend($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsFriend() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsFriend() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get succeed => $_getBF(1);
  @$pb.TagNumber(2)
  set succeed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSucceed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSucceed() => clearField(2);
}

class checkFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'checkFriendRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetId', protoName: 'targetId')
    ..hasRequiredFields = false
  ;

  checkFriendRequest._() : super();
  factory checkFriendRequest({
    $core.String? id,
    $core.String? targetId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (targetId != null) {
      _result.targetId = targetId;
    }
    return _result;
  }
  factory checkFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory checkFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  checkFriendRequest clone() => checkFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  checkFriendRequest copyWith(void Function(checkFriendRequest) updates) => super.copyWith((message) => updates(message as checkFriendRequest)) as checkFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static checkFriendRequest create() => checkFriendRequest._();
  checkFriendRequest createEmptyInstance() => create();
  static $pb.PbList<checkFriendRequest> createRepeated() => $pb.PbList<checkFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static checkFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<checkFriendRequest>(create);
  static checkFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetId() => clearField(2);
}

class checkFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'checkFriendResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFriend', protoName: 'isFriend')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remarkName', protoName: 'remarkName')
    ..hasRequiredFields = false
  ;

  checkFriendResponse._() : super();
  factory checkFriendResponse({
    $core.bool? isFriend,
    $core.String? remarkName,
  }) {
    final _result = create();
    if (isFriend != null) {
      _result.isFriend = isFriend;
    }
    if (remarkName != null) {
      _result.remarkName = remarkName;
    }
    return _result;
  }
  factory checkFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory checkFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  checkFriendResponse clone() => checkFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  checkFriendResponse copyWith(void Function(checkFriendResponse) updates) => super.copyWith((message) => updates(message as checkFriendResponse)) as checkFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static checkFriendResponse create() => checkFriendResponse._();
  checkFriendResponse createEmptyInstance() => create();
  static $pb.PbList<checkFriendResponse> createRepeated() => $pb.PbList<checkFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static checkFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<checkFriendResponse>(create);
  static checkFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isFriend => $_getBF(0);
  @$pb.TagNumber(1)
  set isFriend($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsFriend() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsFriend() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remarkName => $_getSZ(1);
  @$pb.TagNumber(2)
  set remarkName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemarkName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemarkName() => clearField(2);
}

class deleteFriendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deleteFriendRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'friendId', protoName: 'friendId')
    ..hasRequiredFields = false
  ;

  deleteFriendRequest._() : super();
  factory deleteFriendRequest({
    $core.String? id,
    $core.String? friendId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (friendId != null) {
      _result.friendId = friendId;
    }
    return _result;
  }
  factory deleteFriendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory deleteFriendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  deleteFriendRequest clone() => deleteFriendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  deleteFriendRequest copyWith(void Function(deleteFriendRequest) updates) => super.copyWith((message) => updates(message as deleteFriendRequest)) as deleteFriendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static deleteFriendRequest create() => deleteFriendRequest._();
  deleteFriendRequest createEmptyInstance() => create();
  static $pb.PbList<deleteFriendRequest> createRepeated() => $pb.PbList<deleteFriendRequest>();
  @$core.pragma('dart2js:noInline')
  static deleteFriendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<deleteFriendRequest>(create);
  static deleteFriendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get friendId => $_getSZ(1);
  @$pb.TagNumber(2)
  set friendId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFriendId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFriendId() => clearField(2);
}

class deleteFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'deleteFriendResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  deleteFriendResponse._() : super();
  factory deleteFriendResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory deleteFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory deleteFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  deleteFriendResponse clone() => deleteFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  deleteFriendResponse copyWith(void Function(deleteFriendResponse) updates) => super.copyWith((message) => updates(message as deleteFriendResponse)) as deleteFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static deleteFriendResponse create() => deleteFriendResponse._();
  deleteFriendResponse createEmptyInstance() => create();
  static $pb.PbList<deleteFriendResponse> createRepeated() => $pb.PbList<deleteFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static deleteFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<deleteFriendResponse>(create);
  static deleteFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class getFriendsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getFriendsRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  getFriendsRequest._() : super();
  factory getFriendsRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory getFriendsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getFriendsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getFriendsRequest clone() => getFriendsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getFriendsRequest copyWith(void Function(getFriendsRequest) updates) => super.copyWith((message) => updates(message as getFriendsRequest)) as getFriendsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getFriendsRequest create() => getFriendsRequest._();
  getFriendsRequest createEmptyInstance() => create();
  static $pb.PbList<getFriendsRequest> createRepeated() => $pb.PbList<getFriendsRequest>();
  @$core.pragma('dart2js:noInline')
  static getFriendsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getFriendsRequest>(create);
  static getFriendsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class getFriendsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getFriendsResponse', createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  getFriendsResponse._() : super();
  factory getFriendsResponse({
    $core.Iterable<$core.String>? ids,
  }) {
    final _result = create();
    if (ids != null) {
      _result.ids.addAll(ids);
    }
    return _result;
  }
  factory getFriendsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getFriendsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getFriendsResponse clone() => getFriendsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getFriendsResponse copyWith(void Function(getFriendsResponse) updates) => super.copyWith((message) => updates(message as getFriendsResponse)) as getFriendsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getFriendsResponse create() => getFriendsResponse._();
  getFriendsResponse createEmptyInstance() => create();
  static $pb.PbList<getFriendsResponse> createRepeated() => $pb.PbList<getFriendsResponse>();
  @$core.pragma('dart2js:noInline')
  static getFriendsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getFriendsResponse>(create);
  static getFriendsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class getNewFriendRequestsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getNewFriendRequestsRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  getNewFriendRequestsRequest._() : super();
  factory getNewFriendRequestsRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory getNewFriendRequestsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getNewFriendRequestsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getNewFriendRequestsRequest clone() => getNewFriendRequestsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getNewFriendRequestsRequest copyWith(void Function(getNewFriendRequestsRequest) updates) => super.copyWith((message) => updates(message as getNewFriendRequestsRequest)) as getNewFriendRequestsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getNewFriendRequestsRequest create() => getNewFriendRequestsRequest._();
  getNewFriendRequestsRequest createEmptyInstance() => create();
  static $pb.PbList<getNewFriendRequestsRequest> createRepeated() => $pb.PbList<getNewFriendRequestsRequest>();
  @$core.pragma('dart2js:noInline')
  static getNewFriendRequestsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getNewFriendRequestsRequest>(create);
  static getNewFriendRequestsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class getNewFriendRequestsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getNewFriendRequestsResponse', createEmptyInstance: create)
    ..pc<NewFriendRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requests', $pb.PbFieldType.PM, subBuilder: NewFriendRequest.create)
    ..hasRequiredFields = false
  ;

  getNewFriendRequestsResponse._() : super();
  factory getNewFriendRequestsResponse({
    $core.Iterable<NewFriendRequest>? requests,
  }) {
    final _result = create();
    if (requests != null) {
      _result.requests.addAll(requests);
    }
    return _result;
  }
  factory getNewFriendRequestsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getNewFriendRequestsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getNewFriendRequestsResponse clone() => getNewFriendRequestsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getNewFriendRequestsResponse copyWith(void Function(getNewFriendRequestsResponse) updates) => super.copyWith((message) => updates(message as getNewFriendRequestsResponse)) as getNewFriendRequestsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getNewFriendRequestsResponse create() => getNewFriendRequestsResponse._();
  getNewFriendRequestsResponse createEmptyInstance() => create();
  static $pb.PbList<getNewFriendRequestsResponse> createRepeated() => $pb.PbList<getNewFriendRequestsResponse>();
  @$core.pragma('dart2js:noInline')
  static getNewFriendRequestsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getNewFriendRequestsResponse>(create);
  static getNewFriendRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewFriendRequest> get requests => $_getList(0);
}

class rejectNewFriendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'rejectNewFriendResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  rejectNewFriendResponse._() : super();
  factory rejectNewFriendResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory rejectNewFriendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory rejectNewFriendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  rejectNewFriendResponse clone() => rejectNewFriendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  rejectNewFriendResponse copyWith(void Function(rejectNewFriendResponse) updates) => super.copyWith((message) => updates(message as rejectNewFriendResponse)) as rejectNewFriendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static rejectNewFriendResponse create() => rejectNewFriendResponse._();
  rejectNewFriendResponse createEmptyInstance() => create();
  static $pb.PbList<rejectNewFriendResponse> createRepeated() => $pb.PbList<rejectNewFriendResponse>();
  @$core.pragma('dart2js:noInline')
  static rejectNewFriendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<rejectNewFriendResponse>(create);
  static rejectNewFriendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class sendNewFriendRequestResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'sendNewFriendRequestResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  sendNewFriendRequestResponse._() : super();
  factory sendNewFriendRequestResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory sendNewFriendRequestResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sendNewFriendRequestResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sendNewFriendRequestResponse clone() => sendNewFriendRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sendNewFriendRequestResponse copyWith(void Function(sendNewFriendRequestResponse) updates) => super.copyWith((message) => updates(message as sendNewFriendRequestResponse)) as sendNewFriendRequestResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static sendNewFriendRequestResponse create() => sendNewFriendRequestResponse._();
  sendNewFriendRequestResponse createEmptyInstance() => create();
  static $pb.PbList<sendNewFriendRequestResponse> createRepeated() => $pb.PbList<sendNewFriendRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static sendNewFriendRequestResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sendNewFriendRequestResponse>(create);
  static sendNewFriendRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

