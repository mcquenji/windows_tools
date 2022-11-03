part of windows_tools_helpers;

/// Convinience functions for [ThemeData].
extension StatefulWidgetThemeExtension<T extends StatefulWidget> on State {
  /// The [ThemeData] of the current [BuildContext].
  ThemeData get theme => FluentTheme.of(context);
}

/// Convinience functions for [ThemeData].
extension BuildContextThemeExtension on BuildContext {
  /// The [ThemeData] of the current [BuildContext].
  ThemeData get theme => FluentTheme.of(this);
}
