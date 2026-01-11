import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_cubit.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_state.dart';

import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_state.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/widgets/character_card.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/widgets/loading_card.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_state.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >
        _controller.position.maxScrollExtent - 300) {
      context.read<CharactersBloc>().add(const CharactersLoadNextPage());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _controller,
            slivers: [
              if (state.isInitialLoading)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, _) => const LoadingCard(),
                    childCount: 6,
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, index) {
                    final item = state.items[index];
                    return CharacterCard(
                      image: item.image,
                      name: item.name,
                      status: item.status,
                      gender: item.gender,
                      favoriteButton:
                          BlocSelector<FavoritesBloc, FavoritesState, bool>(
                            selector: (state) =>
                                state.favoriteIds.contains(item.id),
                            builder: (context, isFavorite) => IconButton(
                              onPressed: () => context
                                  .read<FavoritesBloc>()
                                  .add(FavoriteSelected(item)),
                              icon: Icon(
                                isFavorite ? Icons.star : Icons.star_border,
                                color: isFavorite ? Colors.amber : null,
                              ),
                            ),
                          ),
                    );
                  }, childCount: state.items.length),
                ),

              if (state.isPageLoading)
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      SizedBox(height: 8),
                      LoadingCard(),
                      LoadingCard(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: BlocSelector<ThemeCubit, ThemeState, ThemeMode>(
        selector: (state) => state.mode,
        builder: (context, mode) {
          return FloatingActionButton(
            onPressed: () => context.read<ThemeCubit>().switchingTheme(),
            child: Icon(
              mode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
            ),
          );
        },
      ),
    );
  }
}
