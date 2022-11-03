// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(name, amount) => "${name} (${amount})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "environmentVariables_delete_tooltip":
            MessageLookupByLibrary.simpleMessage("Löschen"),
        "environmentVariables_edit_tooltip":
            MessageLookupByLibrary.simpleMessage("Bearbeiten"),
        "environmentVariables_name": m0,
        "environmentVariables_newEntry":
            MessageLookupByLibrary.simpleMessage("Neuer Eintrag"),
        "environmentVariables_new_tooltip":
            MessageLookupByLibrary.simpleMessage(
                "Neue Umgebungsvariable hinzufügen"),
        "environmentVariables_refresh_tooltip":
            MessageLookupByLibrary.simpleMessage("Aktualisieren"),
        "environmentVariables_title":
            MessageLookupByLibrary.simpleMessage("Umgebungsvariablen"),
        "environmentVariables_toggle_tooltip":
            MessageLookupByLibrary.simpleMessage("Deaktivieren / Aktivieren"),
        "global_404":
            MessageLookupByLibrary.simpleMessage("404 Nicht gefunden"),
        "global_search_placeholder":
            MessageLookupByLibrary.simpleMessage("Suchen..."),
        "global_seearch_label": MessageLookupByLibrary.simpleMessage("Suchen"),
        "settings_general": MessageLookupByLibrary.simpleMessage("Allgemein"),
        "settings_general_language":
            MessageLookupByLibrary.simpleMessage("Sprache"),
        "settings_title": MessageLookupByLibrary.simpleMessage("Einstellungen")
      };
}
