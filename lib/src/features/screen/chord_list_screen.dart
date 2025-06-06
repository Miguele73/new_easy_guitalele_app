import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/chord_grid_item.dart'; // NEU
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/chord_diagram_dialog.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart'; // NEU

class ChordListScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const ChordListScreen(this.myRepository, {super.key});

  @override
  State<ChordListScreen> createState() => _ChordListScreenState();
}

class _ChordListScreenState extends State<ChordListScreen> {
  void _showChordDiagram(Chord chord) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChordDiagramDialog(chord: chord);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Chord>> allChordsFuture = widget.myRepository.getAllChords();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DesicionsBox(
                color: AppColors.chordList,
                selectionText: 'Chordliste',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ChordsIcon.png'),
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder<List<Chord>>(
                future: allChordsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Fehler beim Laden der Akkorde: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'Keine Akkorde verfügbar.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    );
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
                        return ChordGridItem(
                          chord: chord,
                          onTap: _showChordDiagram,
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
