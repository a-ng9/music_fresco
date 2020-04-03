import 'package:flutter/material.dart';

class Styles {
  static Color getDarkBlueColor() {
    return Color(0xFF0F1B59);
  }

  static MaterialColor getDarkBlueMaterialColor = const MaterialColor(
    0xFF0F1B59,
    const <int, Color>{
      50: const Color(0xFF0F1B59),
      100: const Color(0xFF0F1B59),
      200: const Color(0xFF0F1B59),
      300: const Color(0xFF0F1B59),
      400: const Color(0xFF0F1B59),
      500: const Color(0xFF0F1B59),
      600: const Color(0xFF0F1B59),
      700: const Color(0xFF0F1B59),
      800: const Color(0xFF0F1B59),
      900: const Color(0xFF0F1B59),
    },
  );

  static Color getlightPurpleColor() {
    return Color(0xFF405092);
  }

  static Color getNavyBlueColor() {
    return Color(0xFF08102C);
  }

  static TextStyle getTitleStyle() {
    return TextStyle(
      color: getDarkBlueColor(),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }
}
