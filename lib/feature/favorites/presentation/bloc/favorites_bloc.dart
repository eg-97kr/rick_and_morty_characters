import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/enums/favorites_sort.dart';
import 'package:rick_and_morty_characters/feature/characters/data/models/character_model.dart';
import 'package:rick_and_morty_characters/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_event.dart';
import 'package:rick_and_morty_characters/feature/favorites/presentation/bloc/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc(this._repository) : super(FavoritesState.initial()) {
    on<FavoritesStarted>(_onStarted);
    on<FavoriteSelected>(_onSelected);
    on<FavoritesSortChanged>(_onSortChanged);
    on<FavoriteRemoved>(_onRemoved);
  }

  final FavoritesRepository _repository;

  Set<int> _toIds(List<CharacterModel> items) => items.map((e) => e.id).toSet();

  List<CharacterModel> _sorted(
    List<CharacterModel> baseItems,
    FavoritesSort sort,
  ) {
    if (sort == FavoritesSort.defaultSort) return [...baseItems];

    final list = [...baseItems];

    switch (sort) {
      case FavoritesSort.nameSort:
        list.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        break;
      case FavoritesSort.statusSort:
        list.sort(
          (a, b) => a.status.toLowerCase().compareTo(b.status.toLowerCase()),
        );
        break;
      case FavoritesSort.defaultSort:
        break;
    }
    return list;
  }

  Future<void> _onStarted(
    FavoritesStarted event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final baseItems = await _repository.loadFavorites();
      final sortedItems = _sorted(baseItems, state.sort);
      emit(
        state.copyWith(
          isLoading: false,
          baseItems: baseItems,
          sortedItems: sortedItems,
          favoriteIds: _toIds(baseItems),
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> _onSelected(
    FavoriteSelected event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      final baseItems = await _repository.selectFavorite(event.character);
      final sortedItems = _sorted(baseItems, state.sort);
      emit(
        state.copyWith(
          baseItems: baseItems,
          sortedItems: sortedItems,
          favoriteIds: _toIds(baseItems),
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onSortChanged(
    FavoritesSortChanged event,
    Emitter<FavoritesState> emit,
  ) {
    final items = _sorted(state.baseItems, event.sort);
    emit(state.copyWith(sort: event.sort, sortedItems: items));
  }

  Future<void> _onRemoved(
    FavoriteRemoved event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      final baseItems = await _repository.removeFavorite(event.characterId);
      final sortedItems = _sorted(baseItems, state.sort);
      emit(
        state.copyWith(
          baseItems: baseItems,
          sortedItems: sortedItems,
          favoriteIds: _toIds(baseItems),
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
