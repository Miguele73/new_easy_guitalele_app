import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color textColor;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.button,
    this.icon,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: textColor),
                  const SizedBox(width: 8.0),
                ],
                Text(text, style: TextStyle(color: textColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
