import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/core/theme/app_colors.dart';

class DarkTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgDark,
    cardTheme: _cardTheme,
    textTheme: _textTheme,
    iconTheme: _iconTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavBarTheme,
    popupMenuTheme: _popupMenuTheme,
  );

  static final _cardTheme = CardThemeData(
    color: AppColors.grayInactDark,
    shadowColor: Colors.white,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  static final _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.bgLight,
    ),

    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.gray2Light,
    ),

    bodyMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.bgLight,
    ),
  );

  static final _iconTheme = IconThemeData(size: 26, color: AppColors.bgLight);

  static final _floatingActionButtonTheme = FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    backgroundColor: AppColors.bgLight,
    foregroundColor: AppColors.bgDark,
  );

  static final _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.bgDark,
    foregroundColor: AppColors.bgLight,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.bgLight,
    ),
    titleSpacing: 16,
    actionsIconTheme: IconThemeData(size: 30),
  );

  static final _bottomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.bgDark,
    selectedItemColor: AppColors.bgLight,
    unselectedItemColor: AppColors.gray2Light,
    selectedIconTheme: IconThemeData(size: 27),
    unselectedIconTheme: IconThemeData(size: 24),
    selectedLabelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  static final _popupMenuTheme = PopupMenuThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: AppColors.gray1Dark,
    labelTextStyle: WidgetStateProperty.all<TextStyle>(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.bgLight,
      ),
    ),
  );
}
