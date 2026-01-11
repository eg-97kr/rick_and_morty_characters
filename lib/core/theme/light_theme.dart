import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/core/theme/app_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.bgLight,
    cardTheme: _cardTheme,
    textTheme: _textTheme,
    iconTheme: _iconTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    appBarTheme: _appBarTheme,
    bottomNavigationBarTheme: _bottomNavBarTheme,
    popupMenuTheme: _popupMenuTheme,
  );

  static final _cardTheme = CardThemeData(
    color: AppColors.gray1Light,
    shadowColor: AppColors.bgDark,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  static final _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.bgDark,
    ),

    titleMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.gray1Dark,
    ),

    bodyMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppColors.bgDark,
    ),
  );

  static final _iconTheme = IconThemeData(
    size: 26,
    color: AppColors.grayInactDark,
  );

  static final _floatingActionButtonTheme = FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    backgroundColor: AppColors.bgDark,
    foregroundColor: AppColors.bgLight,
  );

  static final _appBarTheme = AppBarThemeData(
    backgroundColor: AppColors.bgLight,
    foregroundColor: AppColors.bgDark,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.bgDark,
    ),
    titleSpacing: 16,
    actionsIconTheme: IconThemeData(size: 30),
  );

  static final _bottomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.bgLight,
    selectedItemColor: AppColors.bgDark,
    unselectedItemColor: AppColors.gray2Light,
    selectedIconTheme: IconThemeData(size: 27),
    unselectedIconTheme: IconThemeData(size: 24),
    selectedLabelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  static final _popupMenuTheme = PopupMenuThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    color: AppColors.greyInactLight,
    labelTextStyle: WidgetStateProperty.all<TextStyle>(
      TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.bgDark,
      ),
    ),
  );
}
