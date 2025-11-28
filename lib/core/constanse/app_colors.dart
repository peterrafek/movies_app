import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color black = Color(0xFF121312);
  static const Color white = Color(0xFFFFFFFF);

  static const MaterialColor yellow = MaterialColor(0xFFFFBB3B, <int, Color>{
    10: Color(0xFFFFE9B0),
    20: Color(0xFFFFDD8A),
    30: Color(0xFFFFD164),
    40: Color(0xFFFFC53E),
    50: Color(0xFFFFBB3B),
    0: Color(0xFFE6A634),
    60: Color(0xFFCC912E),
    70: Color(0xFFB37C27),
    80: Color(0xFF996720),
    90: Color(0xFF805218),
  });

  static const MaterialColor darkGray = MaterialColor(0xFF282A28, <int, Color>{
    10: Color(0xFF3A3C3A),
    20: Color(0xFF343634),
    30: Color(0xFF2E302E),
    40: Color(0xFF282A28),
    50: Color(0xFF222422),
    0: Color(0xFF1C1E1C),
    60: Color(0xFF161816),
    70: Color(0xFF101210),
    80: Color(0xFF0A0C0A),
    90: Color(0xFF040604),
  });

  static const MaterialColor green = MaterialColor(0xFF57AA53, <int, Color>{
    10: Color(0xFFE3F4E2),
    20: Color(0xFFC8E9C6),
    30: Color(0xFFACDDAB),
    40: Color(0xFF90D290),
    50: Color(0xFF74C775),
    0: Color(0xFF57AA53),
    60: Color(0xFF4C9649),
    70: Color(0xFF428340),
    80: Color(0xFF377036),
    90: Color(0xFF2C5D2D),
  });

  static const MaterialColor red = MaterialColor(0xFFE82626, <int, Color>{
    10: Color(0xFFFFE2E2),
    20: Color(0xFFFFB8B8),
    30: Color(0xFFFF8E8E),
    40: Color(0xFFFF6464),
    50: Color(0xFFFF3A3A),
    0: Color(0xFFE82626),
    60: Color(0xFFCC2222),
    70: Color(0xFFB11E1E),
    80: Color(0xFF961A1A),
    90: Color(0xFF7A1515),
  });
}
