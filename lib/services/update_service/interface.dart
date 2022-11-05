part of windows_tools_engine;

/// Checks for updates.
abstract class IUpdateService {
  /// Checks for updates.
  Future<UpdateInfo> checkForUpdates(String currentVersion);

  /// Downloads and installs the update.
  ///
  /// [update] is called during installation progress.
  ///
  /// [done] is called when the installation is done.
  Future<void> installUpdate(UpdateInfo info, void Function(UpdateInfo) update, void Function(UpdateInfo) done);
}
