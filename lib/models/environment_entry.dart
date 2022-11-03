import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_entry.freezed.dart';
part 'environment_entry.g.dart';

@freezed

/// An entry in an environment variable.
class EnvironmentEntry with _$EnvironmentEntry {
  const EnvironmentEntry._();

  /// An entry in an environment variable.
  const factory EnvironmentEntry({
    /// The string value of the entry.
    required String value,

    /// Whether the entry is enabled.
    required bool enabled,

    /// The identifier of the parent variable.
    required String parent,
  }) = _EnvironmentEntry;

  /// Whether the entry is disabled.
  bool get disabled => !enabled;

  /// Unique identifier of the entry.
  String get identfier => '$parent#$value';

  /// Creates an [EnvironmentEntry] from a JSON object.
  factory EnvironmentEntry.fromJson(Map<String, dynamic> json) => _$EnvironmentEntryFromJson(json);
}
