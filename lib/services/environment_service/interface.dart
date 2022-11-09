part of windows_tools_engine;

/// Manages environment variables.
abstract class IEnvironmentService {
  /// Gets the environment variables.
  List<EnvironmentVariable> getEnvironmentVariables();

  /// Sets the environment [variables].
  void setEnvironmentVariables(List<EnvironmentVariable> variables) {
    for (final variable in variables) {
      setEnvironmentVariable(variable);
    }
  }

  /// Sets the environment [variable].
  void setEnvironmentVariable(EnvironmentVariable variable);

  /// Merges [a] into [b].
  List<EnvironmentVariable> merge(List<EnvironmentVariable> a, List<EnvironmentVariable> b) {
    // check if there are new variables in b
    for (final variable in b) {
      final index = getVariableIndex(a, variable.identifier);

      if (index == -1) {
        a.add(variable);
        continue;
      }

      final localEntries = a[index].entries.toList();

      // check if there are new entries in b
      for (final entry in variable.entries) {
        final index = localEntries.indexWhere((e) => e.value == entry.value);

        if (!localEntries.any((e) => e.value == entry.value)) {
          localEntries.add(entry);

          log("Added entry '${entry.value}' to '${variable.name}'");

          continue;
        }

        var localEntry = localEntries[index];

        if (localEntry.disabled) log("Enabled entry '${entry.value}' in '${variable.name}'");

        localEntries[index] = entry;
      }

      // set all entries that are not in b to disabled
      for (final entry in localEntries) {
        if (!variable.entries.any((e) => e.identfier == entry.identfier)) {
          var index = localEntries.indexOf(entry);

          if (entry.disabled) continue;

          localEntries[index] = entry.copyWith(enabled: false);

          log("Disabled entry '${entry.value}' in '${variable.name}'");
        }
      }

      a[index] = variable.copyWith(entries: localEntries);
    }

    return a;
  }

  /// Replaces the given [entry] with the [newEntry] in the [variables].
  List<EnvironmentVariable> replaceEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry, EnvironmentEntry newEntry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    final entryIndex = entries.indexWhere((e) => e.value == entry.value);

    if (entryIndex == -1) return variables;

    entries[entryIndex] = newEntry;

    var newVariables = variables.toList();

    newVariables[index] = variables[index].copyWith(entries: entries);

    return newVariables;
  }

  /// Removes the given [entry] from the [variables].
  List<EnvironmentVariable> removeEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    final entryIndex = entries.indexWhere((e) => e.value == entry.value);

    if (entryIndex == -1) return variables;

    entries.removeAt(entryIndex);

    var newVariables = variables.toList();

    newVariables[index] = variables[index].copyWith(entries: entries);

    return newVariables;
  }

  /// Adds the given [entry] to the [variables].
  List<EnvironmentVariable> addEntry(List<EnvironmentVariable> variables, EnvironmentEntry entry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    entries.add(entry);

    var newVariables = variables.toList();

    newVariables[index] = variables[index].copyWith(entries: entries);

    return newVariables;
  }

  /// Gets the index of the variable with the given [identifier] in the [variables].
  ///
  /// Returns -1 if the variable is not found.
  int getVariableIndex(List<EnvironmentVariable> variables, String identifier) => variables.indexWhere((e) => e.identifier == identifier);

  /// Adds the given [variable] to the [variables].
  ///
  /// If the variable already exists, nothing happens.
  List<EnvironmentVariable> addVariable(List<EnvironmentVariable> variables, EnvironmentVariable variable) {
    final index = getVariableIndex(variables, variable.identifier);

    if (index != -1) return variables;

    var newVariables = variables.toList();

    newVariables.add(variable);

    return newVariables;
  }

  /// Removes the variable with the given [identifier] from the [variables].
  ///
  /// If the variable does not exist, nothing happens.
  List<EnvironmentVariable> removeVariable(List<EnvironmentVariable> variables, String identifier) {
    final index = getVariableIndex(variables, identifier);

    if (index == -1) return variables;

    var newVariables = variables.toList();

    newVariables.removeAt(index);

    return newVariables;
  }

  /// Renames the variable with the given [identifier] to [newName] in the [variables].
  ///
  /// If the variable does not exist, nothing happens.
  List<EnvironmentVariable> renameVariable(List<EnvironmentVariable> variables, String identifier, String newName) {
    final index = getVariableIndex(variables, identifier);

    if (index == -1) return variables;

    var newVariables = variables.toList();

    var variable = variables[index];

    if (variable.name == newName) return variables;

    newVariables[index] = variable.copyWith(name: newName);

    return newVariables;
  }

  /// Deletes the given [variable] from the system.
  void deleteVariable(EnvironmentVariable variable);
}
