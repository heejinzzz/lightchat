///
//  Generated code. Do not modify.
//  source: FriendManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use newFriendRequestStateDescriptor instead')
const NewFriendRequestState$json = const {
  '1': 'NewFriendRequestState',
  '2': const [
    const {'1': 'WAIT_FOR_ACCEPT', '2': 0},
    const {'1': 'ACCEPTED', '2': 1},
    const {'1': 'REJECTED', '2': 2},
  ],
};

/// Descriptor for `NewFriendRequestState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List newFriendRequestStateDescriptor = $convert.base64Decode('ChVOZXdGcmllbmRSZXF1ZXN0U3RhdGUSEwoPV0FJVF9GT1JfQUNDRVBUEAASDAoIQUNDRVBURUQQARIMCghSRUpFQ1RFRBAC');
@$core.Deprecated('Use newFriendRequestDescriptor instead')
const NewFriendRequest$json = const {
  '1': 'NewFriendRequest',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 3, '10': 'requestId'},
    const {'1': 'fromId', '3': 2, '4': 1, '5': 9, '10': 'fromId'},
    const {'1': 'toId', '3': 3, '4': 1, '5': 9, '10': 'toId'},
    const {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.NewFriendRequestState', '10': 'state'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'fromRemarkName', '3': 6, '4': 1, '5': 9, '10': 'fromRemarkName'},
    const {'1': 'toRemarkName', '3': 7, '4': 1, '5': 9, '10': 'toRemarkName'},
  ],
};

/// Descriptor for `NewFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newFriendRequestDescriptor = $convert.base64Decode('ChBOZXdGcmllbmRSZXF1ZXN0EhwKCXJlcXVlc3RJZBgBIAEoA1IJcmVxdWVzdElkEhYKBmZyb21JZBgCIAEoCVIGZnJvbUlkEhIKBHRvSWQYAyABKAlSBHRvSWQSLAoFc3RhdGUYBCABKA4yFi5OZXdGcmllbmRSZXF1ZXN0U3RhdGVSBXN0YXRlEhgKB2NvbnRlbnQYBSABKAlSB2NvbnRlbnQSJgoOZnJvbVJlbWFya05hbWUYBiABKAlSDmZyb21SZW1hcmtOYW1lEiIKDHRvUmVtYXJrTmFtZRgHIAEoCVIMdG9SZW1hcmtOYW1l');
@$core.Deprecated('Use acceptNewFriendResponseDescriptor instead')
const acceptNewFriendResponse$json = const {
  '1': 'acceptNewFriendResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `acceptNewFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acceptNewFriendResponseDescriptor = $convert.base64Decode('ChdhY2NlcHROZXdGcmllbmRSZXNwb25zZRIYCgdzdWNjZWVkGAEgASgIUgdzdWNjZWVk');
@$core.Deprecated('Use changeRemarkNameRequestDescriptor instead')
const changeRemarkNameRequest$json = const {
  '1': 'changeRemarkNameRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'friendId', '3': 2, '4': 1, '5': 9, '10': 'friendId'},
    const {'1': 'newRemarkName', '3': 3, '4': 1, '5': 9, '10': 'newRemarkName'},
  ],
};

