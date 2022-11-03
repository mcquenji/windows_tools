import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system_theme/system_theme.dart';
import 'package:windows_tools/helpers.dart';
import 'package:windows_tools/routes.dart';
import 'package:nekolib_ui/core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // runThemedApp(appBuilder: App.builder);
  runApp(const App());
}

/// Root app widget.
class App extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ProviderScope(
      child: FluentApp(
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
          ...AppLocalizations.localizationsDelegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Windows Tools',
        home: const NavRouter(),
      ),
    );
  }
}
