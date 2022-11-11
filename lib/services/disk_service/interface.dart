part of windows_tools_engine;

/// Manages loading and saving data to disk.
abstract class IDiskService<T> {
  /// The name of the dir to store the data in.
  static const dirName = 'windows_tools';

  /// The default file extension.
  static const defaultExtension = '.json';

  final String _fileName;

  /// The name of the file to store the data in.
  ///
  /// If no extension is provided, [defaultExtension] will be used.
  String get fileName => _fileName.contains('.') ? _fileName : '$_fileName$defaultExtension';

  /// Creates a new instance of [IDiskService].
  const IDiskService(this._fileName);

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
  Future<void> save(T data) async => _save(fileName, encode(data));

  /// Loads the data from disk.
  ///
  /// Returns null if no data was found.
  Future<T?> load() async {
    if (!await _exists(fileName)) return null;

    final data = await _load(fileName);

    return decode(data);
  }

  /// Deletes the data from disk.
  Future<void> delete() => _delete(fileName);

  /// Converts the given [data] to [T].
  T decode(String data);

  /// Converts [T] to a [String].
  String encode(T data);
}
