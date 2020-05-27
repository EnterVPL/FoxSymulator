import 'animals/Animals.dart';
import 'animals/Fight.dart';
import 'animals/Fox.dart';
import 'game/Game.dart';
import 'locations/Location.dart';

void main() {
  Game game = new Game();
  while (!game.isExit) {
    game.nextTurn();
  }
}