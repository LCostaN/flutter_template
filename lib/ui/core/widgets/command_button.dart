import 'package:flutter/material.dart';

import '../utils/command/command.dart';

typedef WidgetBuilderCallback = Widget Function(BuildContext context);

enum ButtonType { elevated, filled, outlined, text, icon }

/// A button widget that integrates with a [Command] and behaves similarly to
/// Flutter's standard button widgets.
///
/// This widget provides additional functionality to handle loading and error
/// states by allowing custom widgets to be displayed during these states.
class CommandButton extends StatelessWidget {
  /// The [Command] instance that this button interacts with. It
  /// determines the button's behavior and state.
  final Command command;

  /// An optional callback that builds a widget to display
  /// when the button is in a loading state.
  final WidgetBuilderCallback loadingBuilder;

  /// An optional callback that builds a widget to display
  /// when the button is in an error state.
  final WidgetBuilderCallback? errorBuilder;

  /// An optional [ButtonStyle] to customize the appearance of the
  /// button.
  final ButtonStyle? style;

  /// Specifies the type of button, allowing customization of
  /// its behavior and appearance.
  final ButtonType buttonType;

  /// The widget to display when the button is neither loading nor
  /// showing an error. This is typically the main content of the button.
  final Widget child;

  /// A callback function that is triggered when the button is tapped.
  ///
  /// This `onTap` is expected to be derived from the `command` passed to the
  /// `CommandButton`. It ensures that the button correctly tracks the state
  /// of the `command` and performs the associated actions. If `onTap` is not
  /// derived from the `command`, the button may fail to properly reflect the
  /// command's state or execute its intended behavior.
  final VoidCallback? onTap;

  const CommandButton._({
    required this.command,
    required this.child,
    required this.buttonType,
    required this.onTap,
    this.loadingBuilder = _defaultLoadingBuilder,
    this.errorBuilder,
    this.style,
    super.key,
  });

  /// A factory constructor for creating an elevated [CommandButton].
  ///
  /// This button type is styled as an elevated button, which is typically
  /// used to emphasize primary actions.
  ///
  /// - [command]: The [Command] to be executed when the button is pressed.
  /// - [child]: The widget to display inside the button.
  /// - [onTap]: Tap action. Expected to be derived from the command. A null value would disable the button
  /// - [loadingBuilder]: Optional callback to build a widget when the command
  ///   is in a loading state. Defaults to a circular progress indicator.
  /// - [errorBuilder]: Optional callback to build a widget when the command
  ///   is in an error state.
  /// - [style]: Optional [ButtonStyle] to customize the appearance of the button.
  /// - [key]: Optional key for the button widget.
  factory CommandButton.elevated({
    required Command command,
    required Widget child,
    required VoidCallback? onTap,
    WidgetBuilderCallback? loadingBuilder,
    WidgetBuilderCallback? errorBuilder,
    ButtonStyle? style,
    Key? key,
  }) {
    return CommandButton._(
      command: command,
      onTap: onTap,
      buttonType: ButtonType.elevated,
      loadingBuilder: loadingBuilder ?? _defaultLoadingBuilder,
      errorBuilder: errorBuilder,
      style: style,
      key: key,
      child: child,
    );
  }

  /// A factory constructor for creating a filled [CommandButton].
  ///
  /// This button type is styled as a filled button, which is typically
  /// used for prominent actions with a solid background.
  ///
  /// - [command]: The [Command] to be executed when the button is pressed.
  /// - [child]: The widget to display inside the button.
  /// - [onTap]: Tap action. Expected to be derived from the command. A null value would disable the button
  /// - [loadingBuilder]: Optional callback to build a widget when the command
  ///   is in a loading state.
  /// - [errorBuilder]: Optional callback to build a widget when the command
  ///   is in an error state.
  /// - [style]: Optional [ButtonStyle] to customize the appearance of the button.
  /// - [key]: Optional key for the button widget.
  factory CommandButton.filled({
    required Command command,
    required Widget child,
    required VoidCallback? onTap,
    WidgetBuilderCallback? loadingBuilder,
    WidgetBuilderCallback? errorBuilder,
    ButtonStyle? style,
    Key? key,
  }) {
    return CommandButton._(
      command: command,
      onTap: onTap,
      buttonType: ButtonType.filled,
      loadingBuilder: loadingBuilder ?? _defaultLoadingBuilder,
      errorBuilder: errorBuilder,
      style: style,
      key: key,
      child: child,
    );
  }

