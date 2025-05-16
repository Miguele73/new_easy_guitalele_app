import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';

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
      backgroundColor: const Color(0xFF505160),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 250,
        backgroundColor: const Color(0xFF505160),
        title: Image.asset('assets/logo/logo.png', height: 200, width: 200),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView(
            shrinkWrap: true,

            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 8),
                child: DesicionsBox(
                  color: Color(0xFFDE7A22),
                  selectionText: 'Songs',
                  imageIcon: ImageIcon(
                    AssetImage('assets/icons/music-4SongsIcon.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 8),
                child: DesicionsBox(
                  color: Color(0xFFD5C9B1),
                  selectionText: 'Chords',
                  imageIcon: ImageIcon(
                    AssetImage('assets/icons/ChordIcon.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                child: DesicionsBox(
                  color: Color(0xFFBCBABE),
                  selectionText: 'Scales',
                  imageIcon: ImageIcon(
                    AssetImage('assets/icons/ClefIcon.png'),
                    size: 28,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                child: DesicionsBox(
                  color: Color(0xFFBFDCCF),
                  selectionText: 'Chordliste',
                  imageIcon: ImageIcon(
                    AssetImage('assets/icons/ChordIcon.png'),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
                child: DesicionsBox(
                  color: Color(0xFFE05858),
                  selectionText: 'Meine Favoriten',
                  imageIcon: ImageIcon(
                    AssetImage('assets/icons/FavoritesBookmark.png'),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
