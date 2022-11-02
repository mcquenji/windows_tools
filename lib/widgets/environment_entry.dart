part of windows_tools_widgets;

/// Displays a single environment variable entry.
class EnvironmentEntryWidget extends ConsumerStatefulWidget {
  final int entryId;
  final int variableId;

  /// Displays a single environment variable entry.
  const EnvironmentEntryWidget({Key? key, required this.entryId, required this.variableId}) : super(key: key);

  static const double iconSize = 20;

  @override
  ConsumerState<EnvironmentEntryWidget> createState() => _EnvironmentEntryWidgetState();
}

class _EnvironmentEntryWidgetState extends ConsumerState<EnvironmentEntryWidget> {
  @override
  Widget build(BuildContext context) {
    var entry = ref.watch(environmentVariablesProvider)[widget.variableId].entries[widget.entryId];
    var controller = ref.read(environmentVariablesController);

    return GestureDetector(
      onTap: () => controller.enableEntry(entry, !entry.enabled),
      child: Card(
        margin: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(entry.value),
            Tooltip(
              message: t.environmentVariables_toggle_tooltip,
              child: ToggleSwitch(
                checked: entry.enabled,
                onChanged: (value) => controller.enableEntry(entry, value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
