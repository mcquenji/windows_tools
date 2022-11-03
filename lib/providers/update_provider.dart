part of windows_tools_engine;

/// Provides the current update info.
final updateProvider = StateNotifierProvider<UpdateProvider, UpdateInfo>(
  (ref) => UpdateProvider(
    MockUpdateService(),
  ),
);

/// Update controller.
final updateController = updateProvider.notifier;

/// Provides the current update info.
class UpdateProvider extends StateNotifier<UpdateInfo> {
  final IUpdateService _updater;

  /// Creates a new instance of [UpdateProvider].
  UpdateProvider(this._updater) : super(UpdateInfo());

  /// Checks for updates.
  Future<void> checkForUpdates(String currentversion) async {
    state = state.copyWith(checking: true);

    state = await _updater.checkForUpdates(currentversion);
  }

  /// Downloads and installs the update.
  Future<void> installUpdate() => _updater.installUpdate(state, (info) => state = info);
}
