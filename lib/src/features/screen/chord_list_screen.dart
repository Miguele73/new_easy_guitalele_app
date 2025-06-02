import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';

import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';

class ChordListScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ChordListScreen(this.myRepository, {super.key});

  @override
  State<ChordListScreen> createState() => _ChordListScreenState();
}

class _ChordListScreenState extends State<ChordListScreen> {
  void _showChordDiagram(Chord chord) {
    setState(() {});
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: _closeChordDiagram,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(chord.assetImagePath),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      chord.chordName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _closeChordDiagram() {
    setState(() {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Chord>> allChords = widget.myRepository.getAllChords();
    return Scaffold(
      backgroundColor: const Color(0xFF505160),
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DesicionsBox(
                color: Color(0xFFBFDCCF),
                selectionText: 'Chordliste',
                imageIcon: ImageIcon(AssetImage('assets/icons/ChordsIcon.png')),
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: allChords,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No chords available.'));
                  } else {
                    final List<Chord> allChords = snapshot.data!;
                    return GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1.0,
                          ),
                      itemCount: allChords.length,
                      itemBuilder: (context, index) {
                        final chord = allChords[index];
                        return GestureDetector(
                          onTap: () => _showChordDiagram(chord),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFBCBABE),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                chord.chordName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
