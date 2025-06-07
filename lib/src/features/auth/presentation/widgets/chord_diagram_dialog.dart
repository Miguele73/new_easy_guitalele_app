import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';

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
                child: Image.asset(
                  chord.assetImagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Bild konnte nicht geladen werden',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
