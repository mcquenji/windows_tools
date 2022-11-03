part of windows_tools_widgets;

/// Displays a single environment variable.
class EnvironmentVariableWidget extends ConsumerStatefulWidget {
  final EnvironmentVariable variable;

  /// Displays a single environment variable.
  const EnvironmentVariableWidget({Key? key, required this.variable}) : super(key: key);

  static const double expanderHeaderHeight = 65;
  static const double expanderHeaderHoverHeight = expanderHeaderHeight + 5;

  @override
  ConsumerState<EnvironmentVariableWidget> createState() => _EnvironmentVariableWidgetState();
}

class _EnvironmentVariableWidgetState extends ConsumerState<EnvironmentVariableWidget> {
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(environmentVariablesProvider).indexOf(widget.variable);

    return Expander(
      headerHeight: EnvironmentVariableWidget.expanderHeaderHeight,
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
          for (var i = 0; i < widget.variable.entries.length; i++) ...[
            EnvironmentEntryWidget(
              entryId: i,
              variableId: index,
            ),
            // if (i != widget.variable.entries.length - 1) NcSpacing.xs(),
          ],
        ],
      ),
    );
  }
}
