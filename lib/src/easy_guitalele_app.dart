import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chord_list_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/chord_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/scale_selection_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/song_list_screen.dart';
import 'package:new_easy_guitalele_app/src/features/screen/splash_screen.dart';
import 'package:new_easy_guitalele_app/src/theme/guitalele_theme.dart';

class EasyGuitaleleApp extends StatelessWidget {
  final DatabaseRepository myRepository;
  const EasyGuitaleleApp(this.myRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightThemeWithAppBar,
      darkTheme: AppTheme.darkThemeWithAppBar,
      themeMode: ThemeMode.system,
      initialRoute: '/splashScreen',
      routes: {
        '/songListScreen': (context) => SongListScreen(myRepository),
        '/splashScreen': (context) => SplashScreen(myRepository),
        '/chordSelectionScreen':
            (context) => ChordSelectionScreen(myRepository),
        '/scaleSelectionScreen':
            (context) => ScaleSelectionScreen(myRepository),
        '/chordListScreen': (context) => ChordListScreen(myRepository),
      },
      debugShowCheckedModeBanner: true,
      home: SplashScreen(myRepository),
    );
  }
}
