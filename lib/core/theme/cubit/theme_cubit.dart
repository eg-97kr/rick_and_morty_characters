import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/core/theme/cubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._prefs) : super(const ThemeState(mode: ThemeMode.system));

  final SharedPreferences _prefs;

  static const _key = 'theme_mode';

  Future<void> load() async {
    final raw = _prefs.getString(_key);
    emit(ThemeState(mode: _fromString(raw)));
  }

  Future<void> setMode(ThemeMode mode) async {
    await _prefs.setString(_key, _toString(mode));
    emit(state.copyWith(mode: mode));
  }

  Future<void> switchingTheme() async {
    final next = state.mode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setMode(next);
  }

  ThemeMode _fromString(String? raw) {
    switch (raw) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  String _toString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
