part of windows_tools_engine;

/// Saves and loads settings.
class SettingsDiskService extends IDiskService<Settings> {
  /// Creates a new instance of [SettingsDiskService].
  const SettingsDiskService() : super('settings');

  @override
  load() async {
    if (!await _exists(fileName)) return null;

    final data = await _load(fileName);

    final json = jsonDecode(data);

    return Settings.fromJson(json);
  }

  @override
  save(data) async {
    final json = jsonEncode(data);

    return _save(fileName, json);
  }
}
