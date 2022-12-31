///
//  Generated code. Do not modify.
//  source: UserManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'UserManager.pb.dart' as $0;
export 'UserManager.pb.dart';

class UserManagerClient extends $grpc.Client {
  static final _$getUserInfoById =
      $grpc.ClientMethod<$0.getUserInfoByIdRequest, $0.getUserInfoByIdResponse>(
          '/UserManager/getUserInfoById',
          ($0.getUserInfoByIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.getUserInfoByIdResponse.fromBuffer(value));
  static final _$getUserInfoByNumber = $grpc.ClientMethod<
          $0.getUserInfoByNumberRequest, $0.getUserInfoByNumberResponse>(
      '/UserManager/getUserInfoByNumber',
      ($0.getUserInfoByNumberRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.getUserInfoByNumberResponse.fromBuffer(value));
  static final _$loginWithPassword = $grpc.ClientMethod<
          $0.loginWithPasswordRequest, $0.loginWithPasswordResponse>(
      '/UserManager/loginWithPassword',
      ($0.loginWithPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.loginWithPasswordResponse.fromBuffer(value));
  static final _$loginWithSMS =
      $grpc.ClientMethod<$0.loginWithSMSRequest, $0.loginWithSMSResponse>(
          '/UserManager/loginWithSMS',
          ($0.loginWithSMSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.loginWithSMSResponse.fromBuffer(value));
  static final _$changeUserName =
      $grpc.ClientMethod<$0.changeUserNameRequest, $0.changeUserNameResponse>(
          '/UserManager/changeUserName',
          ($0.changeUserNameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.changeUserNameResponse.fromBuffer(value));
  static final _$changeUserGender = $grpc.ClientMethod<
          $0.changeUserGenderRequest, $0.changeUserGenderResponse>(
      '/UserManager/changeUserGender',
      ($0.changeUserGenderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.changeUserGenderResponse.fromBuffer(value));
  static final _$register =
      $grpc.ClientMethod<$0.registerRequest, $0.registerResponse>(
          '/UserManager/register',
          ($0.registerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.registerResponse.fromBuffer(value));
  static final _$requestSMS =
      $grpc.ClientMethod<$0.requestSMSRequest, $0.requestSMSResponse>(
          '/UserManager/requestSMS',
          ($0.requestSMSRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.requestSMSResponse.fromBuffer(value));

  UserManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.getUserInfoByIdResponse> getUserInfoById(
      $0.getUserInfoByIdRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfoById, request, options: options);
  }

  $grpc.ResponseFuture<$0.getUserInfoByNumberResponse> getUserInfoByNumber(
      $0.getUserInfoByNumberRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfoByNumber, request, options: options);
  }

  $grpc.ResponseFuture<$0.loginWithPasswordResponse> loginWithPassword(
      $0.loginWithPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginWithPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.loginWithSMSResponse> loginWithSMS(
      $0.loginWithSMSRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginWithSMS, request, options: options);
  }

  $grpc.ResponseFuture<$0.changeUserNameResponse> changeUserName(
      $0.changeUserNameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeUserName, request, options: options);
  }

  $grpc.ResponseFuture<$0.changeUserGenderResponse> changeUserGender(
      $0.changeUserGenderRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeUserGender, request, options: options);
  }

  $grpc.ResponseFuture<$0.registerResponse> register($0.registerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.requestSMSResponse> requestSMS(
      $0.requestSMSRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestSMS, request, options: options);
  }
}

abstract class UserManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'UserManager';

  UserManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.getUserInfoByIdRequest,
            $0.getUserInfoByIdResponse>(
        'getUserInfoById',
        getUserInfoById_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getUserInfoByIdRequest.fromBuffer(value),
        ($0.getUserInfoByIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getUserInfoByNumberRequest,
            $0.getUserInfoByNumberResponse>(
        'getUserInfoByNumber',
        getUserInfoByNumber_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getUserInfoByNumberRequest.fromBuffer(value),
        ($0.getUserInfoByNumberResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.loginWithPasswordRequest,
            $0.loginWithPasswordResponse>(
        'loginWithPassword',
        loginWithPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.loginWithPasswordRequest.fromBuffer(value),
        ($0.loginWithPasswordResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.loginWithSMSRequest, $0.loginWithSMSResponse>(
            'loginWithSMS',
            loginWithSMS_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.loginWithSMSRequest.fromBuffer(value),
            ($0.loginWithSMSResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.changeUserNameRequest,
            $0.changeUserNameResponse>(
        'changeUserName',
        changeUserName_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.changeUserNameRequest.fromBuffer(value),
        ($0.changeUserNameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.changeUserGenderRequest,
            $0.changeUserGenderResponse>(
        'changeUserGender',
        changeUserGender_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.changeUserGenderRequest.fromBuffer(value),
        ($0.changeUserGenderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.registerRequest, $0.registerResponse>(
        'register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.registerRequest.fromBuffer(value),
        ($0.registerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.requestSMSRequest, $0.requestSMSResponse>(
        'requestSMS',
        requestSMS_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.requestSMSRequest.fromBuffer(value),
        ($0.requestSMSResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.getUserInfoByIdResponse> getUserInfoById_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.getUserInfoByIdRequest> request) async {
    return getUserInfoById(call, await request);
  }

  $async.Future<$0.getUserInfoByNumberResponse> getUserInfoByNumber_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.getUserInfoByNumberRequest> request) async {
    return getUserInfoByNumber(call, await request);
  }

  $async.Future<$0.loginWithPasswordResponse> loginWithPassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.loginWithPasswordRequest> request) async {
    return loginWithPassword(call, await request);
  }

  $async.Future<$0.loginWithSMSResponse> loginWithSMS_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.loginWithSMSRequest> request) async {
    return loginWithSMS(call, await request);
  }

  $async.Future<$0.changeUserNameResponse> changeUserName_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.changeUserNameRequest> request) async {
    return changeUserName(call, await request);
  }

  $async.Future<$0.changeUserGenderResponse> changeUserGender_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.changeUserGenderRequest> request) async {
    return changeUserGender(call, await request);
  }

  $async.Future<$0.registerResponse> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.registerRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.requestSMSResponse> requestSMS_Pre($grpc.ServiceCall call,
      $async.Future<$0.requestSMSRequest> request) async {
    return requestSMS(call, await request);
  }

  $async.Future<$0.getUserInfoByIdResponse> getUserInfoById(
      $grpc.ServiceCall call, $0.getUserInfoByIdRequest request);
  $async.Future<$0.getUserInfoByNumberResponse> getUserInfoByNumber(
      $grpc.ServiceCall call, $0.getUserInfoByNumberRequest request);
  $async.Future<$0.loginWithPasswordResponse> loginWithPassword(
      $grpc.ServiceCall call, $0.loginWithPasswordRequest request);
  $async.Future<$0.loginWithSMSResponse> loginWithSMS(
      $grpc.ServiceCall call, $0.loginWithSMSRequest request);
  $async.Future<$0.changeUserNameResponse> changeUserName(
      $grpc.ServiceCall call, $0.changeUserNameRequest request);
  $async.Future<$0.changeUserGenderResponse> changeUserGender(
      $grpc.ServiceCall call, $0.changeUserGenderRequest request);
  $async.Future<$0.registerResponse> register(
      $grpc.ServiceCall call, $0.registerRequest request);
  $async.Future<$0.requestSMSResponse> requestSMS(
      $grpc.ServiceCall call, $0.requestSMSRequest request);
}
