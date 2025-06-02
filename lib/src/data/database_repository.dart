import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/chord_song.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/tab_song.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/user_fav.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';

abstract class DatabaseRepository {
  Future<List<Song>> getSongs();
  Future<List<Chord>> getAllChords();
  Future<List<ChordSong>> getChordSongs();
  Future<List<TabsSong>> getTabsSongs();
  Future<List<UsersFav>> getUsersFavs();
  Future<void> addSongToFavorites(Song song);
}
