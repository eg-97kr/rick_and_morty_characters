import 'package:dio/dio.dart';

import 'package:rick_and_morty_characters/feature/characters/data/models/characters_page_model.dart';
import 'package:rick_and_morty_characters/feature/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_characters/feature/characters/data/sources/characters_api.dart';
import 'package:rick_and_morty_characters/feature/characters/data/sources/characters_cache.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  CharactersRepositoryImpl({
    required CharactersApi api,
    required CharactersCache cache,
  }) : _api = api,
       _cache = cache;

  final CharactersApi _api;
  final CharactersCache _cache;

  @override
  Future<CharactersPageModel> getPage(int page) async {
    try {
      final model = await _api.fetchCharactersPage(page);
      await _cache.savePage(page, model);
      return model;
    } on DioException {
      final cached = _cache.readPage(page);
      if (cached != null) return cached;
      rethrow;
    } catch (_) {
      final cached = _cache.readPage(page);
      if (cached != null) return cached;
      rethrow;
    }
  }
}
