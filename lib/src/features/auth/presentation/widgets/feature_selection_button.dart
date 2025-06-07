import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class FeatureSelectionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const FeatureSelectionButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.text,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: TextStyle(
          fontSize: 20,
          fontFamily: GoogleFonts.rye().fontFamily,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
