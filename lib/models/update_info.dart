import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_info.freezed.dart';
part 'update_info.g.dart';

@freezed

/// Information about an update.
class UpdateInfo with _$UpdateInfo {
  const UpdateInfo._();

  /// Information about an update.
  factory UpdateInfo({
    /// Whether a new version was found.
    @Default(false) bool updateAvailable,

    /// The new version.
    @Default(null) String? latestVersion,

    /// The error that occurred. If no error occurred, this is null.
    @Default(null) String? errorMessage,

    /// The url to download the new version from.
    @Default(null) String? downloadUrl,

    /// The progress of the installation.
    ///
    /// This is a value between 0 and 100.
    ///
    /// If no installation is in progress, this is null.
    @Default(null) double? installProgress,

    /// When the last check for updates was performed.
    @Default(null) DateTime? lastChecked,

    /// Wether the app is currently checking for updates.
    @Default(false) bool checking,

    /// Patch notes for the new version.
    @Default(null) String? patchNotes,

    /// The release date of the new version.
    @Default(null) DateTime? releaseDate,
  }) = _UpdateInfo;

  /// Whether the update is currently being installed.
  bool get installing => installProgress != null;

  /// Creates an [UpdateInfo] from a JSON object.
  factory UpdateInfo.fromJson(Map<String, dynamic> json) => _$UpdateInfoFromJson(json);
}
