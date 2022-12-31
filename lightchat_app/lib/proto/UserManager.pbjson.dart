///
//  Generated code. Do not modify.
//  source: UserManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use genderDescriptor instead')
const Gender$json = const {
  '1': 'Gender',
  '2': const [
    const {'1': 'MALE', '2': 0},
    const {'1': 'FEMALE', '2': 1},
  ],
};

/// Descriptor for `Gender`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List genderDescriptor = $convert.base64Decode('CgZHZW5kZXISCAoETUFMRRAAEgoKBkZFTUFMRRAB');
@$core.Deprecated('Use sMSTypeDescriptor instead')
const SMSType$json = const {
  '1': 'SMSType',
  '2': const [
    const {'1': 'REGISTER', '2': 0},
    const {'1': 'LOGIN', '2': 1},
  ],
};

/// Descriptor for `SMSType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sMSTypeDescriptor = $convert.base64Decode('CgdTTVNUeXBlEgwKCFJFR0lTVEVSEAASCQoFTE9HSU4QAQ==');
@$core.Deprecated('Use getUserInfoByIdRequestDescriptor instead')
const getUserInfoByIdRequest$json = const {
  '1': 'getUserInfoByIdRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `getUserInfoByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoByIdRequestDescriptor = $convert.base64Decode('ChZnZXRVc2VySW5mb0J5SWRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use getUserInfoByIdResponseDescriptor instead')
const getUserInfoByIdResponse$json = const {
  '1': 'getUserInfoByIdResponse',
  '2': const [
    const {'1': 'exist', '3': 1, '4': 1, '5': 8, '10': 'exist'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'gender', '3': 3, '4': 1, '5': 14, '6': '.Gender', '10': 'gender'},
  ],
};

/// Descriptor for `getUserInfoByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoByIdResponseDescriptor = $convert.base64Decode('ChdnZXRVc2VySW5mb0J5SWRSZXNwb25zZRIUCgVleGlzdBgBIAEoCFIFZXhpc3QSEgoEbmFtZRgCIAEoCVIEbmFtZRIfCgZnZW5kZXIYAyABKA4yBy5HZW5kZXJSBmdlbmRlcg==');
@$core.Deprecated('Use getUserInfoByNumberRequestDescriptor instead')
const getUserInfoByNumberRequest$json = const {
  '1': 'getUserInfoByNumberRequest',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
  ],
};

/// Descriptor for `getUserInfoByNumberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoByNumberRequestDescriptor = $convert.base64Decode('ChpnZXRVc2VySW5mb0J5TnVtYmVyUmVxdWVzdBIWCgZudW1iZXIYASABKAlSBm51bWJlcg==');
@$core.Deprecated('Use getUserInfoByNumberResponseDescriptor instead')
const getUserInfoByNumberResponse$json = const {
  '1': 'getUserInfoByNumberResponse',
  '2': const [
    const {'1': 'exist', '3': 1, '4': 1, '5': 8, '10': 'exist'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'gender', '3': 4, '4': 1, '5': 14, '6': '.Gender', '10': 'gender'},
  ],
};

/// Descriptor for `getUserInfoByNumberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoByNumberResponseDescriptor = $convert.base64Decode('ChtnZXRVc2VySW5mb0J5TnVtYmVyUmVzcG9uc2USFAoFZXhpc3QYASABKAhSBWV4aXN0Eg4KAmlkGAIgASgJUgJpZBISCgRuYW1lGAMgASgJUgRuYW1lEh8KBmdlbmRlchgEIAEoDjIHLkdlbmRlclIGZ2VuZGVy');
@$core.Deprecated('Use loginWithPasswordRequestDescriptor instead')
const loginWithPasswordRequest$json = const {
  '1': 'loginWithPasswordRequest',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `loginWithPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginWithPasswordRequestDescriptor = $convert.base64Decode('Chhsb2dpbldpdGhQYXNzd29yZFJlcXVlc3QSFgoGbnVtYmVyGAEgASgJUgZudW1iZXISGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3Jk');
@$core.Deprecated('Use loginWithPasswordResponseDescriptor instead')
const loginWithPasswordResponse$json = const {
  '1': 'loginWithPasswordResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `loginWithPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginWithPasswordResponseDescriptor = $convert.base64Decode('Chlsb2dpbldpdGhQYXNzd29yZFJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQSDgoCaWQYAiABKAlSAmlk');
@$core.Deprecated('Use loginWithSMSRequestDescriptor instead')
const loginWithSMSRequest$json = const {
  '1': 'loginWithSMSRequest',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
  ],
};

