part of windows_tools_routes;

/// Responsible for routing.
class NavRouter extends StatefulWidget {
  /// Responsible for routing.
  const NavRouter({Key? key}) : super(key: key);

  /// Icn size for pane items.
  static const iconSize = 17.0;

  @override
  State<NavRouter> createState() => _NavRouterState();
}

class _NavRouterState extends State<NavRouter> {
  int selected = 0;

  void select(int index) {
    setState(() {
      selected = index;
    });
  }

  PaneItem item({required String title, required IconData icon, required Widget body}) => PaneItem(
        title: Text(
          title,
          style: theme.typography.body,
        ),
        icon: Icon(icon, size: NavRouter.iconSize),
        body: body,
      );

  @override
  Widget build(BuildContext context) {
    var items = [
      item(
        icon: FluentIcons.globe_person_24_filled,
        title: t.environmentVariables_title,
        body: const EnvironmentVariablesRoute(),
      ),
    ];

    var footerItems = [
      if (kDebugMode)
        item(
          title: t.test_title,
          icon: FluentIcons.pill_24_filled,
          body: const TestRoute(),
        ),
      item(
        icon: FluentIcons.settings_24_filled,
        title: t.settings_title,
        body: const SettingsRoute(),
      ),
    ];

    var allItems = items + footerItems;

    var title = (allItems[selected].title as Text).data ?? t.global_404; // dirty hack to get the title, i know...

    return NavigationView(
      appBar: const NavigationAppBar(
        automaticallyImplyLeading: false,
        height: NcSpacing.largeSpacing * 1.5,
      ),
      paneBodyBuilder: (selectedPaneItemBody) => Padding(
        padding: const EdgeInsets.only(
          left: NcSpacing.mediumSpacing,
          right: NcSpacing.mediumSpacing,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: theme.typography.title,
              ),
            ),
            NcSpacing.large(),
            Expanded(
              child: selectedPaneItemBody ??
                  Center(
                    child: Text(t.global_404),
                  ),
            ),
          ],
        ),
      ),
      contentShape: const RoundedRectangleBorder(side: BorderSide.none),
      pane: NavigationPane(
        selected: selected,
        onChanged: select,
        items: [...items],
        footerItems: footerItems,
      ),
    );
  }
}

// class TestNavigationPaneWidget extends NavigationPaneWidget{
//   @override
//   Widget build(BuildContext context, NavigationPaneWidgetData data) {
//     data.
//     // TODO: implement build
//     throw UnimplementedError();
//   }

// }