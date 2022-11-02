part of windows_tools_engine;

/// Manages environment variables.
abstract class IEnvironmentService {
  /// Gets the environment variables.
  getEnvironmentVariables();

  /// Sets the environment [variables].
  void setEnvironmentVariables(List<EnvironmentVariable> variables);

  /// Sets the environment [variable].
  void setEnvironmentVariable(EnvironmentVariable variable);

  /// Merges [a] into [b].
  List<EnvironmentVariable> merge(List<EnvironmentVariable> a, List<EnvironmentVariable> b);

  /// Replaces the given [entry] with the [newEntry] in the [variables].
  List<EnvironmentVariable> replaceEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry, EnvironmentEntry newEntry);

  /// Removes the given [entry] from the [variables].
  List<EnvironmentVariable> removeEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry);

  /// Adds the given [entry] to the [variables].
  List<EnvironmentVariable> addEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry);

  /// Gets the index of the variable with the given [name] in the [variables].
  ///
  /// Returns -1 if the variable is not found.
  int getVariableIndex(List<EnvironmentVariable> variables, String name) => variables.indexWhere((e) => e.name == name);
}
