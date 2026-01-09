import 'package:rick_and_morty_characters/core/enums/favorites_sort.dart';
import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesStarted extends FavoritesEvent {
  const FavoritesStarted();
}

class FavoriteSelected extends FavoritesEvent {
  const FavoriteSelected(this.character);
  final CharacterModel character;
}

class FavoritesSortChanged extends FavoritesEvent {
  const FavoritesSortChanged(this.sort);
  final FavoritesSort sort;
}

class FavoriteRemoved extends FavoritesEvent {
  const FavoriteRemoved(this.characterId);
  final int characterId;
}
