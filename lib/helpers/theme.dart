part of windows_tools_helpers;

extension StatefulWidgetThemeExtension<T extends StatefulWidget> on State {
  ThemeData get theme => FluentTheme.of(context);
}
