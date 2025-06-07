import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';

class NotesScreen extends StatelessWidget {
  final Song song;
  const NotesScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(automaticallyImplyLeading: true),
      backgroundColor: const Color(0xFF505160),
      body: Center(child: Text('Zeige Noten für $song')),
    );
  }
}