/// Descriptor for `loginWithSMSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginWithSMSRequestDescriptor = $convert.base64Decode('ChNsb2dpbldpdGhTTVNSZXF1ZXN0EhYKBm51bWJlchgBIAEoCVIGbnVtYmVy');
@$core.Deprecated('Use loginWithSMSResponseDescriptor instead')
const loginWithSMSResponse$json = const {
  '1': 'loginWithSMSResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `loginWithSMSResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginWithSMSResponseDescriptor = $convert.base64Decode('ChRsb2dpbldpdGhTTVNSZXNwb25zZRIYCgdzdWNjZWVkGAEgASgIUgdzdWNjZWVkEg4KAmlkGAIgASgJUgJpZA==');
@$core.Deprecated('Use changeUserNameRequestDescriptor instead')
const changeUserNameRequest$json = const {
  '1': 'changeUserNameRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'newName', '3': 2, '4': 1, '5': 9, '10': 'newName'},
  ],
};

/// Descriptor for `changeUserNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserNameRequestDescriptor = $convert.base64Decode('ChVjaGFuZ2VVc2VyTmFtZVJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhgKB25ld05hbWUYAiABKAlSB25ld05hbWU=');
@$core.Deprecated('Use changeUserNameResponseDescriptor instead')
const changeUserNameResponse$json = const {
  '1': 'changeUserNameResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `changeUserNameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserNameResponseDescriptor = $convert.base64Decode('ChZjaGFuZ2VVc2VyTmFtZVJlc3BvbnNlEhgKB3N1Y2NlZWQYASABKAhSB3N1Y2NlZWQ=');
@$core.Deprecated('Use changeUserGenderRequestDescriptor instead')
const changeUserGenderRequest$json = const {
  '1': 'changeUserGenderRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'newGender', '3': 2, '4': 1, '5': 14, '6': '.Gender', '10': 'newGender'},
  ],
};

/// Descriptor for `changeUserGenderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserGenderRequestDescriptor = $convert.base64Decode('ChdjaGFuZ2VVc2VyR2VuZGVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSJQoJbmV3R2VuZGVyGAIgASgOMgcuR2VuZGVyUgluZXdHZW5kZXI=');
@$core.Deprecated('Use changeUserGenderResponseDescriptor instead')
const changeUserGenderResponse$json = const {
  '1': 'changeUserGenderResponse',
  '2': const [
    const {'1': 'succeed', '3': 1, '4': 1, '5': 8, '10': 'succeed'},
  ],
};

/// Descriptor for `changeUserGenderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeUserGenderResponseDescriptor = $convert.base64Decode('ChhjaGFuZ2VVc2VyR2VuZGVyUmVzcG9uc2USGAoHc3VjY2VlZBgBIAEoCFIHc3VjY2VlZA==');
@$core.Deprecated('Use registerRequestDescriptor instead')
const registerRequest$json = const {
  '1': 'registerRequest',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'gender', '3': 5, '4': 1, '5': 14, '6': '.Gender', '10': 'gender'},
  ],
};

/// Descriptor for `registerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9yZWdpc3RlclJlcXVlc3QSFgoGbnVtYmVyGAEgASgJUgZudW1iZXISGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEhIKBG5hbWUYAyABKAlSBG5hbWUSDgoCaWQYBCABKAlSAmlkEh8KBmdlbmRlchgFIAEoDjIHLkdlbmRlclIGZ2VuZGVy');
@$core.Deprecated('Use registerResponseDescriptor instead')
const registerResponse$json = const {
  '1': 'registerResponse',
  '2': const [
    const {'1': 'idCheck', '3': 1, '4': 1, '5': 8, '10': 'idCheck'},
    const {'1': 'numberCheck', '3': 2, '4': 1, '5': 8, '10': 'numberCheck'},
  ],
};

/// Descriptor for `registerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode('ChByZWdpc3RlclJlc3BvbnNlEhgKB2lkQ2hlY2sYASABKAhSB2lkQ2hlY2sSIAoLbnVtYmVyQ2hlY2sYAiABKAhSC251bWJlckNoZWNr');
@$core.Deprecated('Use requestSMSRequestDescriptor instead')
const requestSMSRequest$json = const {
  '1': 'requestSMSRequest',
  '2': const [
    const {'1': 'number', '3': 1, '4': 1, '5': 9, '10': 'number'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.SMSType', '10': 'type'},
  ],
};

/// Descriptor for `requestSMSRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestSMSRequestDescriptor = $convert.base64Decode('ChFyZXF1ZXN0U01TUmVxdWVzdBIWCgZudW1iZXIYASABKAlSBm51bWJlchIcCgR0eXBlGAIgASgOMgguU01TVHlwZVIEdHlwZQ==');
@$core.Deprecated('Use requestSMSResponseDescriptor instead')
const requestSMSResponse$json = const {
  '1': 'requestSMSResponse',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'validMinutes', '3': 2, '4': 1, '5': 5, '10': 'validMinutes'},
  ],
};

/// Descriptor for `requestSMSResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestSMSResponseDescriptor = $convert.base64Decode('ChJyZXF1ZXN0U01TUmVzcG9uc2USEgoEY29kZRgBIAEoCVIEY29kZRIiCgx2YWxpZE1pbnV0ZXMYAiABKAVSDHZhbGlkTWludXRlcw==');
