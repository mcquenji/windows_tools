part of windows_tools_engine;

/// Checks for updates.
abstract class IUpdateService {
  /// Checks for updates.
  Future<UpdateInfo> checkForUpdates(String currentVersion);

  /// Downloads and installs the update.
  Future<void> installUpdate(UpdateInfo info, void Function(UpdateInfo) update);
}
