import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart'; // Stelle sicher, dass der Pfad korrekt ist

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final IconData? icon; // Optional für Buttons mit Icon
  final Color textColor; // Für Textfarbe des Buttons

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.button, // Standardfarbe
    this.icon,
    this.textColor = AppColors.white, // Standard Textfarbe
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
              mainAxisSize:
                  MainAxisSize
                      .min, // Damit die Row nicht zu viel Platz einnimmt
              children: [
                if (icon != null) ...[
                  // Nur wenn ein Icon vorhanden ist
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
