import 'package:flutter/material.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';

class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.blackColor,
    secondaryHeaderColor: ColorManager.darkGreyColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: ColorManager.blackColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorManager.whiteColor,
    secondaryHeaderColor: ColorManager.lightGreyColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: ColorManager.whiteColor,
    ),
  );
}
