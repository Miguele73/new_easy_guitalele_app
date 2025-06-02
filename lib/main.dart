import 'package:flutter/material.dart';
import 'package:new_easy_guitalele_app/src/easy_guitalele_app.dart';
import 'package:new_easy_guitalele_app/src/data/database_repository.dart';
import 'package:new_easy_guitalele_app/src/data/mock_database_repository.dart';

void main() {
  final DatabaseRepository myRepository = MockDatabaseRepository();
  runApp(EasyGuitaleleApp(myRepository));
}
