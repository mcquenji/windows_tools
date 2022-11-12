part of windows_tools_engine;

/// Marker mixin for all modules.
enum Modules {
  /// Java version management.
  javaVersionManagement(JavaVersionInfo);

  /// The type of the module.
  final Type type;

  /// Creates a new [Modules] enum.
  const Modules(this.type);
}
