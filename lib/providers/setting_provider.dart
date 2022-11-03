part of windows_tools_engine;

/// Provides the current user settings.
final settingsProvider = StateNotifierProvider<SettingsProvider, Settings>(
  (ref) => SettingsProvider(
    SettingsDiskService(),
  ),
);

/// Serttings controller.
final settingsController = settingsProvider.notifier;

/// Provides the current user settings.
class SettingsProvider extends StateNotifier<Settings> {
  final IDiskService<Settings> _disk;

  /// Creates a new instance of [SettingsProvider].
  SettingsProvider(this._disk) : super(Settings()) {
    _load();
  }

  /// Loads the settings from disk.
  Future<void> _load() async {
    final settings = await _disk.load();

    if (settings != null) {
      state = settings;
    }
  }

  /// Saves the settings to disk.
  Future<void> _save() async {
    await _disk.save(state);
  }

  /// Sets the current language.
  void setLanguage(Locale locale) {
    state = state.copyWith(language: locale);

    _save();
  }

  /// Sets auto check behavior.
  void setAutoCheck(bool autoCheckUpdates) {
    state = state.copyWith(autoCheckUpdates: autoCheckUpdates);

    _save();
  }
}
