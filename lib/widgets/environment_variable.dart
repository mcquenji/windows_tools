part of windows_tools_widgets;

/// Displays a single environment variable.
class EnvironmentVariableWidget extends ConsumerStatefulWidget {
  /// The environment variable to display.
  final EnvironmentVariable variable;

  /// Displays a single environment variable.
  const EnvironmentVariableWidget({Key? key, required this.variable}) : super(key: key);

  /// The width of the entry search field.
  static const double entrySearchWidth = 250;

  // static const double expanderHeaderHoverHeight = expanderHeaderHeight + 5;

  @override
  ConsumerState<EnvironmentVariableWidget> createState() => _EnvironmentVariableWidgetState();
}

class _EnvironmentVariableWidgetState extends ConsumerState<EnvironmentVariableWidget> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var index = ref.watch(environmentVariablesProvider).indexOf(widget.variable);

    var entries = widget.variable.entries.where((element) => element.value.containsCaseInsensitive(_searchController.text)).toList();

    return Expander(
      headerHeight: ExpanderCard.expanderHeaderHeight,
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
        size: EnvironmentEntryWidget.iconSize,
      ),
      trailing: Button(
        child: Text(t.environmentVariables_newEntry),
        onPressed: () {},
      ),
      content: Column(
        children: [
          ExpanderCard(
            title: Text(t.global_seearch_label),
            trailing: SizedBox(
              width: EnvironmentVariableWidget.entrySearchWidth,
              child: TextBox(
                controller: _searchController,
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
