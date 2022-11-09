part of windows_tools_helpers;

/// The current version of the app.
const kVersion = '0.1.0';

/// Current version name.
const kVersionName = 'Alpha $kVersion';

/// Identifier for [PageStorage]. Used to track if updates where already checked.
const kCheckedUpdatesIdentifier = 'checked_updates';

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

/// Default formatter for [DateTime] objects.
final kDateFormatter = DateFormat('dd.MM.yyyy kk:mm');

/// Initializes the globals.
Future<void> initGlobals() async {}
