import 'dart:convert';

import 'package:rick_and_morty_characters/feature/characters/data/models/characters_page_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharactersCache {
  const CharactersCache(this._prefs);

  final SharedPreferences _prefs;

  static String _pageKey(int page) => 'characters_page_$page';

  Future<void> savePage(int page, CharactersPageModel model) async {
    final jsonString = jsonEncode(model.toJson());
    await _prefs.setString(_pageKey(page), jsonString);
  }

  CharactersPageModel? readPage(int page) {
    final jsonString = _prefs.getString(_pageKey(page));
    if (jsonString == null) return null;

    final decoded = jsonDecode(jsonString);
    if (decoded is! Map) return null;

    return CharactersPageModel.fromJson(decoded.cast<String, dynamic>());
  }
}
