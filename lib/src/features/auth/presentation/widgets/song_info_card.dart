import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';
import 'package:new_easy_guitalele_app/src/features/screen/song_detail_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class SongInfoCard extends StatelessWidget {
  final Song song;
  final DatabaseRepository myRepository;
  const SongInfoCard({
    super.key,
    required this.song,
    required this.myRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: AppColors.chords,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist?.name ?? ''),
            trailing: Text(
              song.difficulty.toString().split('.').last,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            leading: Image.asset(
              song.coverUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.music_note, size: 40);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SongDetailSelectionScreen(
                        songName: song.title,
                        myRepository: myRepository,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
