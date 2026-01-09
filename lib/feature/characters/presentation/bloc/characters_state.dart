import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';

class CharactersState {
  const CharactersState({
    required this.items,
    required this.page,
    required this.hasNextPage,
    required this.isInitialLoading,
    required this.isPageLoading,
    this.errorMessage,
  });

  final List<CharacterModel> items;
  final int page;
  final bool hasNextPage;
  final bool isInitialLoading;
  final bool isPageLoading;
  final String? errorMessage;

  factory CharactersState.initial() {
    return const CharactersState(
      items: [],
      page: 1,
      hasNextPage: true,
      isInitialLoading: false,
      isPageLoading: false,
      errorMessage: null,
    );
  }

  CharactersState copyWith({
    List<CharacterModel>? items,
    int? page,
    bool? hasNextPage,
    bool? isInitialLoading,
    bool? isPageLoading,
    String? errorMessage,
  }) {
    return CharactersState(
      items: items ?? this.items,
      page: page ?? this.page,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isInitialLoading: isInitialLoading ?? this.isInitialLoading,
      isPageLoading: isPageLoading ?? this.isPageLoading,
      errorMessage: errorMessage,
    );
  }
}
