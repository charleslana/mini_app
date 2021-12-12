import 'package:flutter/material.dart';

class ThemeConstants {
  ThemeData light = ThemeData(
    fontFamily: 'ClashTitle',
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        const ColorScheme.light().copyWith(primary: const Color(0xff745bbb)),
    primaryColor: Colors.white,
    primaryColorLight: Colors.grey[600],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff745bbb),
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      labelColor: Colors.white,
    ),
  );

  ThemeData dark = ThemeData(
    fontFamily: 'ClashTitle',
    scaffoldBackgroundColor: Colors.black,
    colorScheme:
        const ColorScheme.dark().copyWith(primary: const Color(0xff745bbb)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff745bbb),
      selectedItemColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.white,
          ),
        ),
      ),
      labelColor: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: Colors.black54,
    ),
  );
}
