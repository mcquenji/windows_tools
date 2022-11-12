import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_tools/helpers.dart';
import 'package:windows_tools/routes.dart';
import 'package:windows_tools_engine/windows_tools_engine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await Window.initialize();
  await initGlobals();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );

  Window.hideWindowControls();

  doWhenWindowReady(appWindow.show);
}

/// Root app widget.
class App extends ConsumerStatefulWidget {
  /// Root app widget.
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  AccentColor get accentColor => AccentColor.swatch({
        'darkest': SystemTheme.accentColor.darkest,
        'darker': SystemTheme.accentColor.darker,
        'dark': SystemTheme.accentColor.dark,
        'normal': SystemTheme.accentColor.accent,
        'light': SystemTheme.accentColor.light,
        'lighter': SystemTheme.accentColor.lighter,
        'lightest': SystemTheme.accentColor.lightest,
      });

  bool get checkedUpdates => rebuilds != 2;

  /// tracked to only check for updates once after the settings have been loaded.
  int rebuilds = 0;

  @override
  Widget build(context) {
    var settings = ref.watch(settingsProvider);

    // Count rebuilds to check if the app has been rebuilt after the settings have been loaded.
    // First rebuild is the initial build.
    // Second rebuild is the build after the settings have been loaded.
    if (rebuilds < 2) rebuilds++;

    // check for updates if auto check is enabled
    if (settings.autoCheckUpdates && !checkedUpdates) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        var updater = ref.read(updateController);

        updater.checkForUpdates(kVersion);
      });
    }

    return FluentApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: accentColor,
        scaffoldBackgroundColor: const Color(0xFF202020),
        cardColor: const Color(0xFF2b2b2b),
        resources: const ResourceDictionary.dark(
          cardBackgroundFillColorSecondary: Color(0xFF323232),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf3f3f3),
        accentColor: accentColor,
        cardColor: const Color(0xFFfbfbfb),
        resources: const ResourceDictionary.light(
          cardBackgroundFillColorSecondary: Color(0xFFfcfcfc),
        ),
      ),
      localizationsDelegates: const [
        LocaleNamesLocalizationsDelegate(),
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settings.language,
      home: const NavRouter(),
    );
  }
}
