part of windows_tools_routes;

/// Route for the Environment Variables page.
class EnvironmentVariablesRoute extends ConsumerStatefulWidget {
  /// The context of variables to display.
  final EnvironmentVariableContext context;

  /// Route for the Environment Variables page.
  const EnvironmentVariablesRoute({Key? key, required this.context}) : super(key: key);

  @override
  ConsumerState<EnvironmentVariablesRoute> createState() => _EnvironmentVariablesRouteState();
}

class _EnvironmentVariablesRouteState extends ConsumerState<EnvironmentVariablesRoute> {
  final searchController = TextEditingController();

  bool refreshing = false;

  @override
  void initState() {
    super.initState();

    ref.read(environmentVariablesController).refresh();
    searchController.addListener(() {
      setState(() {});
    });
  }

  refresh() async {
    if (refreshing) return;

    var controller = ref.watch(environmentVariablesController);

    setState(() {
      refreshing = true;
    });

    await controller.refresh();

    if (!mounted) return;

    setState(() {
      refreshing = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void addVariable() {
    final input = TextEditingController();
    var controller = ref.read(environmentVariablesController);

    add() {
      var success = controller.addVariable(input.text, widget.context);

      if (success) return;

      showDialog(
        context: context,
        builder: (context) => Dialog.ok(
          content: Text(t.environmentVariables_newVariable_alreadyExists_message(input.text)),
          title: t.environmentVariables_newVariable_alreadyExists_title,
        ),
      );
    }

    showDialog(
      context: context,
      builder: (context) => Dialog(
        contentBuilder: (context, confirm, cancel) => TextBox(
          placeholder: t.environmentVariables_newVariable_placeholder,
          controller: input,
          onSubmitted: (_) => confirm(),
          autofocus: true,
        ),
        title: t.environmentVariables_newVariable_title,
        onConfirm: add,
      ),
    );
  }

  @override
  Widget build(context) {
    var variables = ref.watch(environmentVariablesProvider).where((element) {
      return element.name.containsCaseInsensitive(searchController.text) && element.context == widget.context;
    }).toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextBox(
                controller: searchController,
                placeholder: t.global_search_placeholder,
              ),
            ),
            NcSpacing.small(),
            Tooltip(
              message: t.environmentVariables_newVariable_tooltip,
              child: SizedBox.square(
                dimension: kPickerHeight,
                child: Button(
                  onPressed: addVariable,
                  child: const Icon(FluentIcons.add_24_filled),
                ),
              ),
            ),
            NcSpacing.small(),
            Tooltip(
              message: t.environmentVariables_refresh_tooltip,
              child: SizedBox.square(
                dimension: kPickerHeight,
                child: Button(
                  onPressed: refresh,
                  child: ConditionalWidget(
                    condition: refreshing,
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
                GestureDetector(
                  child: EnvironmentVariableWidget(
                    key: ValueKey(variable.identifier),
                    variable: variable,
                  ),
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
