part of windows_tools_widgets;

/// [ContentDialog] with less boilerplate.
class Dialog extends StatelessWidget {
  /// Cancel button text.
  final String? cancelText;

  /// Confirm button text.
  final String? confirmText;

  /// Dialog title.
  final String title;

  /// Dialog content.
  final Widget content;

  /// Called when the cancel button is pressed.
  final VoidCallback? onCancel;

  /// Called when the confirm button is pressed.
  final VoidCallback? onConfirm;

  final bool _hasCancel;

  /// [ContentDialog] with less boilerplate.
  const Dialog({
    Key? key,
    this.cancelText,
    this.confirmText,
    required this.content,
    this.onCancel,
    this.onConfirm,
    required this.title,
  })  : _hasCancel = true,
        super(key: key);

  /// [ContentDialog] with less boilerplate.
  const Dialog.ok({
    Key? key,
    this.confirmText,
    required this.content,
    this.onConfirm,
    required this.title,
  })  : _hasCancel = false,
        cancelText = null,
        onCancel = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    onConfirm() {
      Navigator.of(context).pop();
      this.onConfirm?.call();
    }

    onCancel() {
      Navigator.of(context).pop();
      this.onCancel?.call();
    }

    return ContentDialog(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.3,
        maxWidth: MediaQuery.of(context).size.width * 0.5,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      title: Text(title, style: context.theme.typography.body),
      content: content,
      actions: [
        if (_hasCancel) ...[
          FilledButton(
            onPressed: onCancel,
            child: Text(
              cancelText ?? context.t.global_dialog_cancel,
            ),
          ),
          Button(
            onPressed: onConfirm,
            child: Text(
              confirmText ?? context.t.global_dialog_confirm,
            ),
          ),
        ],
        if (!_hasCancel)
          FilledButton(
            onPressed: onConfirm,
            // style: context.theme.buttonTheme.filledButtonStyle,
            child: Text(
              confirmText ?? context.t.global_dialog_confirm,
            ),
          ),
      ],
    );
  }
}
