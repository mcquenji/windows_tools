part of windows_tools_routes;

/// Test route. Only available when [kDebugMode] is true.

class TestRoute extends StatefulWidget {
  /// Test route. Only available when [kDebugMode] is true.
  const TestRoute({Key? key}) : super(key: key);

  @override
  State<TestRoute> createState() => _TestRouteState();
}

class _TestRouteState extends State<TestRoute> {
  final itemCountInput = TextEditingController(text: 100.toString());

  @override
  void initState() {
    itemCountInput.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
