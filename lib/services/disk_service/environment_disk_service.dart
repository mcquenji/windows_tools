part of windows_tools_engine;

/// Stores environment variables on disk.
class EnvironmentDiskService extends IDiskService<List<EnvironmentVariable>> {
  static const String _envFile = 'environment_variables.json';

  @override
  load() async {
    if (!await _exists(_envFile)) return null;

    final data = await _load(_envFile);

    final json = jsonDecode(data);

    return (json as List).map((e) => EnvironmentVariable.fromJson(e)).toList();
  }

  @override
  save(data) async {
    final json = jsonEncode(data);

    return _save(_envFile, json);
  }
}
