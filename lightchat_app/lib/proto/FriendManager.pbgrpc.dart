///
//  Generated code. Do not modify.
//  source: FriendManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'FriendManager.pb.dart' as $0;
export 'FriendManager.pb.dart';

class FriendManagerClient extends $grpc.Client {
  static final _$acceptNewFriend =
      $grpc.ClientMethod<$0.NewFriendRequest, $0.acceptNewFriendResponse>(
          '/FriendManager/acceptNewFriend',
          ($0.NewFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.acceptNewFriendResponse.fromBuffer(value));
  static final _$changeRemarkName = $grpc.ClientMethod<
          $0.changeRemarkNameRequest, $0.changeRemarkNameResponse>(
      '/FriendManager/changeRemarkName',
      ($0.changeRemarkNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.changeRemarkNameResponse.fromBuffer(value));
  static final _$checkFriend =
      $grpc.ClientMethod<$0.checkFriendRequest, $0.checkFriendResponse>(
          '/FriendManager/checkFriend',
          ($0.checkFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.checkFriendResponse.fromBuffer(value));
  static final _$deleteFriend =
      $grpc.ClientMethod<$0.deleteFriendRequest, $0.deleteFriendResponse>(
          '/FriendManager/deleteFriend',
          ($0.deleteFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.deleteFriendResponse.fromBuffer(value));
  static final _$getFriends =
      $grpc.ClientMethod<$0.getFriendsRequest, $0.getFriendsResponse>(
          '/FriendManager/getFriends',
          ($0.getFriendsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.getFriendsResponse.fromBuffer(value));
  static final _$getNewFriendRequests = $grpc.ClientMethod<
          $0.getNewFriendRequestsRequest, $0.getNewFriendRequestsResponse>(
      '/FriendManager/getNewFriendRequests',
      ($0.getNewFriendRequestsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.getNewFriendRequestsResponse.fromBuffer(value));
  static final _$rejectNewFriend =
      $grpc.ClientMethod<$0.NewFriendRequest, $0.rejectNewFriendResponse>(
          '/FriendManager/rejectNewFriend',
          ($0.NewFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.rejectNewFriendResponse.fromBuffer(value));
  static final _$sendNewFriendRequest =
      $grpc.ClientMethod<$0.NewFriendRequest, $0.sendNewFriendRequestResponse>(
          '/FriendManager/sendNewFriendRequest',
          ($0.NewFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.sendNewFriendRequestResponse.fromBuffer(value));

  FriendManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.acceptNewFriendResponse> acceptNewFriend(
      $0.NewFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acceptNewFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.changeRemarkNameResponse> changeRemarkName(
      $0.changeRemarkNameRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeRemarkName, request, options: options);
  }

  $grpc.ResponseFuture<$0.checkFriendResponse> checkFriend(
      $0.checkFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.deleteFriendResponse> deleteFriend(
      $0.deleteFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.getFriendsResponse> getFriends(
      $0.getFriendsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFriends, request, options: options);
  }

  $grpc.ResponseFuture<$0.getNewFriendRequestsResponse> getNewFriendRequests(
      $0.getNewFriendRequestsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNewFriendRequests, request, options: options);
  }

  $grpc.ResponseFuture<$0.rejectNewFriendResponse> rejectNewFriend(
      $0.NewFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rejectNewFriend, request, options: options);
  }

  $grpc.ResponseFuture<$0.sendNewFriendRequestResponse> sendNewFriendRequest(
      $0.NewFriendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendNewFriendRequest, request, options: options);
  }
}

abstract class FriendManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'FriendManager';

  FriendManagerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.NewFriendRequest, $0.acceptNewFriendResponse>(
            'acceptNewFriend',
            acceptNewFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.NewFriendRequest.fromBuffer(value),
            ($0.acceptNewFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.changeRemarkNameRequest,
            $0.changeRemarkNameResponse>(
        'changeRemarkName',
        changeRemarkName_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.changeRemarkNameRequest.fromBuffer(value),
        ($0.changeRemarkNameResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.checkFriendRequest, $0.checkFriendResponse>(
            'checkFriend',
            checkFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.checkFriendRequest.fromBuffer(value),
            ($0.checkFriendResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.deleteFriendRequest, $0.deleteFriendResponse>(
            'deleteFriend',
            deleteFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.deleteFriendRequest.fromBuffer(value),
            ($0.deleteFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getFriendsRequest, $0.getFriendsResponse>(
        'getFriends',
        getFriends_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.getFriendsRequest.fromBuffer(value),
        ($0.getFriendsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getNewFriendRequestsRequest,
            $0.getNewFriendRequestsResponse>(
        'getNewFriendRequests',
        getNewFriendRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getNewFriendRequestsRequest.fromBuffer(value),
        ($0.getNewFriendRequestsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.NewFriendRequest, $0.rejectNewFriendResponse>(
            'rejectNewFriend',
            rejectNewFriend_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.NewFriendRequest.fromBuffer(value),
            ($0.rejectNewFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NewFriendRequest,
            $0.sendNewFriendRequestResponse>(
        'sendNewFriendRequest',
        sendNewFriendRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NewFriendRequest.fromBuffer(value),
        ($0.sendNewFriendRequestResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.acceptNewFriendResponse> acceptNewFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NewFriendRequest> request) async {
    return acceptNewFriend(call, await request);
  }

  $async.Future<$0.changeRemarkNameResponse> changeRemarkName_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.changeRemarkNameRequest> request) async {
    return changeRemarkName(call, await request);
  }

  $async.Future<$0.checkFriendResponse> checkFriend_Pre($grpc.ServiceCall call,
      $async.Future<$0.checkFriendRequest> request) async {
    return checkFriend(call, await request);
  }

  $async.Future<$0.deleteFriendResponse> deleteFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.deleteFriendRequest> request) async {
    return deleteFriend(call, await request);
  }

  $async.Future<$0.getFriendsResponse> getFriends_Pre($grpc.ServiceCall call,
      $async.Future<$0.getFriendsRequest> request) async {
    return getFriends(call, await request);
  }

  $async.Future<$0.getNewFriendRequestsResponse> getNewFriendRequests_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.getNewFriendRequestsRequest> request) async {
    return getNewFriendRequests(call, await request);
  }

  $async.Future<$0.rejectNewFriendResponse> rejectNewFriend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NewFriendRequest> request) async {
    return rejectNewFriend(call, await request);
  }

  $async.Future<$0.sendNewFriendRequestResponse> sendNewFriendRequest_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NewFriendRequest> request) async {
    return sendNewFriendRequest(call, await request);
  }

  $async.Future<$0.acceptNewFriendResponse> acceptNewFriend(
      $grpc.ServiceCall call, $0.NewFriendRequest request);
  $async.Future<$0.changeRemarkNameResponse> changeRemarkName(
      $grpc.ServiceCall call, $0.changeRemarkNameRequest request);
  $async.Future<$0.checkFriendResponse> checkFriend(
      $grpc.ServiceCall call, $0.checkFriendRequest request);
  $async.Future<$0.deleteFriendResponse> deleteFriend(
      $grpc.ServiceCall call, $0.deleteFriendRequest request);
  $async.Future<$0.getFriendsResponse> getFriends(
      $grpc.ServiceCall call, $0.getFriendsRequest request);
  $async.Future<$0.getNewFriendRequestsResponse> getNewFriendRequests(
      $grpc.ServiceCall call, $0.getNewFriendRequestsRequest request);
  $async.Future<$0.rejectNewFriendResponse> rejectNewFriend(
      $grpc.ServiceCall call, $0.NewFriendRequest request);
  $async.Future<$0.sendNewFriendRequestResponse> sendNewFriendRequest(
      $grpc.ServiceCall call, $0.NewFriendRequest request);
}
