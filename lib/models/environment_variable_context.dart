part of windows_tools_engine;

/// Environment variable context.
enum EnvironmentVariableContext {
  /// The variable is for the current user.
  user,

  /// The variable is for all users.
  machine,
}

/// Convinience extension for [EnvironmentVariableContext].
extension EnvironmentVariableContextExtension on EnvironmentVariableContext {
  /// Returns the registry key for the context.
  RegistryKey get reg {
    switch (this) {
      case EnvironmentVariableContext.user:
        return userReg;
      case EnvironmentVariableContext.machine:
        return machineReg;
    }
  }

  /// If [this] is [EnvironmentVariableContext.user]
  bool get isUser => this == EnvironmentVariableContext.user;

  /// If [this] is [EnvironmentVariableContext.machine]
  bool get isMachine => this == EnvironmentVariableContext.machine;
}
