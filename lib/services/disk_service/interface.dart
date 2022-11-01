part of windows_tools_engine;

/// Manages loading and saving data to disk.
abstract class IDiskService<T> {
  /// The name of the dir to store the data in.
  static const dirName = 'windows_tools';

  /// The default file extension.
  static const defaultExtension = '.json';

  /// The directory where the data is stored.
  Future<Directory> get dataDir async {
    final dir = await getApplicationDocumentsDirectory();

    final dataDir = Directory('${dir.path}/$dirName');

    if (!await dataDir.exists()) {
      await dataDir.create();
    }

    return dataDir;
  }

  /// Saves the given [data] to a file with the given [name].#
  Future<void> _save(String name, String data) async {
    var dir = await dataDir;

    final file = File('${dir.path}/$name');

    if (!await file.exists()) {
      await file.create();
    }

    await file.writeAsString(data);
  }

  /// Loads the data from a file with the given [name].
  Future<String> _load(String name) async {
    var dir = await dataDir;

    final file = File('${dir.path}/$name');

    if (!await file.exists()) throw Exception('File not found');

    return await file.readAsString();
  }

  /// Deletes the file with the given [name].
  Future<void> _delete(String name) async {
    var dir = await dataDir;

    final file = File('${dir.path}/$name');

    if (!await file.exists()) throw Exception('File not found');

    await file.delete();
  }

  /// Checks if a file with the given [name] exists.
  Future<bool> _exists(String name) async {
    var dir = await dataDir;

    final file = File('${dir.path}/$name');

    return await file.exists();
  }

  /// Saves the given data to disk
  Future<void> save(T data);

  /// Loads the data from disk.
  ///
  /// Returns null if no data was found.
  Future<T?> load();
}