  /// A factory constructor for creating an outlined [CommandButton].
  ///
  /// This button type is styled as an outlined button, which is typically
  /// used for secondary actions or less prominent options.
  ///
  /// - [command]: The [Command] to be executed when the button is pressed.
  /// - [child]: The widget to display inside the button.
  /// - [onTap]: Tap action. Expected to be derived from the command. A null value would disable the button
  /// - [loadingBuilder]: Optional callback to build a widget when the command
  ///   is in a loading state.
  /// - [errorBuilder]: Optional callback to build a widget when the command
  ///   is in an error state.
  /// - [style]: Optional [ButtonStyle] to customize the appearance of the button.
  /// - [key]: Optional key for the button widget.
  factory CommandButton.outlined({
    required Command command,
    required Widget child,
    required VoidCallback? onTap,
    WidgetBuilderCallback? loadingBuilder,
    WidgetBuilderCallback? errorBuilder,
    ButtonStyle? style,
    Key? key,
  }) {
    return CommandButton._(
      command: command,
      onTap: onTap,
      buttonType: ButtonType.outlined,
      loadingBuilder: loadingBuilder ?? _defaultLoadingBuilder,
      errorBuilder: errorBuilder,
      style: style,
      key: key,
      child: child,
    );
  }

  /// A factory constructor for creating a text [CommandButton].
  ///
  /// This button type is styled as a text button, which is typically
  /// used for less prominent actions or inline options.
  ///
  /// - [command]: The [Command] to be executed when the button is pressed.
  /// - [child]: The widget to display inside the button.
  /// - [onTap]: Tap action. Expected to be derived from the command. A null value would disable the button
  /// - [loadingBuilder]: Optional callback to build a widget when the command
  ///   is in a loading state.
  /// - [errorBuilder]: Optional callback to build a widget when the command
  ///   is in an error state.
  /// - [style]: Optional [ButtonStyle] to customize the appearance of the button.
  /// - [key]: Optional key for the button widget.
  factory CommandButton.text({
    required Command command,
    required Widget child,
    required VoidCallback? onTap,
    WidgetBuilderCallback? loadingBuilder,
    WidgetBuilderCallback? errorBuilder,
    ButtonStyle? style,
    Key? key,
  }) {
    return CommandButton._(
      command: command,
      onTap: onTap,
      buttonType: ButtonType.text,
      loadingBuilder: loadingBuilder ?? _defaultLoadingBuilder,
      errorBuilder: errorBuilder,
      style: style,
      key: key,
      child: child,
    );
  }

  /// A factory constructor for creating an icon [CommandButton].
  ///
  /// This button type is styled as an icon button, which is typically
  /// used for compact actions represented by an icon.
  ///
  /// - [command]: The [Command] to be executed when the button is pressed.
  /// - [child]: The widget to display inside the button.
  /// - [onTap]: Tap action. Expected to be derived from the command. A null value would disable the button
  /// - [loadingBuilder]: Optional callback to build a widget when the command
  ///   is in a loading state.
  /// - [errorBuilder]: Optional callback to build a widget when the command
  ///   is in an error state.
  /// - [style]: Optional [ButtonStyle] to customize the appearance of the button.
  /// - [key]: Optional key for the button widget.
  factory CommandButton.icon({
    required Command command,
    required Widget child,
    required VoidCallback? onTap,
    WidgetBuilderCallback? loadingBuilder,
    WidgetBuilderCallback? errorBuilder,
    ButtonStyle? style,
    Key? key,
  }) {
    return CommandButton._(
      command: command,
      onTap: onTap,
      buttonType: ButtonType.icon,
      loadingBuilder: loadingBuilder ?? _defaultLoadingBuilder,
      errorBuilder: errorBuilder,
      style: style,
      key: key,
      child: child,
    );
  }

  static Widget _defaultLoadingBuilder(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AspectRatio(aspectRatio: 1, child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: command,
      builder: (context, content) {
        Widget? loadingOverlay;
        if (command.running) {
          loadingOverlay = Positioned.fill(child: loadingBuilder(context));
        }

        Widget? errorOverlay;
        if (command.error && errorBuilder != null) {
          errorOverlay = Positioned.fill(child: errorBuilder!(context));
        }

        final buttonContent = Opacity(
          opacity: loadingOverlay == null || errorOverlay != null ? 1 : 0,
          child: buttonType == ButtonType.icon ? IconTheme(data: IconTheme.of(context), child: child) : child,
        );

        Widget button;
        switch (buttonType) {
          case ButtonType.elevated:
            button = ElevatedButton(onPressed: onTap, style: style, child: buttonContent);
            break;
          case ButtonType.filled:
            button = FilledButton(onPressed: onTap, style: style, child: buttonContent);
            break;
          case ButtonType.outlined:
            button = OutlinedButton(onPressed: onTap, style: style, child: buttonContent);
            break;
          case ButtonType.text:
            button = TextButton(onPressed: onTap, style: style, child: buttonContent);
            break;
          case ButtonType.icon:
            button = IconButton(onPressed: onTap, style: style, icon: buttonContent);
            break;
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            button,
            if (loadingOverlay != null) loadingOverlay,
            if (errorOverlay != null) errorOverlay,
          ],
        );
      },
    );
  }
}
