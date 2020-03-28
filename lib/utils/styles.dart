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

  static Color getOrangeColor() {
    return Color(0xFFFF7D4A);
  }

  static Color getLightBlueColor() {
    return Color(0xFFE4F0F5);
  }

  static Color getGreenColor() {
    return Color(0xFF77BF76);
  }

  static Color getRedColor() {
    return Color(0xFFF8957F);
  }

  static Color getPendingColor() {
    return Color(0xFF7FB5AC);
  }

  static Color getGreyBgColor() {
    return Color(0xFFf8f8f8);
  }

  static TextStyle getTitleStyle() {
    return TextStyle(
      color: getDarkBlueColor(),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }
}
