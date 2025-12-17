import 'package:flutter/material.dart';
import 'package:tudkabir/shared/utils/theming.dart';

enum ButtonIconPosition { left, right }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.onPressed,
    required this.minimumSize,
    super.key,
    this.child,
    this.text, // adicionando o texto opcional
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.isGradient = true,
    this.gradient,
  });

  final VoidCallback? onPressed;
  final Widget? child; // agora opcional
  final String? text; // texto padrão opcional
  final Size minimumSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final bool? isGradient;
  final Gradient? gradient;

  // ignore: prefer_constructors_over_static_methods doc
  static AppElevatedButton withIcon({
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
    required Size minimumSize,
    Key? key,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disabledBackgroundColor,
    bool? isGradient,
    ButtonIconPosition iconPosition = ButtonIconPosition.left,
  }) {
    return AppElevatedButton(
      key: key,
      onPressed: onPressed,
      minimumSize: minimumSize,
      backgroundColor: backgroundColor,
      foregroundColor:
          foregroundColor ?? AppTheme.appTheme.colorScheme.onTertiary,
      disabledBackgroundColor: disabledBackgroundColor,
      isGradient: isGradient,
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: iconPosition == ButtonIconPosition.left
            ? [icon, label]
            : [label, icon],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    final useGradient = (isGradient ?? false) && !isDisabled;

    // conteúdo padrão caso child não seja passado
    final content =
        child ??
        Text(
          text ?? 'Continuar',
          style: TextStyle(
            color: AppTheme.appTheme.colorScheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.comfortable,
        disabledBackgroundColor:
            disabledBackgroundColor ?? const Color(0xccEDF1F3),
        disabledForegroundColor: Colors.black45,
        backgroundColor: useGradient
            ? Colors.transparent
            : (backgroundColor ?? AppTheme.appTheme.colorScheme.tertiary),
        foregroundColor:
            foregroundColor ?? AppTheme.appTheme.colorScheme.onTertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: minimumSize,
        padding: EdgeInsets.zero,
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: useGradient
              ? null
              : (isDisabled
                    ? (disabledBackgroundColor ?? const Color(0xccEDF1F3))
                    : null),
          gradient: useGradient
              ? gradient ??
                    const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff81abff),
                        Color(0xff0043c9),
                      ],
                    )
              : null,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: content,
        ),
      ),
    );
  }
}
