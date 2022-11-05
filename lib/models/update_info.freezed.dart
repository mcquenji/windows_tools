// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

/// @nodoc
mixin _$UpdateInfo {
  /// Whether a new version was found.
  bool get updateAvailable => throw _privateConstructorUsedError;

  /// The new version.
  String? get latestVersion => throw _privateConstructorUsedError;

  /// The error that occurred. If no error occurred, this is null.
  String? get errorMessage => throw _privateConstructorUsedError;

  /// The url to download the new version from.
  String? get downloadUrl => throw _privateConstructorUsedError;

  /// The progress of the installation.
  ///
  /// This is a value between 0 and 100.
  ///
  /// If no installation is in progress, this is null.
  double? get installProgress => throw _privateConstructorUsedError;

  /// When the last check for updates was performed.
  DateTime? get lastChecked => throw _privateConstructorUsedError;

  /// Wether the app is currently checking for updates.
  bool get checking => throw _privateConstructorUsedError;

  /// Patch notes for the new version.
  String? get patchNotes => throw _privateConstructorUsedError;

  /// The release date of the new version.
  DateTime? get releaseDate => throw _privateConstructorUsedError;

  /// The name of the release.
  String? get releaseName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoCopyWith<UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res, UpdateInfo>;
  @useResult
  $Res call(
      {bool updateAvailable,
      String? latestVersion,
      String? errorMessage,
      String? downloadUrl,
      double? installProgress,
      DateTime? lastChecked,
      bool checking,
      String? patchNotes,
      DateTime? releaseDate,
      String? releaseName});
}

