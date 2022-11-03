import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system_theme/system_theme.dart';
import 'package:windows_tools/helpers.dart';
import 'package:windows_tools/routes.dart';
import 'package:windows_tools_engine/windows_tools_engine.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGlobals();

  // runThemedApp(appBuilder: App.builder);
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

/// Root app widget.
class App extends ConsumerWidget {
  /// Root app widget.
  const App({super.key});

  /// Builder for convinience.
  // ignore: prefer_const_constructors
  // static App builder(context) => App();

  AccentColor get accentColor => AccentColor.swatch({
        'darkest': SystemTheme.accentColor.darkest,
        'darker': SystemTheme.accentColor.darker,
        'dark': SystemTheme.accentColor.dark,
        'normal': SystemTheme.accentColor.accent,
        'light': SystemTheme.accentColor.light,
        'lighter': SystemTheme.accentColor.lighter,
        'lightest': SystemTheme.accentColor.lightest,
      });

  @override
  Widget build(context, ref) {
    var settings = ref.watch(settingsProvider);

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
      title: 'Windows Tools',
      home: const NavRouter(),
    );
  }
}
