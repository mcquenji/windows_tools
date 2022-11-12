library windows_tools_routes;

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:context_menus/context_menus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart' hide FluentIcons;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekolib_ui/core.dart';
import 'package:nekolib_utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:windows_tools/widgets.dart';
import 'package:windows_tools_engine/windows_tools_engine.dart';
import 'helpers.dart';
import 'package:markdown/markdown.dart' as md;

part 'routes/environment_variables/environment_variables.dart';
part 'routes/router.dart';
part 'routes/settings/settings.dart';
part 'routes/settings/settings_general_update.dart';
part 'routes/test.dart';
part 'routes/environment_variables/environment_variable.dart';
part 'routes/environment_variables/environment_entry.dart';
