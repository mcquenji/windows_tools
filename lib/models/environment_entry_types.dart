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
    try {
      if (Directory(value).existsSync()) {
        return directory;
      }

      // Check if the value is a file.

      if (File(value).existsSync()) {
        return file;
      }
      // Otherwise, it's a custom entry.

      return custom;
    } catch (e) {
      return custom;
    }
  }
}

_openPath(path) async {
  var uri = Uri.file(path);

  await launchUrl(uri);
}

/// Convinience methods for [EnvironmentEntryType].
extension EnvironmentEntryTypeExtensions on EnvironmentEntryType {
  /// Whether the entry is a directory.
  bool get isDirectory => this == EnvironmentEntryType.directory;

  /// Whether the entry is a file.
  bool get isFile => this == EnvironmentEntryType.file;

  /// Whether the entry is a custom entry.
  bool get isCustom => this == EnvironmentEntryType.custom;
}
