import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';

class ChordSelectionScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ChordSelectionScreen(this.myRepository, {super.key});

  @override
  State<ChordSelectionScreen> createState() => _ChordSelectionScreenState();
}

class _ChordSelectionScreenState extends State<ChordSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF505160),
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DesicionsBox(
                color: Color(0xFFD5C9B1),
                selectionText: 'Chords',
                imageIcon: ImageIcon(AssetImage('assets/icons/ChordIcon.png')),
              ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      color: const Color(0xFFBCBABE),
                      child: ListTile(
                        title: Text('Chord ${index + 1}'),
                        leading: const Icon(Icons.music_note),
                        onTap: () {
                          // Handle chord selection
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
