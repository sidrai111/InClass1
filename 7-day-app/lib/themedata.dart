
import 'package:flutter/material.dart';

import 'theme.dart';

class AppTheme {
  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xff6200ee),
    onPrimary: Colors.white,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffb00020),
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
  );

  static final _darkAppColors = AppColorsExtension(
    primary: const Color(0xffbb86fc),
    onPrimary: Colors.black,
    secondary: const Color(0xff03dac6),
    onSecondary: Colors.black,
    error: const Color(0xffcf6679),
    onError: Colors.black,
    background: const Color(0xff121212),
    onBackground: Colors.white,
    surface: const Color(0xff121212),
    onSurface: Colors.white,
  );
}