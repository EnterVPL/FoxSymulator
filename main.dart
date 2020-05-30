import 'game/Game.dart';

void main() {
  Game.initGame();
  while (!Game.isExit) {
    Game.nextTurn();
  }
}