/// Descriptor for `changeRemarkNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeRemarkNameRequestDescriptor = $convert.base64Decode('ChdjaGFuZ2VSZW1hcmtOYW1lUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSGgoIZnJpZW5kSWQYAiABKAlSCGZyaWVuZElkEiQKDW5ld1JlbWFya05hbWUYAyABKAlSDW5ld1JlbWFya05hbWU=');
@$core.Deprecated('Use changeRemarkNameResponseDescriptor instead')
const changeRemarkNameResponse$json = const {
  '1': 'changeRemarkNameResponse',
  '2': const [
    const {'1': 'isFriend', '3': 1, '4': 1, '5': 8, '10': 'isFriend'},
    const {'1': 'succeed', '3': 2, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `changeRemarkNameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeRemarkNameResponseDescriptor = $convert.base64Decode('ChhjaGFuZ2VSZW1hcmtOYW1lUmVzcG9uc2USGgoIaXNGcmllbmQYASABKAhSCGlzRnJpZW5kEhgKB3N1Y2NlZWQYAiABKAhSB3N1Y2NlZWQ=');
@$core.Deprecated('Use checkFriendRequestDescriptor instead')
const checkFriendRequest$json = const {
  '1': 'checkFriendRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'targetId', '3': 2, '4': 1, '5': 9, '10': 'targetId'},
  ],
};

/// Descriptor for `checkFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkFriendRequestDescriptor = $convert.base64Decode('ChJjaGVja0ZyaWVuZFJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhoKCHRhcmdldElkGAIgASgJUgh0YXJnZXRJZA==');
@$core.Deprecated('Use checkFriendResponseDescriptor instead')
const checkFriendResponse$json = const {
  '1': 'checkFriendResponse',
  '2': const [
    const {'1': 'isFriend', '3': 1, '4': 1, '5': 8, '10': 'isFriend'},
    const {'1': 'remarkName', '3': 2, '4': 1, '5': 9, '10': 'remarkName'},
  ],
};

/// Descriptor for `checkFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkFriendResponseDescriptor = $convert.base64Decode('ChNjaGVja0ZyaWVuZFJlc3BvbnNlEhoKCGlzRnJpZW5kGAEgASgIUghpc0ZyaWVuZBIeCgpyZW1hcmtOYW1lGAIgASgJUgpyZW1hcmtOYW1l');
@$core.Deprecated('Use deleteFriendRequestDescriptor instead')
const deleteFriendRequest$json = const {
  '1': 'deleteFriendRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'friendId', '3': 2, '4': 1, '5': 9, '10': 'friendId'},
  ],
};

/// Descriptor for `deleteFriendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFriendRequestDescriptor = $convert.base64Decode('ChNkZWxldGVGcmllbmRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIaCghmcmllbmRJZBgCIAEoCVIIZnJpZW5kSWQ=');
@$core.Deprecated('Use deleteFriendResponseDescriptor instead')
const deleteFriendResponse$json = const {
  '1': 'deleteFriendResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `deleteFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFriendResponseDescriptor = $convert.base64Decode('ChRkZWxldGVGcmllbmRSZXNwb25zZRIYCgdzdWNjZWVkGAEgASgIUgdzdWNjZWVk');
@$core.Deprecated('Use getFriendsRequestDescriptor instead')
const getFriendsRequest$json = const {
  '1': 'getFriendsRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `getFriendsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendsRequestDescriptor = $convert.base64Decode('ChFnZXRGcmllbmRzUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use getFriendsResponseDescriptor instead')
const getFriendsResponse$json = const {
  '1': 'getFriendsResponse',
  '2': const [
    const {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `getFriendsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFriendsResponseDescriptor = $convert.base64Decode('ChJnZXRGcmllbmRzUmVzcG9uc2USEAoDaWRzGAEgAygJUgNpZHM=');
@$core.Deprecated('Use getNewFriendRequestsRequestDescriptor instead')
const getNewFriendRequestsRequest$json = const {
  '1': 'getNewFriendRequestsRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `getNewFriendRequestsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewFriendRequestsRequestDescriptor = $convert.base64Decode('ChtnZXROZXdGcmllbmRSZXF1ZXN0c1JlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use getNewFriendRequestsResponseDescriptor instead')
const getNewFriendRequestsResponse$json = const {
  '1': 'getNewFriendRequestsResponse',
  '2': const [
    const {'1': 'requests', '3': 1, '4': 3, '5': 11, '6': '.NewFriendRequest', '10': 'requests'},
  ],
};

/// Descriptor for `getNewFriendRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewFriendRequestsResponseDescriptor = $convert.base64Decode('ChxnZXROZXdGcmllbmRSZXF1ZXN0c1Jlc3BvbnNlEi0KCHJlcXVlc3RzGAEgAygLMhEuTmV3RnJpZW5kUmVxdWVzdFIIcmVxdWVzdHM=');
@$core.Deprecated('Use rejectNewFriendResponseDescriptor instead')
const rejectNewFriendResponse$json = const {
  '1': 'rejectNewFriendResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `rejectNewFriendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rejectNewFriendResponseDescriptor = $convert.base64Decode('ChdyZWplY3ROZXdGcmllbmRSZXNwb25zZRIYCgdzdWNjZWVkGAEgASgIUgdzdWNjZWVk');
@$core.Deprecated('Use sendNewFriendRequestResponseDescriptor instead')
const sendNewFriendRequestResponse$json = const {
  '1': 'sendNewFriendRequestResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `sendNewFriendRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendNewFriendRequestResponseDescriptor = $convert.base64Decode('ChxzZW5kTmV3RnJpZW5kUmVxdWVzdFJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQ=');