/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res, $Val extends UpdateInfo>
    implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateAvailable = null,
    Object? latestVersion = freezed,
    Object? errorMessage = freezed,
    Object? downloadUrl = freezed,
    Object? installProgress = freezed,
    Object? lastChecked = freezed,
    Object? checking = null,
    Object? patchNotes = freezed,
    Object? releaseDate = freezed,
    Object? releaseName = freezed,
  }) {
    return _then(_value.copyWith(
      updateAvailable: null == updateAvailable
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      latestVersion: freezed == latestVersion
          ? _value.latestVersion
          : latestVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      installProgress: freezed == installProgress
          ? _value.installProgress
          : installProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checking: null == checking
          ? _value.checking
          : checking // ignore: cast_nullable_to_non_nullable
              as bool,
      patchNotes: freezed == patchNotes
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseName: freezed == releaseName
          ? _value.releaseName
          : releaseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateInfoCopyWith<$Res>
    implements $UpdateInfoCopyWith<$Res> {
  factory _$$_UpdateInfoCopyWith(
          _$_UpdateInfo value, $Res Function(_$_UpdateInfo) then) =
      __$$_UpdateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool updateAvailable,
      String? latestVersion,
      String? errorMessage,
      String? downloadUrl,
      double? installProgress,
      DateTime? lastChecked,
      bool checking,
      String? patchNotes,
      DateTime? releaseDate,
      String? releaseName});
}

/// @nodoc
class __$$_UpdateInfoCopyWithImpl<$Res>
    extends _$UpdateInfoCopyWithImpl<$Res, _$_UpdateInfo>
    implements _$$_UpdateInfoCopyWith<$Res> {
  __$$_UpdateInfoCopyWithImpl(
      _$_UpdateInfo _value, $Res Function(_$_UpdateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateAvailable = null,
    Object? latestVersion = freezed,
    Object? errorMessage = freezed,
    Object? downloadUrl = freezed,
    Object? installProgress = freezed,
    Object? lastChecked = freezed,
    Object? checking = null,
    Object? patchNotes = freezed,
    Object? releaseDate = freezed,
    Object? releaseName = freezed,
  }) {
    return _then(_$_UpdateInfo(
      updateAvailable: null == updateAvailable
          ? _value.updateAvailable
          : updateAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      latestVersion: freezed == latestVersion
          ? _value.latestVersion
          : latestVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      downloadUrl: freezed == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      installProgress: freezed == installProgress
          ? _value.installProgress
          : installProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checking: null == checking
          ? _value.checking
          : checking // ignore: cast_nullable_to_non_nullable
              as bool,
      patchNotes: freezed == patchNotes
          ? _value.patchNotes
          : patchNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseName: freezed == releaseName
          ? _value.releaseName
          : releaseName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfo extends _UpdateInfo {
  _$_UpdateInfo(
      {this.updateAvailable = false,
      this.latestVersion = null,
      this.errorMessage = null,
      this.downloadUrl = null,
      this.installProgress = null,
      this.lastChecked = null,
      this.checking = false,
      this.patchNotes = null,
      this.releaseDate = null,
      this.releaseName = null})
      : super._();

  factory _$_UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateInfoFromJson(json);

  /// Whether a new version was found.
  @override
  @JsonKey()
  final bool updateAvailable;

  /// The new version.
  @override
  @JsonKey()
  final String? latestVersion;

  /// The error that occurred. If no error occurred, this is null.
  @override
  @JsonKey()
  final String? errorMessage;

  /// The url to download the new version from.
  @override
  @JsonKey()
  final String? downloadUrl;

  /// The progress of the installation.
  ///
  /// This is a value between 0 and 100.
  ///
  /// If no installation is in progress, this is null.
  @override
  @JsonKey()
  final double? installProgress;

  /// When the last check for updates was performed.
  @override
  @JsonKey()
  final DateTime? lastChecked;

  /// Wether the app is currently checking for updates.
  @override
  @JsonKey()
  final bool checking;

  /// Patch notes for the new version.
  @override
  @JsonKey()
  final String? patchNotes;

  /// The release date of the new version.
  @override
  @JsonKey()
  final DateTime? releaseDate;

  /// The name of the release.
  @override
  @JsonKey()
  final String? releaseName;

  @override
  String toString() {
    return 'UpdateInfo(updateAvailable: $updateAvailable, latestVersion: $latestVersion, errorMessage: $errorMessage, downloadUrl: $downloadUrl, installProgress: $installProgress, lastChecked: $lastChecked, checking: $checking, patchNotes: $patchNotes, releaseDate: $releaseDate, releaseName: $releaseName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateInfo &&
            (identical(other.updateAvailable, updateAvailable) ||
                other.updateAvailable == updateAvailable) &&
            (identical(other.latestVersion, latestVersion) ||
                other.latestVersion == latestVersion) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.installProgress, installProgress) ||
                other.installProgress == installProgress) &&
            (identical(other.lastChecked, lastChecked) ||
                other.lastChecked == lastChecked) &&
            (identical(other.checking, checking) ||
                other.checking == checking) &&
            (identical(other.patchNotes, patchNotes) ||
                other.patchNotes == patchNotes) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.releaseName, releaseName) ||
                other.releaseName == releaseName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      updateAvailable,
      latestVersion,
      errorMessage,
      downloadUrl,
      installProgress,
      lastChecked,
      checking,
      patchNotes,
      releaseDate,
      releaseName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      __$$_UpdateInfoCopyWithImpl<_$_UpdateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateInfoToJson(
      this,
    );
  }
}

abstract class _UpdateInfo extends UpdateInfo {
  factory _UpdateInfo(
      {final bool updateAvailable,
      final String? latestVersion,
      final String? errorMessage,
      final String? downloadUrl,
      final double? installProgress,
      final DateTime? lastChecked,
      final bool checking,
      final String? patchNotes,
      final DateTime? releaseDate,
      final String? releaseName}) = _$_UpdateInfo;
  _UpdateInfo._() : super._();

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfo.fromJson;

  @override

  /// Whether a new version was found.
  bool get updateAvailable;
  @override

  /// The new version.
  String? get latestVersion;
  @override

  /// The error that occurred. If no error occurred, this is null.
  String? get errorMessage;
  @override

  /// The url to download the new version from.
  String? get downloadUrl;
  @override

  /// The progress of the installation.
  ///
  /// This is a value between 0 and 100.
  ///
  /// If no installation is in progress, this is null.
  double? get installProgress;
  @override

  /// When the last check for updates was performed.
  DateTime? get lastChecked;
  @override

  /// Wether the app is currently checking for updates.
  bool get checking;
  @override

  /// Patch notes for the new version.
  String? get patchNotes;
  @override

  /// The release date of the new version.
  DateTime? get releaseDate;
  @override

  /// The name of the release.
  String? get releaseName;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateInfoCopyWith<_$_UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
