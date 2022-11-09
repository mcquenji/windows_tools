part of windows_tools_routes;

/// Displays a single environment variable.
class EnvironmentVariableWidget extends ConsumerStatefulWidget {
  /// The environment variable to display.
  final EnvironmentVariable variable;

  /// Displays a single environment variable.
  const EnvironmentVariableWidget({Key? key, required this.variable}) : super(key: key);

  // static const double expanderHeaderHoverHeight = expanderHeaderHeight + 5;

  @override
  ConsumerState<EnvironmentVariableWidget> createState() => _EnvironmentVariableWidgetState();
}

class _EnvironmentVariableWidgetState extends ConsumerState<EnvironmentVariableWidget> {
  final searchController = TextEditingController();
  final nameController = TextEditingController();

  bool editMode = false;

  edit() {
    setState(() {
      editMode = true;
      nameController.text = widget.variable.name;
    });
  }

  cancel() {
    setState(() {
      editMode = false;
    });
  }

  save() {
    var controller = ref.read(environmentVariablesController);

    setState(() {
      editMode = false;
      controller.renameVariable(widget.variable.identifier, nameController.text);
    });
  }

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void addCustom() {
    final input = TextEditingController();
    var controller = ref.read(environmentVariablesController);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        contentBuilder: (context, confirm, cancel) => TextBox(
          placeholder: t.environmentVariables_newEntry_custom_placeholder,
          controller: input,
          onSubmitted: (_) => confirm(),
          autofocus: true,
        ),
        title: t.environmentVariables_newEntry_custom_title,
        onConfirm: () => controller.addEntry(widget.variable.identifier, input.text),
      ),
    );
  }

  void addDirectory() async {
    final result = await FilePicker.platform.getDirectoryPath();

    if (result == null || !mounted) return;

    var controller = ref.read(environmentVariablesController);

    controller.addEntry(widget.variable.identifier, result);
  }

  void addFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null || !mounted) return;

    var controller = ref.read(environmentVariablesController);

    controller.addEntry(widget.variable.identifier, result.files.first.path!);
  }

  void deleteVariable() {
    var controller = ref.read(environmentVariablesController);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        content: Text(t.environmentVariables_variable_delete_message),
        title: t.environmentVariables_variable_delete_title,
        onConfirm: () => controller.removeVariable(widget.variable.identifier),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var index = ref.watch(environmentVariablesProvider).indexOf(widget.variable);

    var entries = widget.variable.entries.where((element) => element.value.containsCaseInsensitive(searchController.text)).toList();

    return ConditionalWidget(
      condition: editMode,
      trueWidget: (context) => ExpanderCard(
        title: TextBox(
          controller: nameController,
          onSubmitted: (_) => save(),
          autofocus: true,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NcSpacing.small(),
            Tooltip(
              message: t.environmentVariables_delete,
              child: IconButton(
                icon: const Icon(FluentIcons.delete_24_regular),
                onPressed: deleteVariable,
              ),
            ),
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
      falseWidget: (context) => HoverBuilder(
        builder: (context, hover) => Expander(
          headerHeight: kExpanderHeaderHeight,
          contentBackgroundColor: theme.cardColor,
          contentPadding: EdgeInsets.zero,
          header: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t.environmentVariables_name(
                  widget.variable.name,
                  widget.variable.entries.length,
                ),
              ),
              if (hover) NcSpacing.small(),
              if (hover)
                Tooltip(
                  message: t.environmentVariables_edit,
                  child: IconButton(
                    icon: const Icon(FluentIcons.edit_24_regular),
                    onPressed: edit,
                  ),
                ),
            ],
          ),
          leading: Icon(
            widget.variable.context.isUser ? FluentIcons.person_24_filled : FluentIcons.globe_24_filled,
            size: kExpanderIconSize,
            color: theme.accentColor,
          ),
          trailing: Row(
            children: [
              DropDownButton(
                title: Text(t.environmentVariables_newEntry),
                items: [
                  MenuFlyoutItem(
                    leading: const Icon(FluentIcons.folder_24_filled),
                    text: Text(t.environmentVariables_newEntry_directory),
                    onPressed: addDirectory,
                  ),
                  MenuFlyoutItem(
                    leading: const Icon(FluentIcons.document_24_filled),
                    text: Text(t.environmentVariables_newEntry_file),
                    onPressed: addFile,
                  ),
                  MenuFlyoutItem(
                    leading: const Icon(FluentIcons.text_field_24_filled),
                    text: Text(t.environmentVariables_newEntry_custom),
                    onPressed: addCustom,
                  ),
                ],
              ),
              NcSpacing.small(),
            ],
          ),
          content: Column(
            children: [
              ExpanderCard(
                title: Text(t.global_seearch_label),
                trailing: SizedBox(
                  width: kExpanderTrailingWidth,
                  child: TextBox(
                    controller: searchController,
                    placeholder: t.global_search_placeholder,
                  ),
                ),
              ),
              for (var entry in entries) ...[
                EnvironmentEntryWidget(
                  entryId: widget.variable.entries.indexOf(entry),
                  variableId: index,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
