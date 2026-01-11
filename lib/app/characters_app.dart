import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/app/main_screen.dart';
import 'package:rick_and_morty_characters/core/theme/app_theme.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_cubit.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_state.dart';

class CharactersApp extends StatelessWidget {
  const CharactersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Rick & Morty',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.mode,
          home: const MainScreen(),
        );
      },
    );
  }
}
