part of windows_tools_engine;

/// Provides all environment variables present on the system.
final environmentVariablesProvider = StateNotifierProvider<EnvironmentVariablesProvider, List<EnvironmentVariable>>(
  (ref) => EnvironmentVariablesProvider(
    EnvironmentService(),
    EnvironmentDiskService(),
  ),
);

/// Controller of [environmentVariablesProvider].
final environmentVariablesController = environmentVariablesProvider.notifier;

/// Provides all environment variables present on the system.
class EnvironmentVariablesProvider extends StateNotifier<List<EnvironmentVariable>> {
  final IEnvironmentService _env;
  final IDiskService<List<EnvironmentVariable>> _disk;

  /// Provides all environment variables present on the system.
  EnvironmentVariablesProvider(this._env, this._disk) : super([]);

  /// Refreshes the environment variables.
  Future<void> refresh() async {
    var reg = await _env.getEnvironmentVariables();
    var local = await _disk.load();

    if (local == null) {
      await _disk.save(reg);
      state = reg;
      return;
    }

    local = _env.merge(local, reg);

    state = local;
  }

  /// Enables the given [entry].
  Future<void> enableEntry(EnvironmentEntry entry, bool enabled) async {
    var vars = _env.replaceEntry(state, entry, entry.copyWith(enabled: enabled));

    var index = _env.getVariableIndex(vars, entry.parent);

    await _env.setEnvironmentVariable(vars[index]);

    state = vars;

    await _disk.save(state);
  }

  /// Adds the given [entry].
  Future<void> addEntry(EnvironmentEntry entry) async {
    var vars = _env.addEntry(state, entry);

    var index = _env.getVariableIndex(vars, entry.parent);

    await _env.setEnvironmentVariable(vars[index]);

    state = vars;

    await _disk.save(state);
  }

  /// Removes the given [entry].
  Future<void> removeEntry(EnvironmentEntry entry) async {
    var vars = _env.removeEntry(state, entry);

    var index = _env.getVariableIndex(vars, entry.parent);

    await _env.setEnvironmentVariable(vars[index]);

    state = vars;

    await _disk.save(state);
  }

  /// Updates the given [entry].
  Future<void> updateEntry(EnvironmentEntry entry, String value) async {
    var vars = _env.replaceEntry(state, entry, entry.copyWith(value: value));

    var index = _env.getVariableIndex(vars, entry.parent);

    await _env.setEnvironmentVariable(vars[index]);

    state = vars;

    await _disk.save(state);
  }
}
