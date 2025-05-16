import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';

class UsersFav {
  final Song song;
  final bool isChordSong;
  final double? songRating;

  UsersFav({required this.song, required this.isChordSong, this.songRating});
}
