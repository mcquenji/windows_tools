// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name, amount) => "${name} (${amount})";

  static String m1(progress) => "Installing update (${progress}%)...";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "environmentVariables_delete_tooltip":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "environmentVariables_edit_tooltip":
            MessageLookupByLibrary.simpleMessage("Edit"),
        "environmentVariables_name": m0,
        "environmentVariables_newEntry":
            MessageLookupByLibrary.simpleMessage("Add new entry"),
        "environmentVariables_new_tooltip":
            MessageLookupByLibrary.simpleMessage("Create new"),
        "environmentVariables_refresh_tooltip":
            MessageLookupByLibrary.simpleMessage("Refresh"),
        "environmentVariables_title":
            MessageLookupByLibrary.simpleMessage("Environment Variables"),
        "environmentVariables_toggle_tooltip":
            MessageLookupByLibrary.simpleMessage("Toggle"),
        "global_404": MessageLookupByLibrary.simpleMessage("404 Not Found"),
        "global_search_placeholder":
            MessageLookupByLibrary.simpleMessage("Search..."),
        "global_seearch_label": MessageLookupByLibrary.simpleMessage("Search"),
        "settings_general": MessageLookupByLibrary.simpleMessage("General"),
        "settings_general_language":
            MessageLookupByLibrary.simpleMessage("Language"),
        "settings_general_update_autCheck":
            MessageLookupByLibrary.simpleMessage(
                "Check for updates automatically"),
        "settings_general_update_checkNow":
            MessageLookupByLibrary.simpleMessage("Check now"),
        "settings_general_update_error": MessageLookupByLibrary.simpleMessage(
            "An unexpected error occurred. Please try again later."),
        "settings_general_update_install":
            MessageLookupByLibrary.simpleMessage("Install update"),
        "settings_general_update_installing": m1,
        "settings_general_update_newVersion":
            MessageLookupByLibrary.simpleMessage("New version available"),
        "settings_general_update_upToDate":
            MessageLookupByLibrary.simpleMessage(
                "You are using the latest version!"),
        "settings_title": MessageLookupByLibrary.simpleMessage("Settings")
      };
}
