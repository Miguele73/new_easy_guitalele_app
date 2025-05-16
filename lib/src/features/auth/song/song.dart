import 'package:new_easy_guitalele_app/src/features/auth/artist/artists.dart';

enum SongDifficulty { veryEasy, easy, medium, hard, master }

class Song {
  final SongDifficulty difficulty;
  final String coverUrl;
  final String title;

  final Artist? artist;
  final int? lengthOfSong;

  // ignore: prefer_typing_uninitialized_variables
  static var length;

  Song({
    required this.title,
    required this.coverUrl,

    required this.difficulty,
    required this.artist,
    required this.lengthOfSong,
  });
}
