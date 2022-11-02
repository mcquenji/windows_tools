part of windows_tools_engine;

/// Manages environment variables.
class EnvironmentService extends IEnvironmentService {
  /// The registry key that contains the environment variables.
  RegistryKey get reg => Registry.openPath(RegistryHive.currentUser, path: 'Environment', desiredAccessRights: AccessRights.allAccess);

  @override
  getEnvironmentVariables() {
    // get all environment variables with set command

    // parse the result

    final variables = <EnvironmentVariable>[];

    for (final variable in reg.values) {
      // ignore empty variables

      final values = variable.data.toString().split(';');

      final entries = <EnvironmentEntry>[];

      for (final value in values) {
        // ignore empty values

        if (value.isEmpty) continue;

        entries.add(EnvironmentEntry(value: value, enabled: true, parent: variable.name));
      }

      variables.add(EnvironmentVariable(name: variable.name, entries: entries));
    }

    return variables;
  }

  @override
  setEnvironmentVariable(EnvironmentVariable variable) {
    final entries = variable.entries.where((e) => e.enabled).map((e) => e.value).join(';');

    var value = RegistryValue(variable.name, RegistryValueType.string, entries);

    reg.createValue(value);

    log("Set environment variable '${variable.name}' to '$entries'");
  }

  @override
  setEnvironmentVariables(List<EnvironmentVariable> variables) {
    for (final variable in variables) {
      setEnvironmentVariable(variable);
    }
  }

  @override
  merge(a, b) {
    // check if there are new variables in b
    for (final variable in b) {
      final index = a.indexWhere((e) => e.name == variable.name);

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
        if (!variable.entries.any((e) => e.value == entry.value)) {
          var index = localEntries.indexOf(entry);

          localEntries[index] = entry.copyWith(enabled: false);

          log("Disabled entry '${entry.value}' in '${variable.name}'");
        }
      }

      a[index] = variable.copyWith(entries: localEntries);
    }

    return a;
  }

  @override
  replaceEntry(variables, entry, newEntry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    final entryIndex = entries.indexWhere((e) => e.value == entry.value);

    if (entryIndex == -1) return variables;

    entries[entryIndex] = newEntry;

    var newVariables = variables.toList();

    newVariables[index] = variables[index].copyWith(entries: entries);

    log(entry.toString());
    log(newEntry.toString());

    return newVariables;
  }

  @override
  removeEntry(variables, entry) {
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

  @override
  addEntry(variables, entry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    entries.add(entry);

    var newVariables = variables.toList();

    newVariables[index] = variables[index].copyWith(entries: entries);

    return newVariables;
  }
}
