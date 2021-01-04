import 'dart:io';
import 'game/Game.dart';

void main() {
  setConsiole();
  Game.initGame();
  while (!Game.isExit) {
    Game.nextTurn();
  }
}

void setConsiole() {
  if (Platform.isWindows) {
    Process.run("chcp", ["65001"]);
  }
}
