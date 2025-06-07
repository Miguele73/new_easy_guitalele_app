// lib/src/data/shared_preferences_repository.dart
import 'package:new_easy_guitalele_app/src/features/auth/chord/chord.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/chord_song.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/tab_song.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/user_fav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/artist/artists.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';
import 'dart:convert';

class SharedPreferencesRepository implements DatabaseRepository {
  static const String _songsKey = 'songs_data';
  static const String _isLoggedInKey = 'is_logged_in';

  late SharedPreferences _prefs;
  bool _isInitialized = false;

  SharedPreferencesRepository();

  Future<void> initialize() async {
    if (!_isInitialized) {
      _prefs = await SharedPreferences.getInstance();
      _isInitialized = true;
      print('SharedPreferencesRepository: Initialisiert.');
    }
  }

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await initialize();
    }
  }

  @override
  Future<List<Song>> getSongs() async {
    await _ensureInitialized();
    final String? songsJson = _prefs.getString(_songsKey);
    if (songsJson == null || songsJson.isEmpty) {
      // Auch wenn der String leer ist
      // Lade die initialen Mock-Songs, wenn der Speicher leer ist
      final List<Song> initialSongs = _createInitialMockSongs();
      await _saveSongs(initialSongs); // Speichere sie sofort
      return initialSongs;
    }
    final List<dynamic> decodedList = jsonDecode(songsJson);

    return decodedList.map((data) {
      final String title = data['title'] ?? 'Unbekannt';
      final String coverUrl = data['coverUrl'] ?? '';
      final String artistName = data['artistName'] ?? '';
      final String difficultyString = data['difficulty'] ?? 'medium';
      final int? length = data['lengthOfSong']; // 'null' zulassen

      SongDifficulty difficulty;
      try {
        difficulty = SongDifficulty.values.firstWhere(
          (e) => e.toString().split('.').last == difficultyString,
        );
      } catch (e) {
        difficulty = SongDifficulty.medium; // Fallback
      }

      return Song(
        title: title,
        coverUrl: coverUrl,
        difficulty: difficulty,
        artist: artistName.isNotEmpty ? Artist(name: artistName) : null,
        lengthOfSong: length,
      );
    }).toList();
  }

  @override
  Future<Song?> getSongByName(String songName) async {
    await _ensureInitialized();
    final List<Song> allSongs = await getSongs();
    try {
      return allSongs.firstWhere((song) => song.title == songName);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addSongToFavorites(Song song) async {
    await _ensureInitialized();
    print(
      'SharedPreferencesRepository: addSongToFavorites not fully implemented.',
    );
  }

  @override
  Future<bool> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Simuliere hier eine einfache Login-Logik mit SharedPreferences
    // Eine echte Implementierung würde Hashes speichern und vergleichen
    if (email == "test@test.com" && password == "password") {
      await _prefs.setBool(_isLoggedInKey, true);
      print('SharedPreferencesRepository: User logged in.');
      return true;
    }
    print('SharedPreferencesRepository: Login failed.');
    return false;
  }

  @override
  Future<bool> registerUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Simuliere hier eine einfache Registrierungslogik mit SharedPreferences
    // Eine echte Implementierung würde neue Benutzerdaten speichern
    print('SharedPreferencesRepository: User registered (dummy).');
    return true;
  }

  @override
  Future<bool> resetPassword(String email) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('SharedPreferencesRepository: Password reset (dummy).');
    return true;
  }

  // NEU: Implementierung von isUserLoggedIn
  @override
  Future<bool> isUserLoggedIn() async {
    await _ensureInitialized();
    return _prefs.getBool(_isLoggedInKey) ??
        false; // Standardmäßig nicht eingeloggt
  }

  // NEU: Implementierung von signOut
  @override
  Future<void> signOut() async {
    await _ensureInitialized();
    await _prefs.remove(_isLoggedInKey); // Entferne den Login-Status
    print('SharedPreferencesRepository: User signed out.');
  }

  // --- Hilfsmethoden zum Speichern und Laden (intern) ---

  Future<void> _saveSongs(List<Song> songs) async {
    await _ensureInitialized();
    final List<Map<String, dynamic>> jsonList =
        songs
            .map(
              (song) => {
                'title': song.title,
                'coverUrl': song.coverUrl,
                'difficulty': song.difficulty.toString().split('.').last,
                'artistName': song.artist?.name,
                'lengthOfSong': song.lengthOfSong,
              },
            )
            .toList();
    await _prefs.setString(_songsKey, jsonEncode(jsonList));
  }

  List<Song> _createInitialMockSongs() {
    return [
      Song(
        title: 'Angie',
        artist: Artist(name: 'The Rolling Stones'),
        coverUrl: 'assets/covers/angie.png',
        difficulty: SongDifficulty.medium,
        lengthOfSong: 242,
      ),
      Song(
        title: 'Blackbird',
        coverUrl: 'assets/covers/blackbird.png',
        difficulty: SongDifficulty.medium,
        artist: Artist(name: 'The Beatles'),
        lengthOfSong: null,
      ),
      Song(
        title: 'Boulevard of broken dreams',
        coverUrl: 'assets/covers/boulevard.png',
        difficulty: SongDifficulty.hard,
        artist: Artist(name: 'Green Day'),
        lengthOfSong: null,
      ),
      Song(
        title: 'Creep',
        coverUrl: 'assets/covers/creep.png',
        difficulty: SongDifficulty.medium,
        artist: Artist(name: 'Radiohead'),
        lengthOfSong: null,
      ),
      Song(
        title: 'Dust in the wind',
        coverUrl: 'assets/covers/dust_in_the_wind.png',
        difficulty: SongDifficulty.hard,
        artist: Artist(name: 'Kansas'),
        lengthOfSong: null,
      ),
      Song(
        title: 'Hallelujah',
        coverUrl: 'assets/covers/hallelujah.png',
        difficulty: SongDifficulty.hard,
        artist: null,
        lengthOfSong: null,
      ),
      Song(
        title: 'Hotel California',
        coverUrl: 'assets/covers/hotel_california.png',
        difficulty: SongDifficulty.veryEasy,
        artist: Artist(name: 'Eagles'),
        lengthOfSong: null,
      ),
      Song(
        title: 'I will always love you',
        coverUrl: 'assets/covers/i_will_always.png',
        difficulty: SongDifficulty.hard,
        artist: Artist(name: 'Whitney Houston'),
        lengthOfSong: null,
      ),
      Song(
        title: 'Knockin on heavens door',
        coverUrl: 'assets/covers/knocking_on_heavens.png',
        difficulty: SongDifficulty.easy,
        artist: Artist(name: 'Bob Dylan'),
        lengthOfSong: null,
      ),
    ];
  }

  @override
  Future<List<Chord>> getAllChords() {
    return Future.value([]);
  }

  @override
  Future<List<ChordSong>> getChordSongs() {
    throw UnimplementedError();
  }

  @override
  Future<List<TabsSong>> getTabsSongs() {
    throw UnimplementedError();
  }

  @override
  Future<List<UsersFav>> getUsersFavs() {
    throw UnimplementedError();
  }
}
