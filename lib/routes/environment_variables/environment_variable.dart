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

  @override
  Widget build(BuildContext context) {
    var index = ref.watch(environmentVariablesProvider).indexOf(widget.variable);

    var entries = widget.variable.entries.where((element) => element.value.containsCaseInsensitive(searchController.text)).toList();

    return Expander(
      headerHeight: kExpanderHeaderHeight,
      contentBackgroundColor: theme.cardColor,
      contentPadding: EdgeInsets.zero,
      header: Text(
        t.environmentVariables_name(
          widget.variable.name,
          widget.variable.entries.length,
        ),
      ),
      leading: Icon(
        widget.variable.context.isUser ? FluentIcons.person_24_filled : FluentIcons.globe_24_filled,
        size: kExpanderIconSize,
        color: theme.accentColor,
      ),
      trailing: DropDownButton(
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
    );
  }
}
