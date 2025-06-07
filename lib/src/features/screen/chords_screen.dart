import 'package:flutter/material.dart';

class ChordsScreen extends StatelessWidget {
  final String song;
  const ChordsScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akkorde für $song'),
        backgroundColor: const Color(0xFF505160),
      ),
      backgroundColor: const Color(0xFF505160),
      body: Center(child: Text('Zeige Akkorde für $song')),
    );
  }
}
