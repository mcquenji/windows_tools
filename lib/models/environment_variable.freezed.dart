// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'environment_variable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnvironmentVariable _$EnvironmentVariableFromJson(Map<String, dynamic> json) {
  return _EnvironmentVariable.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentVariable {
  /// The name of the environment variable.
  String get name => throw _privateConstructorUsedError;

  /// The entries in the environment variable.
  List<EnvironmentEntry> get entries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnvironmentVariableCopyWith<EnvironmentVariable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentVariableCopyWith<$Res> {
  factory $EnvironmentVariableCopyWith(
          EnvironmentVariable value, $Res Function(EnvironmentVariable) then) =
      _$EnvironmentVariableCopyWithImpl<$Res, EnvironmentVariable>;
  @useResult
  $Res call({String name, List<EnvironmentEntry> entries});
}

/// @nodoc
class _$EnvironmentVariableCopyWithImpl<$Res, $Val extends EnvironmentVariable>
    implements $EnvironmentVariableCopyWith<$Res> {
  _$EnvironmentVariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<EnvironmentEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnvironmentVariableCopyWith<$Res>
    implements $EnvironmentVariableCopyWith<$Res> {
  factory _$$_EnvironmentVariableCopyWith(_$_EnvironmentVariable value,
          $Res Function(_$_EnvironmentVariable) then) =
      __$$_EnvironmentVariableCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<EnvironmentEntry> entries});
}

/// @nodoc
class __$$_EnvironmentVariableCopyWithImpl<$Res>
    extends _$EnvironmentVariableCopyWithImpl<$Res, _$_EnvironmentVariable>
    implements _$$_EnvironmentVariableCopyWith<$Res> {
  __$$_EnvironmentVariableCopyWithImpl(_$_EnvironmentVariable _value,
      $Res Function(_$_EnvironmentVariable) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? entries = null,
  }) {
    return _then(_$_EnvironmentVariable(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<EnvironmentEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnvironmentVariable implements _EnvironmentVariable {
  const _$_EnvironmentVariable(
      {required this.name, required final List<EnvironmentEntry> entries})
      : _entries = entries;

  factory _$_EnvironmentVariable.fromJson(Map<String, dynamic> json) =>
      _$$_EnvironmentVariableFromJson(json);

  /// The name of the environment variable.
  @override
  final String name;

  /// The entries in the environment variable.
  final List<EnvironmentEntry> _entries;

  /// The entries in the environment variable.
  @override
  List<EnvironmentEntry> get entries {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'EnvironmentVariable(name: $name, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnvironmentVariable &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnvironmentVariableCopyWith<_$_EnvironmentVariable> get copyWith =>
      __$$_EnvironmentVariableCopyWithImpl<_$_EnvironmentVariable>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnvironmentVariableToJson(
      this,
    );
  }
}

abstract class _EnvironmentVariable implements EnvironmentVariable {
  const factory _EnvironmentVariable(
      {required final String name,
      required final List<EnvironmentEntry> entries}) = _$_EnvironmentVariable;

  factory _EnvironmentVariable.fromJson(Map<String, dynamic> json) =
      _$_EnvironmentVariable.fromJson;

  @override

  /// The name of the environment variable.
  String get name;
  @override

  /// The entries in the environment variable.
  List<EnvironmentEntry> get entries;
  @override
  @JsonKey(ignore: true)
  _$$_EnvironmentVariableCopyWith<_$_EnvironmentVariable> get copyWith =>
      throw _privateConstructorUsedError;
}
