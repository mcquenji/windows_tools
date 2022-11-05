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
  final Widget? content;

  /// Called when the cancel button is pressed.
  final VoidCallback? onCancel;

  /// Called when the confirm button is pressed.
  final VoidCallback? onConfirm;

  /// Builds the content with confirm and cancel callbacks.
  ///
  /// Optional. If not provided, [content] will be used.
  final Widget Function(BuildContext context, VoidCallback confirm, VoidCallback cancel)? contentBuilder;

  final bool _hasCancel;

  /// [ContentDialog] with less boilerplate.
  const Dialog({
    Key? key,
    this.cancelText,
    this.confirmText,
    this.content,
    this.onCancel,
    this.onConfirm,
    this.contentBuilder,
    required this.title,
  })  : _hasCancel = true,
        assert(content != null || contentBuilder != null, 'Either content or contentBuilder must be provided.'),
        super(key: key);

  /// [ContentDialog] with less boilerplate.
  const Dialog.ok({
    Key? key,
    this.confirmText,
    this.content,
    this.onConfirm,
    this.contentBuilder,
    required this.title,
  })  : _hasCancel = false,
        cancelText = null,
        onCancel = null,
        assert(content != null || contentBuilder != null, 'Either content or contentBuilder must be provided.'),
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
        maxWidth: MediaQuery.of(context).size.width * 0.4,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      title: Text(
        title,
        style: context.theme.typography.title,
      ),
      content: contentBuilder?.call(context, onConfirm, onCancel) ?? content!,
      actions: [
        if (_hasCancel) ...[
          Button(
            onPressed: onConfirm,
            child: Text(
              confirmText ?? context.t.global_dialog_confirm,
            ),
          ),
          FilledButton(
            onPressed: onCancel,
            child: Text(
              cancelText ?? context.t.global_dialog_cancel,
            ),
          ),
        ],
        if (!_hasCancel)
          FilledButton(
            onPressed: onConfirm,
            child: Text(
              confirmText ?? context.t.global_dialog_confirm,
            ),
          ),
      ],
    );
  }
}
