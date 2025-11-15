import 'package:flutter/material.dart';

/// A custom elevated button with consistent styling across the app
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final bool isLoading;
  final double? width;
  final IconData? icon;
  final MainAxisAlignment iconAlignment;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style,
    this.isLoading = false,
    this.width,
    this.icon,
    this.iconAlignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final buttonChild = isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.onPrimary,
              ),
              strokeWidth: 2,
            ),
          )
        : (icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: iconAlignment,
                children: [
                  Icon(icon),
                  const SizedBox(width: 8),
                  Text(label),
                ],
              )
            : Text(label));

    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: buttonChild,
      ),
    );
  }
}

/// A custom text button (transparent background)
class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final IconData? icon;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(label, style: style),
              ],
            )
          : Text(label, style: style),
    );
  }
}

/// A custom icon button with consistent sizing
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final double size;
  final String? tooltip;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.size = 24,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: size, color: color),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}
