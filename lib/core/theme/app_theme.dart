import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/core/theme/dark_theme.dart';
import 'package:rick_and_morty_characters/core/theme/light_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
}
