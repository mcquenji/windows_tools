part of windows_tools_routes;

/// Settings route.
class SettingsRoute extends ConsumerStatefulWidget {
  /// Settings route.
  const SettingsRoute({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsRoute> createState() => _SettingsRouteState();
}

class _SettingsRouteState extends ConsumerState<SettingsRoute> {
  @override
  Widget build(BuildContext context) {
    var settings = ref.watch(settingsProvider);
    var controller = ref.watch(settingsController);

    return ListView(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            t.settings_general,
            style: context.theme.typography.subtitle,
          ),
        ),
        NcSpacing.small(),
        const SettingsGeneralUpdateWidget(),
        NcSpacing.xs(),
        ExpanderCard(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(FluentIcons.local_language_24_filled, size: kExpanderIconSize),
          title: Text(t.settings_general_language),
          trailing: ComboBox<Locale>(
            value: settings.language,
            onChanged: (locale) => controller.setLanguage(locale!),
            items: [
              for (var language in AppLocalizations.supportedLocales)
                ComboBoxItem(
                  value: language,
                  child: Text(
                    LocaleNames.of(context)?.nameOf(language.toString()) ?? language.toString(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
