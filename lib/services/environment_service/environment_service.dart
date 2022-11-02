part of windows_tools_engine;

/// Manages environment variables.
class EnvironmentService extends IEnvironmentService {
  @override
  Future<List<EnvironmentVariable>> getEnvironmentVariables() async {
    // get all environment variables with set command

    final env = await Process.run('set', [], runInShell: true);

    // parse the result

    final lines = env.stdout.toString().split('\r');

    final variables = <EnvironmentVariable>[];

    for (final line in lines) {
      final parts = line.split('=');

      if (parts.length < 2) continue;

      final name = parts[0].trim();
      final value = parts[1];

      final values = value.split(';');

      final entries = <EnvironmentEntry>[];

      for (final value in values) {
        entries.add(EnvironmentEntry(value: value, enabled: true, parent: name));
      }

      variables.add(EnvironmentVariable(name: name, entries: entries));
    }

    return variables;
  }

  @override
  Future<void> setEnvironmentVariable(EnvironmentVariable variable) async {
    final value = variable.entries.where((e) => e.enabled).map((e) => e.value).join(';');

    log('Setting environment variable ${variable.name} to $value');

    // set the environment variable with setx command
    var p = await Process.run('set', ["${variable.name}=$value"], runInShell: true);

    log('Exit code: ${p.exitCode}', error: p.exitCode != 0 ? "${p.stdout}\nErr:\n${p.stderr}" : null);
  }

  @override
  Future<void> setEnvironmentVariables(List<EnvironmentVariable> variables) async {
    for (final variable in variables) {
      await setEnvironmentVariable(variable);
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

          continue;
        }

        localEntries[index] = entry;
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

    variables[index] = variables[index].copyWith(entries: entries);

    return variables;
  }

  @override
  removeEntry(variables, entry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    final entryIndex = entries.indexWhere((e) => e.value == entry.value);

    if (entryIndex == -1) return variables;

    entries.removeAt(entryIndex);

    variables[index] = variables[index].copyWith(entries: entries);

    return variables;
  }

  @override
  addEntry(variables, entry) {
    final index = getVariableIndex(variables, entry.parent);

    if (index == -1) return variables;

    final entries = variables[index].entries.toList();

    entries.add(entry);

    variables[index] = variables[index].copyWith(entries: entries);

    return variables;
  }
}
