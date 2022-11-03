part of windows_tools_widgets;

/// A card that resides in an [Expander].
class ExpanderCard extends StatelessWidget {
  /// Leading widget before the title.
  final Widget? leading;

  /// The title of the card.
  final Widget title;

  /// Trailing widget at the end of the card.
  final Widget? trailing;

  /// A card that resides in an [Expander].
  const ExpanderCard({Key? key, this.leading, required this.title, this.trailing}) : super(key: key);

  /// Padding used on the sides of the card.
  static const double padding = 16;

  /// The height of the expander header.
  static const double expanderHeaderHeight = 65;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: expanderHeaderHeight,
      child: Card(
        backgroundColor: context.theme.resources.cardBackgroundFillColorSecondary,
        child: Padding(
          padding: const EdgeInsets.only(left: padding, right: padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (leading != null) ...[
                      leading!,
                      NcSpacing.medium(),
                    ],
                    title,
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}
