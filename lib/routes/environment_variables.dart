part of windows_tools_routes;

/// Route for the Environment Variables page.
class EnvironmentVariablesRoute extends ConsumerStatefulWidget {
  /// Route for the Environment Variables page.
  const EnvironmentVariablesRoute({Key? key}) : super(key: key);

  @override
  ConsumerState<EnvironmentVariablesRoute> createState() => _EnvironmentVariablesRouteState();
}

class _EnvironmentVariablesRouteState extends ConsumerState<EnvironmentVariablesRoute> {
  final _searchController = TextEditingController();

  bool _refreshing = false;

  @override
  void initState() {
    super.initState();

    ref.read(environmentVariablesController).refresh();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  _refresh() async {
    if (_refreshing) return;

    var controller = ref.watch(environmentVariablesController);

    setState(() {
      _refreshing = true;
    });

    await controller.refresh();

    if (!mounted) return;

    setState(() {
      _refreshing = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    var variables = ref
        .watch(environmentVariablesProvider)
        .where(
          (element) =>
              element.name.containsCaseInsensitive(_searchController.text) ||
              element.entries.any(
                (entry) => entry.value.containsCaseInsensitive(_searchController.text),
              ),
        )
        .toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextBox(
                controller: _searchController,
                placeholder: t.global_search_placeholder,
              ),
            ),
            NcSpacing.small(),
            Tooltip(
              message: t.environmentVariables_refresh_tooltip,
              child: SizedBox.square(
                dimension: kPickerHeight,
                child: Button(
                  style: theme.buttonTheme.defaultButtonStyle,
                  onPressed: _refresh,
                  child: ConditionalWidget(
                    condition: _refreshing,
                    trueWidget: (context) => const Center(
                      child: SizedBox.square(
                        dimension: 14,
                        child: ProgressRing(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    falseWidget: (context) => const Icon(FluentIcons.arrow_sync_24_filled),
                  ),
                ),
              ),
            ),
          ],
        ),
        NcSpacing.large(),
        Expanded(
          child: ListView(
            children: [
              for (var variable in variables) ...[
                EnvironmentVariableWidget(
                  variable: variable,
                  key: ValueKey(variable),
                ),
                NcSpacing.small(),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
