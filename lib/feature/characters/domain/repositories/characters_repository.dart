import 'package:rick_and_morty_characters/feature/characters/data/models/characters_page_model.dart';

abstract class CharactersRepository {
  Future<CharactersPageModel> getPage(int page);
}
