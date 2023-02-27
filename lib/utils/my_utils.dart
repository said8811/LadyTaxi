import 'dart:ui';

class MyColors {
  static Color C_FD0166 = const Color(0xFFFD0166);
  static Color C_FE2E81 = const Color(0xFFFE2E81);
  static Color C_FFB7D4 = const Color(0xFFFFB7D4);
  static Color C_460000 = const Color(0xFF460000);
  static Color C_C1C0C9 = const Color(0xFFC1C0C9);
}

class MyTimer {
  static getMyTimer(int second) {
    if (second % 60 < 10) {
      return "${second ~/ 60}:0${second % 60}";
    } else {
      return "${second ~/ 60}:${second % 60}";
    }
  }
}
