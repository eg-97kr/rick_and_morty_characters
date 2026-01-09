import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';

class CharactersPageModel {
  const CharactersPageModel({required this.info, required this.results});

  final PageInfoModel info;
  final List<CharacterModel> results;

  factory CharactersPageModel.fromJson(Map<String, dynamic> json) {
    final resultsJson = (json['results'] as List<dynamic>? ?? []);

    return CharactersPageModel(
      info: PageInfoModel.fromJson(
        (json['info'] as Map<String, dynamic>?) ?? {},
      ),
      results: resultsJson
          .whereType<Map>()
          .map((e) => CharacterModel.fromJson(e.cast<String, dynamic>()))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'info': info.toJson(),
    'results': results.map((e) => e.toJson()).toList(),
  };
}

class PageInfoModel {
  const PageInfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  factory PageInfoModel.fromJson(Map<String, dynamic> json) {
    return PageInfoModel(
      count: (json['count'] as num?)?.toInt() ?? 0,
      pages: (json['pages'] as num?)?.toInt() ?? 0,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'pages': pages,
    'next': next,
    'prev': prev,
  };
}
