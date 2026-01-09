import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/enums/favorites_sort.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/widgets/character_card.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          BlocSelector<FavoritesBloc, FavoritesState, FavoritesSort>(
            selector: (state) => state.sort,
            builder: (context, sort) => PopupMenuButton<FavoritesSort>(
              initialValue: sort,
              onSelected: (sort) =>
                  context.read<FavoritesBloc>().add(FavoritesSortChanged(sort)),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: FavoritesSort.nameSort,
                  child: Text('By name'),
                ),
                PopupMenuItem(
                  value: FavoritesSort.statusSort,
                  child: Text('By status'),
                ),
                PopupMenuItem(
                  value: FavoritesSort.defaultSort,
                  child: Text('By default'),
                ),
              ],
              icon: const Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.sortedItems.isEmpty) {
            return const Center(child: Text('No favorites yet'));
          }

          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = state.sortedItems[index];

                  return Dismissible(
                    key: ValueKey('favorites_${item.id}'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) {
                      context.read<FavoritesBloc>().add(
                        FavoriteRemoved(item.id),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} removed from favorites'),
                        ),
                      );
                    },
                    child: CharacterCard(
                      image: item.image,
                      name: item.name,
                      status: item.status,
                      gender: item.gender,
                      favoriteButton: IconButton(
                        icon: const Icon(Icons.star),
                        onPressed: () => context.read<FavoritesBloc>().add(
                          FavoriteRemoved(item.id),
                        ),
                      ),
                    ),
                  );
                }, childCount: state.sortedItems.length),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          );
        },
      ),
    );
  }
}
