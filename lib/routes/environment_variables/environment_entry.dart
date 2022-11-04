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
  @override
  Widget build(BuildContext context) {
    var entry = ref.watch(environmentVariablesProvider)[widget.variableId].entries[widget.entryId];
    var controller = ref.read(environmentVariablesController);

    return ExpanderCard(
      onPressed: () => controller.enableEntry(entry, !entry.enabled),
      title: Text(entry.value),
      trailing: Tooltip(
        message: t.environmentVariables_toggle_tooltip,
        child: ToggleSwitch(
          checked: entry.enabled,
          onChanged: (value) => controller.enableEntry(entry, value),
        ),
      ),
    );
  }
}
