part of windows_tools_routes;

/// Displays a single environment variable entry.
class EnvironmentEntryWidget extends ConsumerStatefulWidget {
  /// Id of the entry to display.
  final int entryId;

  /// Id of the parent variable of the entry.
  final int variableId;

  /// Displays a single environment variable entry.
  const EnvironmentEntryWidget({Key? key, required this.entryId, required this.variableId}) : super(key: key);

  @override
  ConsumerState<EnvironmentEntryWidget> createState() => _EnvironmentEntryWidgetState();
}

class _EnvironmentEntryWidgetState extends ConsumerState<EnvironmentEntryWidget> {
  bool editMode = false;
  bool editName = false;
  var flyout = FlyoutController();

  final valueController = TextEditingController();
  final nameController = TextEditingController();

  Offset cursorPos = Offset.zero;

  rename() => edit(true);

  editValue() => edit(false);

  edit(bool rename) {
    flyout.close();
    var variables = ref.read(environmentVariablesProvider);

    var entry = variables[widget.variableId].entries[widget.entryId];

    setState(() {
      editName = rename;
      editMode = true;
      valueController.text = entry.value;
      nameController.text = entry.name ?? '';
    });
  }

  save() {
    var variables = ref.read(environmentVariablesProvider);
    var controller = ref.read(environmentVariablesController);

    var entry = variables[widget.variableId].entries[widget.entryId];

    setState(() {
      editMode = false;
      controller.updateEntry(entry, value: valueController.text, name: nameController.text);
    });
  }

  cancel() {
    setState(() {
      editMode = false;
    });
  }

  delete() {
    flyout.close();

    var variables = ref.read(environmentVariablesProvider);
    var controller = ref.read(environmentVariablesController);

    var entry = variables[widget.variableId].entries[widget.entryId];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        title: t.environmentVariables_entry_delete_title,
        content: Text(t.environmentVariables_entry_delete_message),
        onConfirm: () => controller.removeEntry(entry),
      ),
    );
  }

  open() {
    flyout.close();

    var variables = ref.read(environmentVariablesProvider);
    var entry = variables[widget.variableId].entries[widget.entryId];

    entry.type.open(entry.value);
  }

  copy() {
    flyout.close();

    var variables = ref.read(environmentVariablesProvider);
    var entry = variables[widget.variableId].entries[widget.entryId];

    Clipboard.setData(ClipboardData(text: entry.value));
  }

  @override
  Widget build(BuildContext context) {
    var entry = ref.watch(environmentVariablesProvider)[widget.variableId].entries[widget.entryId];
    var controller = ref.read(environmentVariablesController);

    return ConditionalWrapper(
      condition: !editMode,
      wrapper: (context, child) {
        // TODO: use context menu instead of flyout
        return Flyout(
          controller: flyout,
          position: FlyoutPosition.below,
          openMode: FlyoutOpenMode.secondaryPress,
          content: (context) => FlyoutContent(
            constraints: const BoxConstraints(maxWidth: 150), // any way to make this dynamicly fit items?
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (entry.type.canOpen)
                  FlyoutListTile(
                    text: Text(t.environmentVariables_open),
                    onPressed: open,
                    icon: Icon(
                      FluentIcons.open_24_regular,
                      color: theme.accentColor,
                    ),
                  ),
                FlyoutListTile(
                  text: Text(t.environmentVariables_edit),
                  onPressed: editValue,
                  icon: Icon(
                    FluentIcons.edit_24_regular,
                    color: theme.accentColor,
                  ),
                ),
                FlyoutListTile(
                  text: Text(t.environmentVariables_rename),
                  onPressed: rename,
                  icon: Icon(
                    FluentIcons.rename_24_regular,
                    color: theme.accentColor,
                  ),
                ),
                FlyoutListTile(
                  text: Text(t.environmentVariables_delete),
                  onPressed: delete,
                  icon: Icon(
                    FluentIcons.delete_24_regular,
                    color: theme.accentColor,
                  ),
                ),
                FlyoutListTile(
                  text: Text(t.environmentVariables_copy),
                  onPressed: copy,
                  icon: Icon(
                    FluentIcons.copy_24_regular,
                    color: theme.accentColor,
                  ),
                ),
              ],
            ),
          ),
          child: child,
        );
      },
      child: ConditionalWidget(
        condition: editMode,
        trueWidget: (context) => ExpanderCard(
          title: TextBox(
            controller: editName ? nameController : valueController,
            onSubmitted: (_) => save(),
            autofocus: true,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NcSpacing.small(),
              Tooltip(
                message: t.environmentVariables_edit_save,
                child: IconButton(
                  icon: const Icon(FluentIcons.checkmark_24_regular),
                  onPressed: save,
                ),
              ),
              NcSpacing.small(),
              Tooltip(
                message: t.environmentVariables_edit_cancel,
                child: IconButton(
                  icon: const Icon(FluentIcons.dismiss_24_filled),
                  onPressed: cancel,
                ),
              ),
            ],
          ),
        ),
        falseWidget: (context) => ExpanderCard(
          crossAxisAlignment: CrossAxisAlignment.center,
          onPressed: () => controller.enableEntry(entry, !entry.enabled),
          leading: Tooltip(
            message: entry.type.tooltip(context),
            child: Icon(
              entry.type.icon,
              color: entry.enabled ? theme.accentColor : theme.disabledColor,
            ),
          ),
          title: entry.name == null ? Text(entry.value) : Text(entry.name!),
          subtitle: entry.name == null ? null : Text(entry.value),
          trailing: Tooltip(
            message: t.environmentVariables_toggle_tooltip,
            child: ToggleSwitch(
              checked: entry.enabled,
              onChanged: (value) => controller.enableEntry(entry, value),
            ),
          ),
        ),
      ),
    );
  }
}

extension on EnvironmentEntryType {
  IconData get icon {
    switch (this) {
      case EnvironmentEntryType.file:
        return FluentIcons.document_24_regular;
      case EnvironmentEntryType.directory:
        return FluentIcons.folder_24_regular;
      case EnvironmentEntryType.custom:
        return FluentIcons.text_field_24_regular;
    }
  }

  String tooltip(BuildContext context) {
    var t = context.t;
    switch (this) {
      case EnvironmentEntryType.file:
        return t.environmentVariables_newEntry_file;
      case EnvironmentEntryType.directory:
        return t.environmentVariables_newEntry_directory;
      case EnvironmentEntryType.custom:
        return t.environmentVariables_newEntry_custom;
    }
  }
}
