///
//  Generated code. Do not modify.
//  source: UserManager.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Gender extends $pb.ProtobufEnum {
  static const Gender MALE = Gender._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MALE');
  static const Gender FEMALE = Gender._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FEMALE');

  static const $core.List<Gender> values = <Gender> [
    MALE,
    FEMALE,
  ];

  static final $core.Map<$core.int, Gender> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Gender? valueOf($core.int value) => _byValue[value];

  const Gender._($core.int v, $core.String n) : super(v, n);
}

class SMSType extends $pb.ProtobufEnum {
  static const SMSType REGISTER = SMSType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGISTER');
  static const SMSType LOGIN = SMSType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOGIN');

  static const $core.List<SMSType> values = <SMSType> [
    REGISTER,
    LOGIN,
  ];

  static final $core.Map<$core.int, SMSType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SMSType? valueOf($core.int value) => _byValue[value];

  const SMSType._($core.int v, $core.String n) : super(v, n);
}

