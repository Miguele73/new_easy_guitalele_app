import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/desicions_box.dart';
import 'package:new_easy_guitalele_app/src/features/auth/presentation/widgets/my_app_bar.dart';
import 'package:new_easy_guitalele_app/src/features/auth/song/song.dart';
import 'package:new_easy_guitalele_app/src/features/screen/song_detail_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/theme/app_colors.dart';

class SongListScreen extends StatefulWidget {
  final DatabaseRepository myRepository;
  const SongListScreen(this.myRepository, {super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  Future<List<Song>>? _songs;

  @override
  void initState() {
    super.initState();

    _songs = widget.myRepository.getSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(automaticallyImplyLeading: true),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DesicionsBox(
                color: Color(0xFFDE7A22),
                selectionText: 'Songs',
                imageIcon: ImageIcon(
                  AssetImage('assets/icons/music-4SongsIcon.png'),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: FutureBuilder(
                  future: _songs,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No songs available.'));
                    } else {
                      return ListView.builder(
                        shrinkWrap: false,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final Song currentSong = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Card(
                              color: const Color(0xFFBCBABE),
                              child: ListTile(
                                title: Text(currentSong.title),
                                subtitle: Text(currentSong.artist?.name ?? ''),
                                trailing: Text(
                                  currentSong.difficulty
                                      .toString()
                                      .split('.')
                                      .last,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                leading: Image.asset(currentSong.coverUrl),

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              SongDetailSelectionScreen(
                                                songName: currentSong.title,
                                              ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
