import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class ChordDiagramDialog extends StatelessWidget {
  final Chord chord;

  const ChordDiagramDialog({super.key, required this.chord});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
                child: Image.asset(chord.assetImagePath, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  chord.chordName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8.0),
              //   child: TextButton(
              //     onPressed: () => Navigator.of(context).pop(),
              //     child: const Text('Schließen'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
