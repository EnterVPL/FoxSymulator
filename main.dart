import 'game/Game.dart';

void main() {
  Game game = new Game();
  while (!game.isExit) {
    game.nextTurn();
  }
}