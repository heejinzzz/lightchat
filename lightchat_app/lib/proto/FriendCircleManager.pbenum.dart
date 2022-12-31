///
//  Generated code. Do not modify.
//  source: FriendCircleManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class CommentType extends $pb.ProtobufEnum {
  static const CommentType COMMENT = CommentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMENT');
  static const CommentType REPLY = CommentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPLY');

  static const $core.List<CommentType> values = <CommentType> [
    COMMENT,
    REPLY,
  ];

  static final $core.Map<$core.int, CommentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommentType? valueOf($core.int value) => _byValue[value];

  const CommentType._($core.int v, $core.String n) : super(v, n);
}

class ThumbType extends $pb.ProtobufEnum {
  static const ThumbType THUMB_UP = ThumbType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'THUMB_UP');
  static const ThumbType THUMB_DOWN = ThumbType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'THUMB_DOWN');

  static const $core.List<ThumbType> values = <ThumbType> [
    THUMB_UP,
    THUMB_DOWN,
  ];

  static final $core.Map<$core.int, ThumbType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ThumbType? valueOf($core.int value) => _byValue[value];

  const ThumbType._($core.int v, $core.String n) : super(v, n);
}

