import 'package:rick_and_morty_characters/core/enums/favorites_sort.dart';
import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';

class FavoritesState {
  const FavoritesState({
    required this.baseItems,
    required this.sortedItems,
    required this.favoriteIds,
    required this.sort,
    required this.isLoading,
    this.errorMessage,
  });

  final List<CharacterModel> baseItems;
  final List<CharacterModel> sortedItems;
  final Set<int> favoriteIds;
  final FavoritesSort sort;
  final bool isLoading;
  final String? errorMessage;

  factory FavoritesState.initial() {
    return const FavoritesState(
      baseItems: [],
      sortedItems: [],
      favoriteIds: <int>{},
      sort: FavoritesSort.defaultSort,
      isLoading: false,
      errorMessage: null,
    );
  }

  FavoritesState copyWith({
    List<CharacterModel>? baseItems,
    List<CharacterModel>? sortedItems,
    Set<int>? favoriteIds,
    FavoritesSort? sort,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FavoritesState(
      baseItems: baseItems ?? this.baseItems,
      sortedItems: sortedItems ?? this.sortedItems,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      sort: sort ?? this.sort,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
