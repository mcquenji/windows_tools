part of windows_tools_routes;

/// Settings route.
class SettingsRoute extends StatelessWidget {
  /// Settings route.
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.t.settings_title,
      ),
    );
  }
}
