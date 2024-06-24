import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/constants/font_constant.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.gorditaBold,
          fontSize: 24,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.gorditaBold,
          fontSize: 24,
        ),
      ).titleLarge,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 2,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 14,
      ),
      displayLarge: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 28,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 24,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 20,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 18,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 10,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    canvasColor: Colors.grey[800],
    scaffoldBackgroundColor: Colors.grey[800],
    appBarTheme: AppBarTheme(
      color: Colors.black45,
      iconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.gorditaBold,
          fontSize: 24,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.gorditaBold,
          fontSize: 24,
        ),
      ).titleLarge,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[800],
      elevation: 2,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaRegular,
        fontSize: 14,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 12,
      ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 28,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 24,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 20,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 18,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: FontConstants.gorditaBold,
        fontSize: 10,
      ),
    ),
  );

  static List<Color> randomColorList = [
    const Color(0xFFf7968f),
    const Color(0xFFf7d68f),
    const Color(0xFFb0f78f),
    const Color(0xFF8ff7df),
    const Color(0xFFcf8ff7),
  ];
}
