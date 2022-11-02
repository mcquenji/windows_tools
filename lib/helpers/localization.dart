part of windows_tools_helpers;

/// Provides localized strings for the app.
extension ContextLocalization on BuildContext {
  /// Provides localized strings for the app.
  AppLocalizations get t => AppLocalizations.of(this)!;
}

/// Provides localized strings for the app.
extension StateLocalization<T extends StatefulWidget> on State<T> {
  /// Provides localized strings for the app.
  AppLocalizations get t => context.t;
}
