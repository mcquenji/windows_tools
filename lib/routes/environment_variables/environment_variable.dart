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

  void addEntry() {
    showDialog(
      context: context,
      builder: (context) => Dialog.ok(
        content: Text('Not implemented yet.'),
        title: 'Add entry',
      ),
    );
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
      ),
      trailing: Button(
        onPressed: addEntry,
        child: Text(t.environmentVariables_newEntry),
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
