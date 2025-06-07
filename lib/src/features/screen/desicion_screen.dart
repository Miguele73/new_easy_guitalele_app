import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart'; // Deine AppBar
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

// Importiere alle Zielscreens
import 'package:new_easy_guitalele_app/src/features/screen/song_list_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chord_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/scale_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chord_list_screen.dart'; // WICHTIG: ChordListScreen importieren

class DesicionScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const DesicionScreen(this.myRepository, {super.key});

  @override
  State<DesicionScreen> createState() => _DesicionScreenState();
}

class _DesicionScreenState extends State<DesicionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Songs Box
              DesicionsBox(
                color: AppColors.songs,
                selectionText: 'Songs',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/music-4SongsIcon.png'),
                ),
              ),
              // Chords Box
              DesicionsBox(
                color: AppColors.chords,
                selectionText: 'Chords',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ChordIcon.png'),
                ),
              ),
              // Scales Box
              DesicionsBox(
                color: AppColors.scales,
                selectionText: 'Scales',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ClefIcon.png'),
                  size: 28,
                ),
              ),
              // Chordliste Box (DAS WAR DAS PROBLEM!)
              DesicionsBox(
                color: AppColors.chordList,
                selectionText: 'Chordliste',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ChordsIcon.png'),
                ),
              ),
              // Meine Favoriten Box
              DesicionsBox(
                color: AppColors.favorites,
                selectionText: 'Meine Favoriten',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/FavoritesBookmark.png'),
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
