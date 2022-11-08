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

  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
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

  final buttonColors = WindowButtonColors(iconNormal: const Color(0xFF805306), mouseOver: const Color(0xFFF6A00C), mouseDown: const Color(0xFF805306), iconMouseOver: const Color(0xFF805306), iconMouseDown: const Color(0xFFFFD500));

  final closeButtonColors = WindowButtonColors(mouseOver: const Color(0xFFD32F2F), mouseDown: const Color(0xFFB71C1C), iconNormal: const Color(0xFF805306), iconMouseOver: Colors.white);

  @override
  Widget build(BuildContext context) {
    appWindow.title = t.global_app_title;

    var items = [
      item(
        icon: FluentIcons.person_24_filled,
        title: t.environmentVariables_title_user,
        body: const EnvironmentVariablesRoute(
          context: EnvironmentVariableContext.user,
        ),
      ),
      item(
        icon: FluentIcons.globe_24_filled,
        title: t.environmentVariables_title_system,
        body: const EnvironmentVariablesRoute(
          context: EnvironmentVariableContext.machine,
        ),
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
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        height: NcSpacing.xlSpacing * 1.5,
        title: WindowTitleBarBox(
          child: Row(
            children: [
              Expanded(
                child: MoveWindow(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      t.global_app_title,
                      // style: theme.typography.subtitle,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(FluentIcons.subtract_24_filled),
                onPressed: appWindow.minimize,
              ),
              NcSpacing.medium(),
              IconButton(
                icon: Icon(appWindow.isMaximized ? FluentIcons.square_multiple_24_regular : FluentIcons.maximize_24_filled),
                onPressed: maximizeOrRestore,
              ),
              NcSpacing.medium(),
              IconButton(
                icon: const Icon(FluentIcons.dismiss_24_filled),
                onPressed: appWindow.close,
              ),
            ],
          ),
        ),
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
