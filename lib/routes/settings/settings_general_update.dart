part of windows_tools_routes;

/// Update section of the settings.
class SettingsGeneralUpdateWidget extends ConsumerStatefulWidget {
  /// Update section of the settings.
  const SettingsGeneralUpdateWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingsGeneralUpdateWidget> createState() => _SettingsGeneralUpdateWidgetState();
}

class _SettingsGeneralUpdateWidgetState extends ConsumerState<SettingsGeneralUpdateWidget> {
  @override
  Widget build(BuildContext context) {
    var info = ref.watch(updateProvider);
    var updater = ref.watch(updateController);
    var settings = ref.watch(settingsProvider);
    var controller = ref.watch(settingsController);

    return ConditionalWidget(
      condition: info.installing,
      trueWidget: (context) => ExpanderCard(
        backgroundColor: ButtonState.all(theme.resources.systemFillColorSuccessBackground),
        contentPadding: EdgeInsets.zero,
        leading: const Icon(
          FluentIcons.arrow_sync_24_filled,
          size: kExpanderIconSize,
        ),
        title: Text(
          t.settings_general_update_installing((info.installProgress ?? 0).toString()),
        ),
        trailing: SizedBox(
          width: kExpanderTrailingWidth,
          child: ProgressBar(value: info.installProgress),
        ),
      ),
      falseWidget: (context) => Expander(
        initiallyExpanded: info.updateAvailable,
        headerHeight: kExpanderHeaderHeight,
        contentBackgroundColor: theme.cardColor,
        headerBackgroundColor: info.updateAvailable ? ButtonState.all(theme.resources.systemFillColorSuccessBackground) : null,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(
          FluentIcons.arrow_sync_24_filled,
          size: kExpanderIconSize,
        ),
        header: Text(info.updateAvailable ? t.settings_general_update_newVersion : kVersion),
        trailing: ConditionalWidget(
          condition: info.checking,
          trueWidget: (context) => const SizedBox.square(
            dimension: kExpanderTrailingHeight,
            child: ProgressRing(
              strokeWidth: kExpanderProgressRingWidth,
            ),
          ),
          falseWidget: (context) => Button(
            child: Text(
              info.updateAvailable ? t.settings_general_update_install : t.settings_general_update_checkNow,
            ),
            onPressed: () => info.updateAvailable ? updater.installUpdate() : updater.checkForUpdates(kVersion),
          ),
        ),
        content: Column(
          children: [
            if (!info.updateAvailable && info.errorMessage == null)
              ExpanderCard(
                backgroundColor: ButtonState.all(theme.resources.systemFillColorSuccessBackground),
                leading: Icon(FluentIcons.checkmark_circle_24_filled, color: theme.resources.systemFillColorSuccess, size: kExpanderIconSize),
                title: Text(t.settings_general_update_upToDate, style: theme.typography.bodyStrong),
                subtitle: Text(
                  t.settings_general_update_upToDate_lastChecked(
                    kDateFormatter.format(info.lastChecked!),
                  ),
                ),
              ),
            if (info.errorMessage != null)
              ExpanderCard(
                backgroundColor: ButtonState.all(theme.resources.systemFillColorCriticalBackground),
                leading: Icon(FluentIcons.error_circle_24_filled, color: theme.resources.systemFillColorCritical),
                title: Text(t.settings_general_update_error, style: theme.typography.bodyStrong),
              ),
            if (info.updateAvailable)
              ExpanderCard(
                backgroundColor: ButtonState.all(theme.resources.systemFillColorAttentionBackground),
                leading: Icon(
                  FluentIcons.notepad_24_filled,
                  color: theme.accentColor.defaultBrushFor(theme.brightness),
                ),
                title: Text(
                  t.settings_general_update_patchNotes_title(
                    info.latestVersion!,
                    kDateFormatter.format(info.releaseDate!),
                  ),
                  style: theme.typography.bodyStrong,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: NcSpacing.smallSpacing),
                  child: MarkdownBody(
                    data: info.patchNotes!,
                    extensionSet: md.ExtensionSet.gitHubFlavored,
                    styleSheet: MarkdownStyleSheet(
                      p: theme.typography.body,
                      a: theme.typography.bodyStrong!.copyWith(
                        color: theme.accentColor.defaultBrushFor(theme.brightness),
                      ),
                      h1: theme.typography.subtitle,
                      strong: theme.typography.bodyStrong,
                    ),
                    onTapLink: (text, href, title) => launchUrl(Uri.parse(href!)),
                  ),
                ),
              ),
            ExpanderCard(
              title: Text(t.settings_general_update_autCheck),
              trailing: ToggleSwitch(
                checked: settings.autoCheckUpdates,
                onChanged: controller.setAutoCheck,
              ),
              onPressed: () => controller.setAutoCheck(!settings.autoCheckUpdates),
              // onPressed: () => print("sdasdasdasd"),
            ),
          ],
        ),
      ),
    );
  }
}
