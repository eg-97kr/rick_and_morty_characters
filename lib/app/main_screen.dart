import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/app/di.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/screens/characters_wrapper_screen.dart';
import 'package:rick_and_morty_characters/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/screens/favorites_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const CharactersWrapperScreen(),
      const FavoritesScreen(),
    ];

    return BlocProvider<FavoritesBloc>(
      create: (context) =>
          FavoritesBloc(getIt<FavoritesRepository>())
            ..add(const FavoritesStarted()),
      child: Scaffold(
        body: IndexedStack(index: _index, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_outlined),
              label: 'Characters',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
