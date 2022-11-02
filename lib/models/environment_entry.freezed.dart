// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'environment_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnvironmentEntry _$EnvironmentEntryFromJson(Map<String, dynamic> json) {
  return _EnvironmentEntry.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentEntry {
  /// The string value of the entry.
  String get value => throw _privateConstructorUsedError;

  /// Whether the entry is enabled.
  bool get enabled => throw _privateConstructorUsedError;

  /// The name of the environment variable.
  String get parent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnvironmentEntryCopyWith<EnvironmentEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentEntryCopyWith<$Res> {
  factory $EnvironmentEntryCopyWith(
          EnvironmentEntry value, $Res Function(EnvironmentEntry) then) =
      _$EnvironmentEntryCopyWithImpl<$Res, EnvironmentEntry>;
  @useResult
  $Res call({String value, bool enabled, String parent});
}

/// @nodoc
class _$EnvironmentEntryCopyWithImpl<$Res, $Val extends EnvironmentEntry>
    implements $EnvironmentEntryCopyWith<$Res> {
  _$EnvironmentEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? enabled = null,
    Object? parent = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnvironmentEntryCopyWith<$Res>
    implements $EnvironmentEntryCopyWith<$Res> {
  factory _$$_EnvironmentEntryCopyWith(
          _$_EnvironmentEntry value, $Res Function(_$_EnvironmentEntry) then) =
      __$$_EnvironmentEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool enabled, String parent});
}

/// @nodoc
class __$$_EnvironmentEntryCopyWithImpl<$Res>
    extends _$EnvironmentEntryCopyWithImpl<$Res, _$_EnvironmentEntry>
    implements _$$_EnvironmentEntryCopyWith<$Res> {
  __$$_EnvironmentEntryCopyWithImpl(
      _$_EnvironmentEntry _value, $Res Function(_$_EnvironmentEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? enabled = null,
    Object? parent = null,
  }) {
    return _then(_$_EnvironmentEntry(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnvironmentEntry extends _EnvironmentEntry {
  const _$_EnvironmentEntry(
      {required this.value, required this.enabled, required this.parent})
      : super._();

  factory _$_EnvironmentEntry.fromJson(Map<String, dynamic> json) =>
      _$$_EnvironmentEntryFromJson(json);

  /// The string value of the entry.
  @override
  final String value;

  /// Whether the entry is enabled.
  @override
  final bool enabled;

  /// The name of the environment variable.
  @override
  final String parent;

  @override
  String toString() {
    return 'EnvironmentEntry(value: $value, enabled: $enabled, parent: $parent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnvironmentEntry &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.parent, parent) || other.parent == parent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, enabled, parent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvironmentEntryCopyWith<_$_EnvironmentEntry> get copyWith =>
      __$$_EnvironmentEntryCopyWithImpl<_$_EnvironmentEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnvironmentEntryToJson(
      this,
    );
  }
}

abstract class _EnvironmentEntry extends EnvironmentEntry {
  const factory _EnvironmentEntry(
      {required final String value,
      required final bool enabled,
      required final String parent}) = _$_EnvironmentEntry;
  const _EnvironmentEntry._() : super._();

  factory _EnvironmentEntry.fromJson(Map<String, dynamic> json) =
      _$_EnvironmentEntry.fromJson;

  @override

  /// The string value of the entry.
  String get value;
  @override

  /// Whether the entry is enabled.
  bool get enabled;
  @override

  /// The name of the environment variable.
  String get parent;
  @override
  @JsonKey(ignore: true)
  _$$_EnvironmentEntryCopyWith<_$_EnvironmentEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
