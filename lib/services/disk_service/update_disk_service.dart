part of windows_tools_engine;

/// Saves and loads update information.
class UpdateDiskService extends IDiskService<UpdateInfo> {
  /// Creates a new instance of [UpdaterDiskService].
  const UpdateDiskService() : super('update_info');

  @override
  decode(data) => UpdateInfo.fromJson(jsonDecode(data));

  @override
  encode(data) => jsonEncode(data.toJson());
}
