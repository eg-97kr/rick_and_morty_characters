import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/app/di.dart';
import 'package:rick_and_morty_characters/feature/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/screens/characters_screen.dart';

class CharactersWrapperScreen extends StatelessWidget {
  const CharactersWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersBloc>(
      create: (context) =>
          CharactersBloc(getIt<CharactersRepository>())
            ..add(CharactersStarted()),
      child: CharactersScreen(),
    );
  }
}
