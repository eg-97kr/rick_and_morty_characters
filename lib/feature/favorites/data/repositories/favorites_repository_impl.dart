import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';
import 'package:rick_and_morty_characters/feature/favorites/data/sources/favorites_storage.dart';
import 'package:rick_and_morty_characters/feature/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  FavoritesRepositoryImpl(this._storage);

  final FavoritesStorage _storage;

  @override
  Future<List<CharacterModel>> loadFavorites() async {
    return _storage.readFavorites();
  }

  @override
  Future<List<CharacterModel>> selectFavorite(CharacterModel character) async {
    final list = _storage.readFavorites();

    final id = list.indexWhere((e) => e.id == character.id);

    if (id >= 0) {
      list.removeAt(id);
    } else {
      list.add(character);
    }

    await _storage.writeFavorites(list);

    return list;
  }

  @override
  Future<List<CharacterModel>> removeFavorite(int id) async {
    final list = _storage.readFavorites();
    list.removeWhere((e) => e.id == id);

    await _storage.writeFavorites(list);

    return list;
  }
}
