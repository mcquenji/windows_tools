part of windows_tools_widgets;

/// Displays a single environment variable.
class EnvironmentVariableWidget extends ConsumerStatefulWidget {
  final EnvironmentVariable variable;

  /// Displays a single environment variable.
  const EnvironmentVariableWidget({Key? key, required this.variable}) : super(key: key);

  @override
  ConsumerState<EnvironmentVariableWidget> createState() => _EnvironmentVariableWidgetState();
}

class _EnvironmentVariableWidgetState extends ConsumerState<EnvironmentVariableWidget> {
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(environmentVariablesProvider).indexOf(widget.variable);

    return Expander(
      header: Text(widget.variable.name),
      content: Column(
        children: [
          for (var i = 0; i < widget.variable.entries.length; i++) ...[
            EnvironmentEntryWidget(entryId: i, variableId: index),
            NcSpacing.xs(),
          ],
        ],
      ),
    );
  }
}
