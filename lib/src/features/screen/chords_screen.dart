import 'package:flutter/material.dart';

class ChordsScreen extends StatelessWidget {
  final String songName;
  const ChordsScreen({super.key, required this.songName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akkorde für $songName'),
        backgroundColor: const Color(0xFF505160),
      ),
      backgroundColor: const Color(0xFF505160),
      body: Center(child: Text('Zeige Akkorde für $songName')),
    );
  }
}
