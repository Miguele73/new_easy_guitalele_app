import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/one_back_button.dart';

class NotesScreen extends StatelessWidget {
  final String songName;
  const NotesScreen({super.key, required this.songName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OneBackButton(padding: EdgeInsets.all(8.0)),
        title: Text('Noten für $songName'),
        backgroundColor: const Color(0xFF505160),
      ),
      backgroundColor: const Color(0xFF505160),
      body: Center(child: Text('Zeige Noten für $songName')),
    );
  }
}
