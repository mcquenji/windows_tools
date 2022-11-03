import 'package:windows_tools_engine/windows_tools_engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_variable.freezed.dart';
part 'environment_variable.g.dart';

@freezed

/// An environment variable.
class EnvironmentVariable with _$EnvironmentVariable {
  const EnvironmentVariable._();

  /// An environment variable.
  const factory EnvironmentVariable({
    /// The name of the environment variable.
    required String name,

    /// The entries in the environment variable.
    required List<EnvironmentEntry> entries,

    /// The context of the environment variable.
    required EnvironmentVariableContext context,
  }) = _EnvironmentVariable;

  /// Identifies the environment variable.
  ///
  /// This is not the same as the name because there can be multiple variables with the same name when they have different contexts.
  String get identifier => "$name@$context";

  /// Creates an [EnvironmentVariable] from a JSON object.
  factory EnvironmentVariable.fromJson(Map<String, dynamic> json) => _$EnvironmentVariableFromJson(json);
}
