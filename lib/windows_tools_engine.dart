library windows_tools_engine;

export 'models/settings.dart';
export 'models/environment_entry.dart';
export 'models/environment_variable.dart';
export 'models/update_info.dart';

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:win32_registry/win32_registry.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// Models

import 'models/settings.dart';
import 'models/environment_entry.dart';
import 'models/update_info.dart';
import 'models/environment_variable.dart';
part 'models/environment_variable_context.dart';
part 'models/environment_entry_types.dart';

// Providers

part 'providers/environment_variables_provider.dart';
part 'providers/setting_provider.dart';
part 'providers/update_provider.dart';

// Services

part 'services/environment_service/environment_service.dart';
part 'services/environment_service/interface.dart';
part 'services/disk_service/interface.dart';
part 'services/disk_service/environment_disk_service.dart';
part 'services/disk_service/settings_disk_service.dart';
part 'services/update_service/interface.dart';
part 'services/update_service/mock_update_service.dart';
part 'services/disk_service/update_disk_service.dart';
part 'services/update_service/github_update_service.dart';
