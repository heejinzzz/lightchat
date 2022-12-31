///
//  Generated code. Do not modify.
//  source: UserManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'UserManager.pbenum.dart';

export 'UserManager.pbenum.dart';

class getUserInfoByIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getUserInfoByIdRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  getUserInfoByIdRequest._() : super();
  factory getUserInfoByIdRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory getUserInfoByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserInfoByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getUserInfoByIdRequest clone() => getUserInfoByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getUserInfoByIdRequest copyWith(void Function(getUserInfoByIdRequest) updates) => super.copyWith((message) => updates(message as getUserInfoByIdRequest)) as getUserInfoByIdRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserInfoByIdRequest create() => getUserInfoByIdRequest._();
  getUserInfoByIdRequest createEmptyInstance() => create();
  static $pb.PbList<getUserInfoByIdRequest> createRepeated() => $pb.PbList<getUserInfoByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static getUserInfoByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserInfoByIdRequest>(create);
  static getUserInfoByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class getUserInfoByIdResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getUserInfoByIdResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exist')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<Gender>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.OE, defaultOrMaker: Gender.MALE, valueOf: Gender.valueOf, enumValues: Gender.values)
    ..hasRequiredFields = false
  ;

  getUserInfoByIdResponse._() : super();
  factory getUserInfoByIdResponse({
    $core.bool? exist,
    $core.String? name,
    Gender? gender,
  }) {
    final _result = create();
    if (exist != null) {
      _result.exist = exist;
    }
    if (name != null) {
      _result.name = name;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    return _result;
  }
  factory getUserInfoByIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserInfoByIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getUserInfoByIdResponse clone() => getUserInfoByIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getUserInfoByIdResponse copyWith(void Function(getUserInfoByIdResponse) updates) => super.copyWith((message) => updates(message as getUserInfoByIdResponse)) as getUserInfoByIdResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserInfoByIdResponse create() => getUserInfoByIdResponse._();
  getUserInfoByIdResponse createEmptyInstance() => create();
  static $pb.PbList<getUserInfoByIdResponse> createRepeated() => $pb.PbList<getUserInfoByIdResponse>();
  @$core.pragma('dart2js:noInline')
  static getUserInfoByIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserInfoByIdResponse>(create);
  static getUserInfoByIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exist => $_getBF(0);
  @$pb.TagNumber(1)
  set exist($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExist() => $_has(0);
  @$pb.TagNumber(1)
  void clearExist() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Gender get gender => $_getN(2);
  @$pb.TagNumber(3)
  set gender(Gender v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGender() => $_has(2);
  @$pb.TagNumber(3)
  void clearGender() => clearField(3);
}

class getUserInfoByNumberRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getUserInfoByNumberRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..hasRequiredFields = false
  ;

  getUserInfoByNumberRequest._() : super();
  factory getUserInfoByNumberRequest({
    $core.String? number,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory getUserInfoByNumberRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserInfoByNumberRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getUserInfoByNumberRequest clone() => getUserInfoByNumberRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getUserInfoByNumberRequest copyWith(void Function(getUserInfoByNumberRequest) updates) => super.copyWith((message) => updates(message as getUserInfoByNumberRequest)) as getUserInfoByNumberRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserInfoByNumberRequest create() => getUserInfoByNumberRequest._();
  getUserInfoByNumberRequest createEmptyInstance() => create();
  static $pb.PbList<getUserInfoByNumberRequest> createRepeated() => $pb.PbList<getUserInfoByNumberRequest>();
  @$core.pragma('dart2js:noInline')
  static getUserInfoByNumberRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserInfoByNumberRequest>(create);
  static getUserInfoByNumberRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

class getUserInfoByNumberResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'getUserInfoByNumberResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exist')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<Gender>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.OE, defaultOrMaker: Gender.MALE, valueOf: Gender.valueOf, enumValues: Gender.values)
    ..hasRequiredFields = false
  ;

  getUserInfoByNumberResponse._() : super();
  factory getUserInfoByNumberResponse({
    $core.bool? exist,
    $core.String? id,
    $core.String? name,
    Gender? gender,
  }) {
    final _result = create();
    if (exist != null) {
      _result.exist = exist;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    return _result;
  }
  factory getUserInfoByNumberResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserInfoByNumberResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  getUserInfoByNumberResponse clone() => getUserInfoByNumberResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  getUserInfoByNumberResponse copyWith(void Function(getUserInfoByNumberResponse) updates) => super.copyWith((message) => updates(message as getUserInfoByNumberResponse)) as getUserInfoByNumberResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserInfoByNumberResponse create() => getUserInfoByNumberResponse._();
  getUserInfoByNumberResponse createEmptyInstance() => create();
  static $pb.PbList<getUserInfoByNumberResponse> createRepeated() => $pb.PbList<getUserInfoByNumberResponse>();
  @$core.pragma('dart2js:noInline')
  static getUserInfoByNumberResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserInfoByNumberResponse>(create);
  static getUserInfoByNumberResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exist => $_getBF(0);
  @$pb.TagNumber(1)
  set exist($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExist() => $_has(0);
  @$pb.TagNumber(1)
  void clearExist() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  Gender get gender => $_getN(3);
  @$pb.TagNumber(4)
  set gender(Gender v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);
}

class loginWithPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'loginWithPasswordRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  loginWithPasswordRequest._() : super();
  factory loginWithPasswordRequest({
    $core.String? number,
    $core.String? password,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory loginWithPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory loginWithPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  loginWithPasswordRequest clone() => loginWithPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  loginWithPasswordRequest copyWith(void Function(loginWithPasswordRequest) updates) => super.copyWith((message) => updates(message as loginWithPasswordRequest)) as loginWithPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static loginWithPasswordRequest create() => loginWithPasswordRequest._();
  loginWithPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<loginWithPasswordRequest> createRepeated() => $pb.PbList<loginWithPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static loginWithPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<loginWithPasswordRequest>(create);
  static loginWithPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class loginWithPasswordResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'loginWithPasswordResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  loginWithPasswordResponse._() : super();
  factory loginWithPasswordResponse({
    $core.bool? succeed,
    $core.String? id,
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
  factory loginWithPasswordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory loginWithPasswordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  loginWithPasswordResponse clone() => loginWithPasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  loginWithPasswordResponse copyWith(void Function(loginWithPasswordResponse) updates) => super.copyWith((message) => updates(message as loginWithPasswordResponse)) as loginWithPasswordResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static loginWithPasswordResponse create() => loginWithPasswordResponse._();
  loginWithPasswordResponse createEmptyInstance() => create();
  static $pb.PbList<loginWithPasswordResponse> createRepeated() => $pb.PbList<loginWithPasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static loginWithPasswordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<loginWithPasswordResponse>(create);
  static loginWithPasswordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class loginWithSMSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'loginWithSMSRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..hasRequiredFields = false
  ;

  loginWithSMSRequest._() : super();
  factory loginWithSMSRequest({
    $core.String? number,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    return _result;
  }
  factory loginWithSMSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory loginWithSMSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  loginWithSMSRequest clone() => loginWithSMSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  loginWithSMSRequest copyWith(void Function(loginWithSMSRequest) updates) => super.copyWith((message) => updates(message as loginWithSMSRequest)) as loginWithSMSRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static loginWithSMSRequest create() => loginWithSMSRequest._();
  loginWithSMSRequest createEmptyInstance() => create();
  static $pb.PbList<loginWithSMSRequest> createRepeated() => $pb.PbList<loginWithSMSRequest>();
  @$core.pragma('dart2js:noInline')
  static loginWithSMSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<loginWithSMSRequest>(create);
  static loginWithSMSRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);
}

class loginWithSMSResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'loginWithSMSResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  loginWithSMSResponse._() : super();
  factory loginWithSMSResponse({
    $core.bool? succeed,
    $core.String? id,
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
  factory loginWithSMSResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory loginWithSMSResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  loginWithSMSResponse clone() => loginWithSMSResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  loginWithSMSResponse copyWith(void Function(loginWithSMSResponse) updates) => super.copyWith((message) => updates(message as loginWithSMSResponse)) as loginWithSMSResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static loginWithSMSResponse create() => loginWithSMSResponse._();
  loginWithSMSResponse createEmptyInstance() => create();
  static $pb.PbList<loginWithSMSResponse> createRepeated() => $pb.PbList<loginWithSMSResponse>();
  @$core.pragma('dart2js:noInline')
  static loginWithSMSResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<loginWithSMSResponse>(create);
  static loginWithSMSResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class changeUserNameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeUserNameRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newName', protoName: 'newName')
    ..hasRequiredFields = false
  ;

  changeUserNameRequest._() : super();
  factory changeUserNameRequest({
    $core.String? id,
    $core.String? newName,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (newName != null) {
      _result.newName = newName;
    }
    return _result;
  }
  factory changeUserNameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeUserNameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeUserNameRequest clone() => changeUserNameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeUserNameRequest copyWith(void Function(changeUserNameRequest) updates) => super.copyWith((message) => updates(message as changeUserNameRequest)) as changeUserNameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeUserNameRequest create() => changeUserNameRequest._();
  changeUserNameRequest createEmptyInstance() => create();
  static $pb.PbList<changeUserNameRequest> createRepeated() => $pb.PbList<changeUserNameRequest>();
  @$core.pragma('dart2js:noInline')
  static changeUserNameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeUserNameRequest>(create);
  static changeUserNameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newName => $_getSZ(1);
  @$pb.TagNumber(2)
  set newName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewName() => clearField(2);
}

class changeUserNameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeUserNameResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  changeUserNameResponse._() : super();
  factory changeUserNameResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory changeUserNameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeUserNameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeUserNameResponse clone() => changeUserNameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeUserNameResponse copyWith(void Function(changeUserNameResponse) updates) => super.copyWith((message) => updates(message as changeUserNameResponse)) as changeUserNameResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeUserNameResponse create() => changeUserNameResponse._();
  changeUserNameResponse createEmptyInstance() => create();
  static $pb.PbList<changeUserNameResponse> createRepeated() => $pb.PbList<changeUserNameResponse>();
  @$core.pragma('dart2js:noInline')
  static changeUserNameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeUserNameResponse>(create);
  static changeUserNameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class changeUserGenderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeUserGenderRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Gender>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newGender', $pb.PbFieldType.OE, protoName: 'newGender', defaultOrMaker: Gender.MALE, valueOf: Gender.valueOf, enumValues: Gender.values)
    ..hasRequiredFields = false
  ;

  changeUserGenderRequest._() : super();
  factory changeUserGenderRequest({
    $core.String? id,
    Gender? newGender,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (newGender != null) {
      _result.newGender = newGender;
    }
    return _result;
  }
  factory changeUserGenderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeUserGenderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeUserGenderRequest clone() => changeUserGenderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeUserGenderRequest copyWith(void Function(changeUserGenderRequest) updates) => super.copyWith((message) => updates(message as changeUserGenderRequest)) as changeUserGenderRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeUserGenderRequest create() => changeUserGenderRequest._();
  changeUserGenderRequest createEmptyInstance() => create();
  static $pb.PbList<changeUserGenderRequest> createRepeated() => $pb.PbList<changeUserGenderRequest>();
  @$core.pragma('dart2js:noInline')
  static changeUserGenderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeUserGenderRequest>(create);
  static changeUserGenderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Gender get newGender => $_getN(1);
  @$pb.TagNumber(2)
  set newGender(Gender v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewGender() => clearField(2);
}

class changeUserGenderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'changeUserGenderResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'succeed')
    ..hasRequiredFields = false
  ;

  changeUserGenderResponse._() : super();
  factory changeUserGenderResponse({
    $core.bool? succeed,
  }) {
    final _result = create();
    if (succeed != null) {
      _result.succeed = succeed;
    }
    return _result;
  }
  factory changeUserGenderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory changeUserGenderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  changeUserGenderResponse clone() => changeUserGenderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  changeUserGenderResponse copyWith(void Function(changeUserGenderResponse) updates) => super.copyWith((message) => updates(message as changeUserGenderResponse)) as changeUserGenderResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static changeUserGenderResponse create() => changeUserGenderResponse._();
  changeUserGenderResponse createEmptyInstance() => create();
  static $pb.PbList<changeUserGenderResponse> createRepeated() => $pb.PbList<changeUserGenderResponse>();
  @$core.pragma('dart2js:noInline')
  static changeUserGenderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<changeUserGenderResponse>(create);
  static changeUserGenderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succeed => $_getBF(0);
  @$pb.TagNumber(1)
  set succeed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSucceed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSucceed() => clearField(1);
}

class registerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'registerRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<Gender>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.OE, defaultOrMaker: Gender.MALE, valueOf: Gender.valueOf, enumValues: Gender.values)
    ..hasRequiredFields = false
  ;

  registerRequest._() : super();
  factory registerRequest({
    $core.String? number,
    $core.String? password,
    $core.String? name,
    $core.String? id,
    Gender? gender,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    if (password != null) {
      _result.password = password;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    return _result;
  }
  factory registerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory registerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  registerRequest clone() => registerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  registerRequest copyWith(void Function(registerRequest) updates) => super.copyWith((message) => updates(message as registerRequest)) as registerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static registerRequest create() => registerRequest._();
  registerRequest createEmptyInstance() => create();
  static $pb.PbList<registerRequest> createRepeated() => $pb.PbList<registerRequest>();
  @$core.pragma('dart2js:noInline')
  static registerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<registerRequest>(create);
  static registerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  Gender get gender => $_getN(4);
  @$pb.TagNumber(5)
  set gender(Gender v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);
}

class registerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'registerResponse', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'idCheck', protoName: 'idCheck')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numberCheck', protoName: 'numberCheck')
    ..hasRequiredFields = false
  ;

  registerResponse._() : super();
  factory registerResponse({
    $core.bool? idCheck,
    $core.bool? numberCheck,
  }) {
    final _result = create();
    if (idCheck != null) {
      _result.idCheck = idCheck;
    }
    if (numberCheck != null) {
      _result.numberCheck = numberCheck;
    }
    return _result;
  }
  factory registerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory registerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  registerResponse clone() => registerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  registerResponse copyWith(void Function(registerResponse) updates) => super.copyWith((message) => updates(message as registerResponse)) as registerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static registerResponse create() => registerResponse._();
  registerResponse createEmptyInstance() => create();
  static $pb.PbList<registerResponse> createRepeated() => $pb.PbList<registerResponse>();
  @$core.pragma('dart2js:noInline')
  static registerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<registerResponse>(create);
  static registerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get idCheck => $_getBF(0);
  @$pb.TagNumber(1)
  set idCheck($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdCheck() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdCheck() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get numberCheck => $_getBF(1);
  @$pb.TagNumber(2)
  set numberCheck($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumberCheck() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumberCheck() => clearField(2);
}

class requestSMSRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'requestSMSRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number')
    ..e<SMSType>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: SMSType.REGISTER, valueOf: SMSType.valueOf, enumValues: SMSType.values)
    ..hasRequiredFields = false
  ;

  requestSMSRequest._() : super();
  factory requestSMSRequest({
    $core.String? number,
    SMSType? type,
  }) {
    final _result = create();
    if (number != null) {
      _result.number = number;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory requestSMSRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory requestSMSRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  requestSMSRequest clone() => requestSMSRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  requestSMSRequest copyWith(void Function(requestSMSRequest) updates) => super.copyWith((message) => updates(message as requestSMSRequest)) as requestSMSRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static requestSMSRequest create() => requestSMSRequest._();
  requestSMSRequest createEmptyInstance() => create();
  static $pb.PbList<requestSMSRequest> createRepeated() => $pb.PbList<requestSMSRequest>();
  @$core.pragma('dart2js:noInline')
  static requestSMSRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<requestSMSRequest>(create);
  static requestSMSRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get number => $_getSZ(0);
  @$pb.TagNumber(1)
  set number($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumber() => clearField(1);

  @$pb.TagNumber(2)
  SMSType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(SMSType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class requestSMSResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'requestSMSResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validMinutes', $pb.PbFieldType.O3, protoName: 'validMinutes')
    ..hasRequiredFields = false
  ;

  requestSMSResponse._() : super();
  factory requestSMSResponse({
    $core.String? code,
    $core.int? validMinutes,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (validMinutes != null) {
      _result.validMinutes = validMinutes;
    }
    return _result;
  }
  factory requestSMSResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory requestSMSResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  requestSMSResponse clone() => requestSMSResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  requestSMSResponse copyWith(void Function(requestSMSResponse) updates) => super.copyWith((message) => updates(message as requestSMSResponse)) as requestSMSResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static requestSMSResponse create() => requestSMSResponse._();
  requestSMSResponse createEmptyInstance() => create();
  static $pb.PbList<requestSMSResponse> createRepeated() => $pb.PbList<requestSMSResponse>();
  @$core.pragma('dart2js:noInline')
  static requestSMSResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<requestSMSResponse>(create);
  static requestSMSResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get validMinutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set validMinutes($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValidMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearValidMinutes() => clearField(2);
}

