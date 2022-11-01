library windows_tools_engine;

export 'models/environment_entry.dart';
export 'models/environment_variable.dart';

import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart';

// Models

import 'models/environment_entry.dart';
import 'models/environment_variable.dart';

// Providers

part 'providers/environment_variables_provider.dart';

// Services

part 'services/environment_service/environment_service.dart';
part 'services/environment_service/interface.dart';
part 'services/disk_service/interface.dart';
part 'services/disk_service/environment_disk_service.dart';
