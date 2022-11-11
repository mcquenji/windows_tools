part of windows_tools_engine;

/// Stores environment variables on disk.
class EnvironmentDiskService extends IDiskService<List<EnvironmentVariable>> {
  /// Creates a new instance of [EnvironmentDiskService].
  const EnvironmentDiskService() : super('environment_variables');

  @override
  decode(data) {
    final json = jsonDecode(data);

    return (json as List).map((e) => EnvironmentVariable.fromJson(e)).toList();
  }

  @override
  encode(data) => jsonEncode(data.map((e) => e.toJson()).toList());
}
