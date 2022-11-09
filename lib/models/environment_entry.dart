import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:windows_tools_engine/windows_tools_engine.dart';

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

    /// The name of the entry.
    @Default(null) String? name,
  }) = _EnvironmentEntry;

  /// Whether the entry is disabled.
  bool get disabled => !enabled;

  /// Unique identifier of the entry.
  String get identfier => '$parent#$value';

  /// The type of the entry.
  EnvironmentEntryType get type => EnvironmentEntryType.fromValue(value);

  /// Creates an [EnvironmentEntry] from a JSON object.
  factory EnvironmentEntry.fromJson(Map<String, dynamic> json) => _$EnvironmentEntryFromJson(json);
}
