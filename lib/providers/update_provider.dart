part of windows_tools_engine;

/// Provides the current update info.
final updateProvider = StateNotifierProvider<UpdateProvider, UpdateInfo>(
  (ref) => UpdateProvider(
    MockUpdateService(),
    UpdateDiskService(),
  ),
);

/// Update controller.
final updateController = updateProvider.notifier;

/// Provides the current update info.
class UpdateProvider extends StateNotifier<UpdateInfo> {
  final IUpdateService _updater;
  final IDiskService<UpdateInfo> _disk;

  /// Creates a new instance of [UpdateProvider].
  UpdateProvider(this._updater, this._disk) : super(UpdateInfo()) {
    _load();
  }

  void _load() async {
    var info = await _disk.load();

    if (info != null) {
      state = info;
    }
  }

  /// Checks for updates.
  Future<void> checkForUpdates(String currentversion) async {
    state = state.copyWith(checking: true);

    state = await _updater.checkForUpdates(currentversion);

    await _disk.save(state);
  }

  /// Downloads and installs the update.
  Future<void> installUpdate() => _updater.installUpdate(state, (info) => state = info, (info) => _disk.save(state = info));
}
