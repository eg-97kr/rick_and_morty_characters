import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/app/characters_app.dart';
import 'package:rick_and_morty_characters/app/di.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const CharactersApp());
}
