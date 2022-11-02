part of windows_tools_routes;

/// Route for the Environment Variables page.
class EnvironmentVariablesRoute extends ConsumerStatefulWidget {
  const EnvironmentVariablesRoute({Key? key}) : super(key: key);

  @override
  ConsumerState<EnvironmentVariablesRoute> createState() => _EnvironmentVariablesRouteState();
}

class _EnvironmentVariablesRouteState extends ConsumerState<EnvironmentVariablesRoute> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ref.read(environmentVariablesController).refresh();
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
        TextBox(
          controller: _searchController,
          onChanged: (value) => setState(() {}),
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
