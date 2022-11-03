part of windows_tools_engine;

/// Stores environment variables on disk.
class EnvironmentDiskService extends IDiskService<List<EnvironmentVariable>> {
  /// Creates a new instance of [EnvironmentDiskService].
  const EnvironmentDiskService() : super('environment_variables');

  @override
  load() async {
    if (!await _exists(fileName)) return null;

    final data = await _load(fileName);

    final json = jsonDecode(data);

    return (json as List).map((e) => EnvironmentVariable.fromJson(e)).toList();
  }

  @override
  save(data) async {
    final json = jsonEncode(data);

    return _save(fileName, json);
  }
}
