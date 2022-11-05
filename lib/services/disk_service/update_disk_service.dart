part of windows_tools_engine;

/// Saves and loads update information.
class UpdateDiskService extends IDiskService<UpdateInfo> {
  /// Creates a new instance of [UpdaterDiskService].
  const UpdateDiskService() : super('update_info');

  @override
  load() async {
    if (!await _exists(fileName)) return null;

    final data = await _load(fileName);

    final json = jsonDecode(data);

    return UpdateInfo.fromJson(json);
  }

  @override
  save(data) async {
    final json = jsonEncode(data);

    return _save(fileName, json);
  }
}
