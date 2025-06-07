import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/feature_selection_button.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/song_info_card.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chords_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/notes_screen.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class SongDetailSelectionScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  final String songName;

  const SongDetailSelectionScreen({
    super.key,
    required this.myRepository,
    required this.songName,
  });

  @override
  State<SongDetailSelectionScreen> createState() =>
      _SongDetailSelectionScreenState();
}

class _SongDetailSelectionScreenState extends State<SongDetailSelectionScreen> {
  late Future<Song?> _songFuture;

  @override
  void initState() {
    super.initState();
    _songFuture = widget.myRepository.getSongByName(widget.songName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: FutureBuilder<Song?>(
        future: _songFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Fehler beim Laden des Songs: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('Song "${widget.songName}" nicht gefunden.'),
            );
          } else {
            final Song song = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 48.0),
                    child: Image.asset(
                      'assets/logo/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SongInfoCard(
                          song: song,
                          myRepository: widget.myRepository,
                        ),

                        const SizedBox(height: 32),

                        FeatureSelectionButton(
                          text: 'Noten anzeigen',
                          backgroundColor: AppColors.scales,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotesScreen(song: song),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                        FeatureSelectionButton(
                          text: 'Akkorde anzeigen',
                          backgroundColor: AppColors.scales,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ChordsScreen(song: song.title),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
