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

  static String redBold(String text) {
    return _start.replaceAll("{color}", "31;1") + text + _end;
  }

  static String yellow(String text) {
    return _start.replaceAll("{color}", "33") + text + _end;
  }

  static String yellowBold(String text) {
    return _start.replaceAll("{color}", "33;1") + text + _end;
  }

  static String greenBold(String text) {
    return _start.replaceAll("{color}", "32;1") + text + _end;
  }
}
