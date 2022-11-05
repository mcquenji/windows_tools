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
  var flyout = FlyoutController();

  final editController = TextEditingController();

  Offset cursorPos = Offset.zero;

  edit() {
    flyout.close();
    var variables = ref.read(environmentVariablesProvider);

    var entry = variables[widget.variableId].entries[widget.entryId];

    setState(() {
      editMode = true;
      editController.text = entry.value;
    });
  }

  save() {
    var variables = ref.read(environmentVariablesProvider);
    var controller = ref.read(environmentVariablesController);

    var entry = variables[widget.variableId].entries[widget.entryId];

    setState(() {
      editMode = false;
      controller.updateEntry(entry, editController.text);
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
        title: t.environmentVariables_delete_title,
        content: Text(t.environmentVariables_delete_message),
        onConfirm: () => controller.removeEntry(entry),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var entry = ref.watch(environmentVariablesProvider)[widget.variableId].entries[widget.entryId];
    var controller = ref.read(environmentVariablesController);

    return ConditionalWrapper(
      condition: !editMode,
      wrapper: (context, child) {
        return Flyout(
          controller: flyout,
          position: FlyoutPosition.below,
          openMode: FlyoutOpenMode.secondaryPress,
          content: (context) => FlyoutContent(
            constraints: const BoxConstraints(maxWidth: 150), // any way to make this dynamicly fit items?
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlyoutListTile(
                  text: Text(t.environmentVariables_edit),
                  onPressed: edit,
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
            controller: editController,
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
          onPressed: () => controller.enableEntry(entry, !entry.enabled),
          title: GestureDetector(
            onDoubleTap: edit,
            child: Text(entry.value),
          ),
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