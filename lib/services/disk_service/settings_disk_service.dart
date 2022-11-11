part of windows_tools_engine;

/// Saves and loads settings.
class SettingsDiskService extends IDiskService<Settings> {
  /// Creates a new instance of [SettingsDiskService].
  const SettingsDiskService() : super('settings');

  @override
  decode(data) => Settings.fromJson(jsonDecode(data));

  @override
  encode(data) => jsonEncode(data.toJson());
}
