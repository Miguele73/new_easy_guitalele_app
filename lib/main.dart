import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/easy_guitalele_app.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/data/mock_database_repository.dart';
// import 'package:new_easy_guitalele_app/src/data/shared_preferences_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final DatabaseRepository myRepository = MockDatabaseRepository();

  // final SharedPreferencesRepository sharedPrefsRepo =
  //     SharedPreferencesRepository();
  // await sharedPrefsRepo.initialize();
  // final DatabaseRepository myRepository = sharedPrefsRepo;

  runApp(EasyGuitaleleApp(myRepository));
}
