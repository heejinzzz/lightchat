///
//  Generated code. Do not modify.
//  source: MessageManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use getRequestTypeDescriptor instead')
const GetRequestType$json = const {
  '1': 'GetRequestType',
  '2': const [
    const {'1': 'CHAT', '2': 0},
    const {'1': 'HISTORY', '2': 1},
  ],
};

/// Descriptor for `GetRequestType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List getRequestTypeDescriptor = $convert.base64Decode('Cg5HZXRSZXF1ZXN0VHlwZRIICgRDSEFUEAASCwoHSElTVE9SWRAB');
@$core.Deprecated('Use messageTypeDescriptor instead')
const MessageType$json = const {
  '1': 'MessageType',
  '2': const [
    const {'1': 'TEXT', '2': 0},
    const {'1': 'IMAGE', '2': 1},
    const {'1': 'VIDEO', '2': 2},
    const {'1': 'FILE', '2': 3},
  ],
};

/// Descriptor for `MessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageTypeDescriptor = $convert.base64Decode('CgtNZXNzYWdlVHlwZRIICgRURVhUEAASCQoFSU1BR0UQARIJCgVWSURFTxACEggKBEZJTEUQAw==');
@$core.Deprecated('Use messageTileDescriptor instead')
const MessageTile$json = const {
  '1': 'MessageTile',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    const {'1': 'countId', '3': 2, '4': 1, '5': 3, '10': 'countId'},
    const {'1': 'userId', '3': 3, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.MessageType', '10': 'type'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'size', '3': 6, '4': 1, '5': 3, '10': 'size'},
    const {'1': 'timestamp', '3': 7, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `MessageTile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageTileDescriptor = $convert.base64Decode('CgtNZXNzYWdlVGlsZRIcCgltZXNzYWdlSWQYASABKAlSCW1lc3NhZ2VJZBIYCgdjb3VudElkGAIgASgDUgdjb3VudElkEhYKBnVzZXJJZBgDIAEoCVIGdXNlcklkEiAKBHR5cGUYBCABKA4yDC5NZXNzYWdlVHlwZVIEdHlwZRIYCgdjb250ZW50GAUgASgJUgdjb250ZW50EhIKBHNpemUYBiABKANSBHNpemUSHAoJdGltZXN0YW1wGAcgASgDUgl0aW1lc3RhbXA=');
@$core.Deprecated('Use createSessionRequestDescriptor instead')
const CreateSessionRequest$json = const {
  '1': 'CreateSessionRequest',
  '2': const [
    const {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `CreateSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSessionRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVTZXNzaW9uUmVxdWVzdBIcCglzZXNzaW9uSWQYASABKAlSCXNlc3Npb25JZBIWCgZ1c2VySWQYAiABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use createSessionResponseDescriptor instead')
const CreateSessionResponse$json = const {
  '1': 'CreateSessionResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `CreateSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSessionResponseDescriptor = $convert.base64Decode('ChVDcmVhdGVTZXNzaW9uUmVzcG9uc2USGAoHc3VjY2VlZBgBIAEoCFIHc3VjY2VlZA==');
@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = const {
  '1': 'GetMessagesRequest',
  '2': const [
    const {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.GetRequestType', '10': 'type'},
    const {'1': 'targetMessageId', '3': 3, '4': 1, '5': 9, '10': 'targetMessageId'},
    const {'1': 'isStartPage', '3': 4, '4': 1, '5': 8, '10': 'isStartPage'},
    const {'1': 'lastMessageId', '3': 5, '4': 1, '5': 9, '10': 'lastMessageId'},
  ],
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode('ChJHZXRNZXNzYWdlc1JlcXVlc3QSHAoJc2Vzc2lvbklkGAEgASgJUglzZXNzaW9uSWQSIwoEdHlwZRgCIAEoDjIPLkdldFJlcXVlc3RUeXBlUgR0eXBlEigKD3RhcmdldE1lc3NhZ2VJZBgDIAEoCVIPdGFyZ2V0TWVzc2FnZUlkEiAKC2lzU3RhcnRQYWdlGAQgASgIUgtpc1N0YXJ0UGFnZRIkCg1sYXN0TWVzc2FnZUlkGAUgASgJUg1sYXN0TWVzc2FnZUlk');
@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = const {
  '1': 'GetMessagesResponse',
  '2': const [
    const {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.MessageTile', '10': 'messages'},
    const {'1': 'isLastPage', '3': 2, '4': 1, '5': 8, '10': 'isLastPage'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode('ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEigKCG1lc3NhZ2VzGAEgAygLMgwuTWVzc2FnZVRpbGVSCG1lc3NhZ2VzEh4KCmlzTGFzdFBhZ2UYAiABKAhSCmlzTGFzdFBhZ2U=');
@$core.Deprecated('Use getSessionListRequestDescriptor instead')
const GetSessionListRequest$json = const {
  '1': 'GetSessionListRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetSessionListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionListRequestDescriptor = $convert.base64Decode('ChVHZXRTZXNzaW9uTGlzdFJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQ=');
@$core.Deprecated('Use getSessionListResponseDescriptor instead')
const GetSessionListResponse$json = const {
  '1': 'GetSessionListResponse',
  '2': const [
    const {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.MessageTile', '10': 'messages'},
  ],
};

/// Descriptor for `GetSessionListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSessionListResponseDescriptor = $convert.base64Decode('ChZHZXRTZXNzaW9uTGlzdFJlc3BvbnNlEigKCG1lc3NhZ2VzGAEgAygLMgwuTWVzc2FnZVRpbGVSCG1lc3NhZ2Vz');
@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = const {
  '1': 'SearchRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'keyword', '3': 2, '4': 1, '5': 9, '10': 'keyword'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode('Cg1TZWFyY2hSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhgKB2tleXdvcmQYAiABKAlSB2tleXdvcmQ=');
@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse$json = const {
  '1': 'SearchResponse',
  '2': const [
    const {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.MessageTile', '10': 'messages'},
  ],
};

/// Descriptor for `SearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResponseDescriptor = $convert.base64Decode('Cg5TZWFyY2hSZXNwb25zZRIoCghtZXNzYWdlcxgBIAMoCzIMLk1lc3NhZ2VUaWxlUghtZXNzYWdlcw==');
@$core.Deprecated('Use sendMessageResponseDescriptor instead')
const SendMessageResponse$json = const {
  '1': 'SendMessageResponse',
  '2': const [
    const {'1': 'messageId', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
  ],
};

/// Descriptor for `SendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageResponseDescriptor = $convert.base64Decode('ChNTZW5kTWVzc2FnZVJlc3BvbnNlEhwKCW1lc3NhZ2VJZBgBIAEoCVIJbWVzc2FnZUlk');
