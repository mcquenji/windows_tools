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

  static String m4(name) =>
      "A variable with the name \"${name}\" already exists.";

  static String m1(progress) => "Installing update (${progress}%)...";

  static String m2(version, date) => "${version} Patch notes - ${date}";

  static String m3(date) => "Last checked: ${date}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "environmentVariables_copy":
            MessageLookupByLibrary.simpleMessage("Copy"),
        "environmentVariables_delete":
            MessageLookupByLibrary.simpleMessage("Delete"),
        "environmentVariables_edit":
            MessageLookupByLibrary.simpleMessage("Edit"),
        "environmentVariables_edit_cancel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "environmentVariables_edit_save":
            MessageLookupByLibrary.simpleMessage("Save changes"),
        "environmentVariables_entry_delete_message":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this entry? This action cannot be undone."),
        "environmentVariables_entry_delete_title":
            MessageLookupByLibrary.simpleMessage("Delete entry?"),
        "environmentVariables_name": m0,
        "environmentVariables_newEntry":
            MessageLookupByLibrary.simpleMessage("New entry"),
        "environmentVariables_newEntry_custom":
            MessageLookupByLibrary.simpleMessage("Custom"),
        "environmentVariables_newEntry_custom_placeholder":
            MessageLookupByLibrary.simpleMessage("Enter value"),
        "environmentVariables_newEntry_custom_title":
            MessageLookupByLibrary.simpleMessage("Add custom value"),
        "environmentVariables_newEntry_directory":
            MessageLookupByLibrary.simpleMessage("Directory"),
        "environmentVariables_newEntry_file":
            MessageLookupByLibrary.simpleMessage("File"),
        "environmentVariables_newVariable_alreadyExists_message": m4,
        "environmentVariables_newVariable_alreadyExists_title":
            MessageLookupByLibrary.simpleMessage("Variable already exists"),
        "environmentVariables_newVariable_placeholder":
            MessageLookupByLibrary.simpleMessage("Variable name..."),
        "environmentVariables_newVariable_title":
            MessageLookupByLibrary.simpleMessage("Create new variable"),
        "environmentVariables_newVariable_tooltip":
            MessageLookupByLibrary.simpleMessage("Add new variable"),
        "environmentVariables_new_tooltip":
            MessageLookupByLibrary.simpleMessage("Create new"),
        "environmentVariables_open":
            MessageLookupByLibrary.simpleMessage("Open"),
        "environmentVariables_refresh_tooltip":
            MessageLookupByLibrary.simpleMessage("Refresh"),
        "environmentVariables_title_system":
            MessageLookupByLibrary.simpleMessage(
                "System Environment Variables"),
        "environmentVariables_title_user":
            MessageLookupByLibrary.simpleMessage("User Environment Variables"),
        "environmentVariables_toggle_tooltip":
            MessageLookupByLibrary.simpleMessage("Toggle"),
        "environmentVariables_variable_delete_message":
            MessageLookupByLibrary.simpleMessage(
                "Are you sure you want to delete this variable? This action cannot be undone."),
        "environmentVariables_variable_delete_title":
            MessageLookupByLibrary.simpleMessage("Delete variable?"),
        "environmentVariables_variable_delete_tooltip":
            MessageLookupByLibrary.simpleMessage("Delete variable"),
        "global_404": MessageLookupByLibrary.simpleMessage("404 Not Found"),
        "global_app_title":
            MessageLookupByLibrary.simpleMessage("Windows Tools"),
        "global_dialog_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "global_dialog_confirm":
            MessageLookupByLibrary.simpleMessage("Confirm"),
        "global_search_placeholder":
            MessageLookupByLibrary.simpleMessage("Search..."),
        "global_seearch_label": MessageLookupByLibrary.simpleMessage("Search"),
        "settings_contribute":
            MessageLookupByLibrary.simpleMessage("Contribute"),
        "settings_contribute_fork":
            MessageLookupByLibrary.simpleMessage("Fork"),
        "settings_contribute_openIssue":
            MessageLookupByLibrary.simpleMessage("Open issue on GitHub"),
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
            MessageLookupByLibrary.simpleMessage("A new version is available!"),
        "settings_general_update_patchNotes_title": m2,
        "settings_general_update_upToDate":
            MessageLookupByLibrary.simpleMessage(
                "You are using the latest version!"),
        "settings_general_update_upToDate_lastChecked": m3,
        "settings_title": MessageLookupByLibrary.simpleMessage("Settings"),
        "test_title": MessageLookupByLibrary.simpleMessage("Test")
      };
}
