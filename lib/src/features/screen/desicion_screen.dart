import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

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
          padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
          child: ListView(
            shrinkWrap: true,
            children: [
              DesicionsBox(
                color: AppColors.songs,
                selectionText: 'Songs',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/music-4SongsIcon.png'),
                ),
              ),

              DesicionsBox(
                color: AppColors.chords,
                selectionText: 'Chords',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ChordIcon.png'),
                ),
              ),

              DesicionsBox(
                color: AppColors.scales,
                selectionText: 'Scales',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ClefIcon.png'),
                  size: 28,
                ),
              ),

              DesicionsBox(
                color: AppColors.chordList,
                selectionText: 'Chordliste',
                imageIcon: const ImageIcon(
                  AssetImage('assets/icons/ChordsIcon.png'),
                ),
              ),

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
