///
//  Generated code. Do not modify.
//  source: MessageManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'MessageManager.pb.dart' as $0;
export 'MessageManager.pb.dart';

class MessageManagerClient extends $grpc.Client {
  static final _$createSession =
      $grpc.ClientMethod<$0.CreateSessionRequest, $0.CreateSessionResponse>(
          '/MessageManager/createSession',
          ($0.CreateSessionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateSessionResponse.fromBuffer(value));
  static final _$getMessages =
      $grpc.ClientMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
          '/MessageManager/getMessages',
          ($0.GetMessagesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetMessagesResponse.fromBuffer(value));
  static final _$getSessionList =
      $grpc.ClientMethod<$0.GetSessionListRequest, $0.GetSessionListResponse>(
          '/MessageManager/getSessionList',
          ($0.GetSessionListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetSessionListResponse.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$0.SearchRequest, $0.SearchResponse>(
          '/MessageManager/search',
          ($0.SearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SearchResponse.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$0.MessageTile, $0.SendMessageResponse>(
          '/MessageManager/sendMessage',
          ($0.MessageTile value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SendMessageResponse.fromBuffer(value));

  MessageManagerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateSessionResponse> createSession(
      $0.CreateSessionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMessagesResponse> getMessages(
      $0.GetMessagesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSessionListResponse> getSessionList(
      $0.GetSessionListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSessionList, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchResponse> search($0.SearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendMessageResponse> sendMessage(
      $0.MessageTile request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

abstract class MessageManagerServiceBase extends $grpc.Service {
  $core.String get $name => 'MessageManager';

  MessageManagerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateSessionRequest, $0.CreateSessionResponse>(
            'createSession',
            createSession_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateSessionRequest.fromBuffer(value),
            ($0.CreateSessionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetMessagesRequest, $0.GetMessagesResponse>(
            'getMessages',
            getMessages_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetMessagesRequest.fromBuffer(value),
            ($0.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSessionListRequest,
            $0.GetSessionListResponse>(
        'getSessionList',
        getSessionList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetSessionListRequest.fromBuffer(value),
        ($0.GetSessionListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchRequest, $0.SearchResponse>(
        'search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchRequest.fromBuffer(value),
        ($0.SearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MessageTile, $0.SendMessageResponse>(
        'sendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageTile.fromBuffer(value),
        ($0.SendMessageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateSessionResponse> createSession_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateSessionRequest> request) async {
    return createSession(call, await request);
  }

  $async.Future<$0.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Future<$0.GetSessionListResponse> getSessionList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetSessionListRequest> request) async {
    return getSessionList(call, await request);
  }

  $async.Future<$0.SearchResponse> search_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SearchRequest> request) async {
    return search(call, await request);
  }

  $async.Future<$0.SendMessageResponse> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MessageTile> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.CreateSessionResponse> createSession(
      $grpc.ServiceCall call, $0.CreateSessionRequest request);
  $async.Future<$0.GetMessagesResponse> getMessages(
      $grpc.ServiceCall call, $0.GetMessagesRequest request);
  $async.Future<$0.GetSessionListResponse> getSessionList(
      $grpc.ServiceCall call, $0.GetSessionListRequest request);
  $async.Future<$0.SearchResponse> search(
      $grpc.ServiceCall call, $0.SearchRequest request);
  $async.Future<$0.SendMessageResponse> sendMessage(
      $grpc.ServiceCall call, $0.MessageTile request);
}
