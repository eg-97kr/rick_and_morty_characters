import 'dart:convert';

import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  FavoritesStorage(this._prefs);

  final SharedPreferences _prefs;

  static const _key = 'favorite_items';

  List<CharacterModel> readFavorites() {
    final list = _prefs.getStringList(_key) ?? [];
    final result = <CharacterModel>[];

    for (final item in list) {
      try {
        final decoded = jsonDecode(item);
        if (decoded is Map) {
          result.add(CharacterModel.fromJson(decoded.cast<String, dynamic>()));
        }
      } catch (_) {}
    }

    return result;
  }

  Future<void> writeFavorites(List<CharacterModel> items) async {
    final list = items.map((e) => jsonEncode(e.toJson())).toList();

    await _prefs.setStringList(_key, list);
  }
}
