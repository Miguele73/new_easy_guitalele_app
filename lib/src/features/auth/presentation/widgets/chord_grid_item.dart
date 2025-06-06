import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';

class ChordGridItem extends StatelessWidget {
  final Chord chord;
  final ValueChanged<Chord> onTap;

  const ChordGridItem({super.key, required this.chord, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(chord),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFBCBABE),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              chord.chordName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
