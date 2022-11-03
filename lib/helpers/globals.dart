part of windows_tools_helpers;

/// The current package info.
///
/// Initialized in [initGlobals]. Has to be called before using this. Best practice is to call this in [main].
late final PackageInfo packageInfo;

/// The default height of the expander header.
const double kExpanderHeaderHeight = 70;

/// The default icon size in expanders.
const double kExpanderIconSize = 25;

/// The default width of trailing widgets in the expander header or content.
const double kExpanderTrailingWidth = 250;

/// The default height of trailing widgets in the expander header or content.
const double kExpanderTrailingHeight = 20;

/// Default stroke width for progress ring inside expander header or content.
const double kExpanderProgressRingWidth = 3.5;

/// Initializes the globals.
Future<void> initGlobals() async {
  packageInfo = await PackageInfo.fromPlatform();
}
