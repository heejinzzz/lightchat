///
//  Generated code. Do not modify.
//  source: FriendCircleManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'FriendCircleManager.pb.dart' as $0;
export 'FriendCircleManager.pb.dart';

class FriendCircleManagerClient extends $grpc.Client {
  static final _$delete =
      $grpc.ClientMethod<$0.DeleteRequest, $0.DeleteResponse>(
          '/FriendCircleManager/delete',
          ($0.DeleteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DeleteResponse.fromBuffer(value));
  static final _$getFriendCircles = $grpc.ClientMethod<
          $0.GetFriendCirclesRequest, $0.GetFriendCirclesResponse>(
      '/FriendCircleManager/getFriendCircles',
      ($0.GetFriendCirclesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetFriendCirclesResponse.fromBuffer(value));
  static final _$getDetail =
      $grpc.ClientMethod<$0.GetDetailRequest, $0.FriendCircle>(
          '/FriendCircleManager/getDetail',
          ($0.GetDetailRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.FriendCircle.fromBuffer(value));
  static final _$publish =
      $grpc.ClientMethod<$0.FriendCircle, $0.PublishResponse>(
          '/FriendCircleManager/publish',
          ($0.FriendCircle value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PublishResponse.fromBuffer(value));
  static final _$sendComment =
      $grpc.ClientMethod<$0.SendCommentRequest, $0.SendCommentResponse>(
          '/FriendCircleManager/sendComment',
          ($0.SendCommentRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SendCommentResponse.fromBuffer(value));
  static final _$thumb = $grpc.ClientMethod<$0.ThumbRequest, $0.ThumbResponse>(
      '/FriendCircleManager/thumb',
      ($0.ThumbRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ThumbResponse.fromBuffer(value));

  FriendCircleManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.DeleteResponse> delete($0.DeleteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$delete, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFriendCirclesResponse> getFriendCircles(
      $0.GetFriendCirclesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFriendCircles, request, options: options);
  }

  $grpc.ResponseFuture<$0.FriendCircle> getDetail($0.GetDetailRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDetail, request, options: options);
  }

  $grpc.ResponseFuture<$0.PublishResponse> publish($0.FriendCircle request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$publish, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendCommentResponse> sendComment(
      $0.SendCommentRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ThumbResponse> thumb($0.ThumbRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$thumb, request, options: options);
  }
}

abstract class FriendCircleManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'FriendCircleManager';

  FriendCircleManagerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DeleteRequest, $0.DeleteResponse>(
        'delete',
        delete_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRequest.fromBuffer(value),
        ($0.DeleteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFriendCirclesRequest,
            $0.GetFriendCirclesResponse>(
        'getFriendCircles',
        getFriendCircles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetFriendCirclesRequest.fromBuffer(value),
        ($0.GetFriendCirclesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDetailRequest, $0.FriendCircle>(
        'getDetail',
        getDetail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDetailRequest.fromBuffer(value),
        ($0.FriendCircle value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FriendCircle, $0.PublishResponse>(
        'publish',
        publish_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FriendCircle.fromBuffer(value),
        ($0.PublishResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SendCommentRequest, $0.SendCommentResponse>(
            'sendComment',
            sendComment_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SendCommentRequest.fromBuffer(value),
            ($0.SendCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ThumbRequest, $0.ThumbResponse>(
        'thumb',
        thumb_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ThumbRequest.fromBuffer(value),
        ($0.ThumbResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.DeleteResponse> delete_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteRequest> request) async {
    return delete(call, await request);
  }

  $async.Future<$0.GetFriendCirclesResponse> getFriendCircles_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetFriendCirclesRequest> request) async {
    return getFriendCircles(call, await request);
  }

  $async.Future<$0.FriendCircle> getDetail_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetDetailRequest> request) async {
    return getDetail(call, await request);
  }

  $async.Future<$0.PublishResponse> publish_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FriendCircle> request) async {
    return publish(call, await request);
  }

  $async.Future<$0.SendCommentResponse> sendComment_Pre($grpc.ServiceCall call,
      $async.Future<$0.SendCommentRequest> request) async {
    return sendComment(call, await request);
  }

  $async.Future<$0.ThumbResponse> thumb_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ThumbRequest> request) async {
    return thumb(call, await request);
  }

  $async.Future<$0.DeleteResponse> delete(
      $grpc.ServiceCall call, $0.DeleteRequest request);
  $async.Future<$0.GetFriendCirclesResponse> getFriendCircles(
      $grpc.ServiceCall call, $0.GetFriendCirclesRequest request);
  $async.Future<$0.FriendCircle> getDetail(
      $grpc.ServiceCall call, $0.GetDetailRequest request);
  $async.Future<$0.PublishResponse> publish(
      $grpc.ServiceCall call, $0.FriendCircle request);
  $async.Future<$0.SendCommentResponse> sendComment(
      $grpc.ServiceCall call, $0.SendCommentRequest request);
  $async.Future<$0.ThumbResponse> thumb(
      $grpc.ServiceCall call, $0.ThumbRequest request);
}
