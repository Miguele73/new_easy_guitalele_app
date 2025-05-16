import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/one_back_button.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chords_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/notes_screen.dart';

class SongDetailSelectionScreen extends StatelessWidget {
  final String songName;

  const SongDetailSelectionScreen({super.key, required this.songName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: OneBackButton(padding: EdgeInsets.all(8.0)),

        title: Text(songName),
        backgroundColor: const Color(0xFF505160),
      ),

      backgroundColor: const Color(0xFF505160),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 48.0),
            child: Image.asset('assets/logo/logo.png', height: 200, width: 200),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    child: Card(
                      color: const Color(0xFFBCBABE),
                      child: ListTile(
                        title: Text(songName),
                        leading: const Icon(Icons.music_note),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => SongDetailSelectionScreen(
                                    songName: songName,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBCBABE),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.rye().fontFamily,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesScreen(songName: songName),
                      ),
                    );
                  },
                  child: const Text('Noten anzeigen'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD5C9B1),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.rye().fontFamily,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChordsScreen(songName: songName),
                      ),
                    );
                  },
                  child: const Text('Akkorde anzeigen'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
