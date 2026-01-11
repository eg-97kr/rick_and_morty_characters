import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/app/characters_app.dart';
import 'package:rick_and_morty_characters/app/di.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(getIt<SharedPreferences>())..load(),
      child: const CharactersApp(),
    ),
  );
}
