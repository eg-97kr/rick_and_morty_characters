import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty_characters/feature/characters/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_characters/feature/characters/presentation/bloc/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc(this._repository) : super(CharactersState.initial()) {
    on<CharactersStarted>(_onStarted);
    on<CharactersLoadNextPage>(_onLoadNextPage);
    on<CharactersRefreshed>(_onRefreshed);
  }

  final CharactersRepository _repository;

  bool _inFlight = false;

  Future<void> _onStarted(
    CharactersStarted event,
    Emitter<CharactersState> emit,
  ) async {
    if (_inFlight) return;
    _inFlight = true;

    emit(
      state.copyWith(
        isInitialLoading: true,
        isPageLoading: false,
        errorMessage: null,
        page: 1,
        hasNextPage: true,
        items: const [],
      ),
    );

    try {
      final model = await _repository.getPage(1);
      emit(
        state.copyWith(
          items: model.results,
          page: 1,
          hasNextPage: model.info.next != null,
          isInitialLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isInitialLoading: false, errorMessage: e.toString()));
    } finally {
      _inFlight = false;
    }
  }

  Future<void> _onLoadNextPage(
    CharactersLoadNextPage event,
    Emitter<CharactersState> emit,
  ) async {
    if (_inFlight) return;
    if (state.isInitialLoading || state.isPageLoading) return;
    if (!state.hasNextPage) return;

    _inFlight = true;

    final nextPage = state.page + 1;
    emit(state.copyWith(isPageLoading: true, errorMessage: null));

    try {
      final model = await _repository.getPage(nextPage);

      final existingIds = state.items.map((e) => e.id).toSet();
      final newItems = model.results
          .where((c) => !existingIds.contains(c.id))
          .toList();

      emit(
        state.copyWith(
          items: [...state.items, ...newItems],
          page: nextPage,
          hasNextPage: model.info.next != null,
          isPageLoading: false,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isPageLoading: false, errorMessage: e.toString()));
    } finally {
      _inFlight = false;
    }
  }

  Future<void> _onRefreshed(
    CharactersRefreshed event,
    Emitter<CharactersState> emit,
  ) async {
    add(const CharactersStarted());
  }
}
