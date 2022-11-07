part of windows_tools_engine;

/// Types of environment entries.
enum EnvironmentEntryType {
  /// A custom entry.
  custom(null),

  /// A directory entry.
  directory(_openPath),

  /// A file entry.
  file(_openPath);

  /// Type of environment entry.
  const EnvironmentEntryType(this._open);

  /// Whether the entry can be opened.
  bool get canOpen => _open != null;

  final Function(String)? _open;

  /// Opens the entry.
  void open(String path) => _open?.call(path);

  /// Creates an [EnvironmentEntryType] from a value.
  static EnvironmentEntryType fromValue(String value) {
    // Check if the value is a directory.

    if (Directory(value).existsSync()) {
      return directory;
    }

    // Check if the value is a file.

    if (File(value).existsSync()) {
      return file;
    }

    // Otherwise, it's a custom entry.

    return custom;
  }
}

_openPath(path) async {
  var uri = Uri.file(path);

  await launchUrl(uri);
}
