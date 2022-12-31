///
//  Generated code. Do not modify.
//  source: FriendCircleManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use commentTypeDescriptor instead')
const CommentType$json = const {
  '1': 'CommentType',
  '2': const [
    const {'1': 'COMMENT', '2': 0},
    const {'1': 'REPLY', '2': 1},
  ],
};

/// Descriptor for `CommentType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List commentTypeDescriptor = $convert.base64Decode('CgtDb21tZW50VHlwZRILCgdDT01NRU5UEAASCQoFUkVQTFkQAQ==');
@$core.Deprecated('Use thumbTypeDescriptor instead')
const ThumbType$json = const {
  '1': 'ThumbType',
  '2': const [
    const {'1': 'THUMB_UP', '2': 0},
    const {'1': 'THUMB_DOWN', '2': 1},
  ],
};

/// Descriptor for `ThumbType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List thumbTypeDescriptor = $convert.base64Decode('CglUaHVtYlR5cGUSDAoIVEhVTUJfVVAQABIOCgpUSFVNQl9ET1dOEAE=');
@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = const {
  '1': 'Comment',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.CommentType', '10': 'type'},
    const {'1': 'fromId', '3': 2, '4': 1, '5': 9, '10': 'fromId'},
    const {'1': 'toId', '3': 3, '4': 1, '5': 9, '10': 'toId'},
    const {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode('CgdDb21tZW50EiAKBHR5cGUYASABKA4yDC5Db21tZW50VHlwZVIEdHlwZRIWCgZmcm9tSWQYAiABKAlSBmZyb21JZBISCgR0b0lkGAMgASgJUgR0b0lkEhgKB2NvbnRlbnQYBCABKAlSB2NvbnRlbnQSHAoJdGltZXN0YW1wGAUgASgDUgl0aW1lc3RhbXA=');
@$core.Deprecated('Use friendCircleDescriptor instead')
const FriendCircle$json = const {
  '1': 'FriendCircle',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'imageNum', '3': 4, '4': 1, '5': 5, '10': 'imageNum'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'thumbUpIds', '3': 6, '4': 3, '5': 9, '10': 'thumbUpIds'},
    const {'1': 'comments', '3': 7, '4': 3, '5': 11, '6': '.Comment', '10': 'comments'},
  ],
};

/// Descriptor for `FriendCircle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List friendCircleDescriptor = $convert.base64Decode('CgxGcmllbmRDaXJjbGUSDgoCaWQYASABKANSAmlkEhYKBnVzZXJJZBgCIAEoCVIGdXNlcklkEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQSGgoIaW1hZ2VOdW0YBCABKAVSCGltYWdlTnVtEhwKCXRpbWVzdGFtcBgFIAEoA1IJdGltZXN0YW1wEh4KCnRodW1iVXBJZHMYBiADKAlSCnRodW1iVXBJZHMSJAoIY29tbWVudHMYByADKAsyCC5Db21tZW50Ughjb21tZW50cw==');
@$core.Deprecated('Use deleteRequestDescriptor instead')
const DeleteRequest$json = const {
  '1': 'DeleteRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'friendCircleId', '3': 2, '4': 1, '5': 3, '10': 'friendCircleId'},
  ],
};

/// Descriptor for `DeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRequestDescriptor = $convert.base64Decode('Cg1EZWxldGVSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEiYKDmZyaWVuZENpcmNsZUlkGAIgASgDUg5mcmllbmRDaXJjbGVJZA==');
@$core.Deprecated('Use deleteResponseDescriptor instead')
const DeleteResponse$json = const {
  '1': 'DeleteResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `DeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResponseDescriptor = $convert.base64Decode('Cg5EZWxldGVSZXNwb25zZRIYCgdzdWNjZWVkGAEgASgIUgdzdWNjZWVk');
@$core.Deprecated('Use getFriendCirclesRequestDescriptor instead')
const GetFriendCirclesRequest$json = const {
  '1': 'GetFriendCirclesRequest',
  '2': const [
    const {'1': 'broadcast', '3': 1, '4': 1, '5': 8, '10': 'broadcast'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetFriendCirclesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendCirclesRequestDescriptor = $convert.base64Decode('ChdHZXRGcmllbmRDaXJjbGVzUmVxdWVzdBIcCglicm9hZGNhc3QYASABKAhSCWJyb2FkY2FzdBIWCgZ1c2VySWQYAiABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use getFriendCirclesResponseDescriptor instead')
const GetFriendCirclesResponse$json = const {
  '1': 'GetFriendCirclesResponse',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 3, '10': 'ids'},
  ],
};

/// Descriptor for `GetFriendCirclesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendCirclesResponseDescriptor = $convert.base64Decode('ChhHZXRGcmllbmRDaXJjbGVzUmVzcG9uc2USEAoDaWRzGAEgAygDUgNpZHM=');
@$core.Deprecated('Use getDetailRequestDescriptor instead')
const GetDetailRequest$json = const {
  '1': 'GetDetailRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetDetailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDetailRequestDescriptor = $convert.base64Decode('ChBHZXREZXRhaWxSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');
@$core.Deprecated('Use publishResponseDescriptor instead')
const PublishResponse$json = const {
  '1': 'PublishResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
    const {'1': 'id', '3': 2, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `PublishResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishResponseDescriptor = $convert.base64Decode('Cg9QdWJsaXNoUmVzcG9uc2USGAoHc3VjY2VlZBgBIAEoCFIHc3VjY2VlZBIOCgJpZBgCIAEoA1ICaWQ=');
@$core.Deprecated('Use sendCommentRequestDescriptor instead')
const SendCommentRequest$json = const {
  '1': 'SendCommentRequest',
  '2': const [
    const {'1': 'friendCircleId', '3': 1, '4': 1, '5': 3, '10': 'friendCircleId'},
    const {'1': 'comment', '3': 2, '4': 1, '5': 11, '6': '.Comment', '10': 'comment'},
  ],
};

/// Descriptor for `SendCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommentRequestDescriptor = $convert.base64Decode('ChJTZW5kQ29tbWVudFJlcXVlc3QSJgoOZnJpZW5kQ2lyY2xlSWQYASABKANSDmZyaWVuZENpcmNsZUlkEiIKB2NvbW1lbnQYAiABKAsyCC5Db21tZW50Ugdjb21tZW50');
@$core.Deprecated('Use sendCommentResponseDescriptor instead')
const SendCommentResponse$json = const {
  '1': 'SendCommentResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `SendCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommentResponseDescriptor = $convert.base64Decode('ChNTZW5kQ29tbWVudFJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQ=');
@$core.Deprecated('Use thumbRequestDescriptor instead')
const ThumbRequest$json = const {
  '1': 'ThumbRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'friendCircleId', '3': 2, '4': 1, '5': 3, '10': 'friendCircleId'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.ThumbType', '10': 'type'},
  ],
};

/// Descriptor for `ThumbRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List thumbRequestDescriptor = $convert.base64Decode('CgxUaHVtYlJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSJgoOZnJpZW5kQ2lyY2xlSWQYAiABKANSDmZyaWVuZENpcmNsZUlkEh4KBHR5cGUYAyABKA4yCi5UaHVtYlR5cGVSBHR5cGU=');
@$core.Deprecated('Use thumbResponseDescriptor instead')
const ThumbResponse$json = const {
  '1': 'ThumbResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `ThumbResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List thumbResponseDescriptor = $convert.base64Decode('Cg1UaHVtYlJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQ=');
