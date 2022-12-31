///
//  Generated code. Do not modify.
//  source: FriendManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NewFriendRequestState extends $pb.ProtobufEnum {
  static const NewFriendRequestState WAIT_FOR_ACCEPT = NewFriendRequestState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAIT_FOR_ACCEPT');
  static const NewFriendRequestState ACCEPTED = NewFriendRequestState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCEPTED');
  static const NewFriendRequestState REJECTED = NewFriendRequestState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REJECTED');

  static const $core.List<NewFriendRequestState> values = <NewFriendRequestState> [
    WAIT_FOR_ACCEPT,
    ACCEPTED,
    REJECTED,
  ];

  static final $core.Map<$core.int, NewFriendRequestState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NewFriendRequestState? valueOf($core.int value) => _byValue[value];

  const NewFriendRequestState._($core.int v, $core.String n) : super(v, n);
}

