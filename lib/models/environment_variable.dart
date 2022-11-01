import 'package:windows_tools_engine/windows_tools_engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_variable.freezed.dart';
part 'environment_variable.g.dart';

@freezed

/// An environment variable.
class EnvironmentVariable with _$EnvironmentVariable {
  /// An environment variable.
  const factory EnvironmentVariable({
    /// The name of the environment variable.
    required String name,

    /// The entries in the environment variable.
    required List<EnvironmentEntry> entries,
  }) = _EnvironmentVariable;

  /// Creates an [EnvironmentVariable] from a JSON object.
  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) => _$EnvironmentVariableFromJson(json);
}
