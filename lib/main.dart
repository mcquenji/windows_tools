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

class App extends StatelessWidget {
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
        // theme: ThemeData(
        //   cardColor: primaryColor,
        //   scaffoldBackgroundColor: secondaryColor,
        //   activeColor: primaryColor,
        //   accentColor: AccentColor.swatch({"normal": accentColor}),
        // ),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          accentColor: accentColor,
        ),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[10],
          accentColor: accentColor,
        ),
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Windows Tools',
        home: const ScaffoldPage(
          content: Padding(
            padding: EdgeInsets.all(NcSpacing.xlSpacing),
            child: EnvironmentVariablesRoute(),
          ),
        ),
      ),
    );
  }
}
