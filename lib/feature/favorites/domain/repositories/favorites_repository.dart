import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';

abstract class FavoritesRepository {
  Future<List<CharacterModel>> loadFavorites();
  Future<List<CharacterModel>> selectFavorite(CharacterModel character);
  Future<List<CharacterModel>> removeFavorite(int id);
}
