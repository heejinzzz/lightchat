///
//  Generated code. Do not modify.
//  source: MessageManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GetRequestType extends $pb.ProtobufEnum {
  static const GetRequestType CHAT = GetRequestType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT');
  static const GetRequestType HISTORY = GetRequestType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HISTORY');

  static const $core.List<GetRequestType> values = <GetRequestType> [
    CHAT,
    HISTORY,
  ];

  static final $core.Map<$core.int, GetRequestType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetRequestType? valueOf($core.int value) => _byValue[value];

  const GetRequestType._($core.int v, $core.String n) : super(v, n);
}

class MessageType extends $pb.ProtobufEnum {
  static const MessageType TEXT = MessageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const MessageType IMAGE = MessageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const MessageType VIDEO = MessageType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');
  static const MessageType FILE = MessageType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FILE');

  static const $core.List<MessageType> values = <MessageType> [
    TEXT,
    IMAGE,
    VIDEO,
    FILE,
  ];

  static final $core.Map<$core.int, MessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageType? valueOf($core.int value) => _byValue[value];

  const MessageType._($core.int v, $core.String n) : super(v, n);
}

