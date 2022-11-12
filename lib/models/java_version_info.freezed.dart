// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'java_version_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JavaVersionInfo _$JavaVersionInfoFromJson(Map<String, dynamic> json) {
  return _JavaVersionInfo.fromJson(json);
}

/// @nodoc
mixin _$JavaVersionInfo {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JavaVersionInfoCopyWith<$Res> {
  factory $JavaVersionInfoCopyWith(
          JavaVersionInfo value, $Res Function(JavaVersionInfo) then) =
      _$JavaVersionInfoCopyWithImpl<$Res, JavaVersionInfo>;
}

/// @nodoc
class _$JavaVersionInfoCopyWithImpl<$Res, $Val extends JavaVersionInfo>
    implements $JavaVersionInfoCopyWith<$Res> {
  _$JavaVersionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_JavaVersionInfoCopyWith<$Res> {
  factory _$$_JavaVersionInfoCopyWith(
          _$_JavaVersionInfo value, $Res Function(_$_JavaVersionInfo) then) =
      __$$_JavaVersionInfoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_JavaVersionInfoCopyWithImpl<$Res>
    extends _$JavaVersionInfoCopyWithImpl<$Res, _$_JavaVersionInfo>
    implements _$$_JavaVersionInfoCopyWith<$Res> {
  __$$_JavaVersionInfoCopyWithImpl(
      _$_JavaVersionInfo _value, $Res Function(_$_JavaVersionInfo) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_JavaVersionInfo implements _JavaVersionInfo {
  _$_JavaVersionInfo();

  factory _$_JavaVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$$_JavaVersionInfoFromJson(json);

  @override
  String toString() {
    return 'JavaVersionInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_JavaVersionInfo);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_JavaVersionInfoToJson(
      this,
    );
  }
}

abstract class _JavaVersionInfo implements JavaVersionInfo {
  factory _JavaVersionInfo() = _$_JavaVersionInfo;

  factory _JavaVersionInfo.fromJson(Map<String, dynamic> json) =
      _$_JavaVersionInfo.fromJson;
}
