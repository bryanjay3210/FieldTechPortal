import 'package:flutter/material.dart';
import 'global_colors.dart';

class GlobalTheme {
  static ThemeData darkTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      // scaff
      cardColor: ftGreyDark100,
      backgroundColor: ftGreyDark100,
      scaffoldBackgroundColor: ftBlackBackground,
      primaryTextTheme: const TextTheme(
        labelSmall: TextStyle(color: ftWhite),
      ),
      // inputDecorationTheme: const InputDecorationTheme(fillColor: ftGreyDark),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: ftBlackContainer,
      )),
    );
  }

  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: ftWhite,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
        backgroundColor: ftDashboardMenuBtnColor,
      )),
      // bottom
      cardColor: ftWhite,
      backgroundColor: ftWhite,
      primaryTextTheme:
          const TextTheme(labelSmall: TextStyle(color: ftTextBlack)),
    );
  }
}
