import 'dart:core';

class Color {
  static String get _start {
    return "\x1b[{color}m";
  }

  static String get _end {
    return "\x1b[0m";
  }

  static String cyan(String text) {
    return _start.replaceAll("{color}", "36") + text + _end;
  }

  static String cyanBold(String text) {
    return _start.replaceAll("{color}", "36;1") + text + _end;
  }
}
