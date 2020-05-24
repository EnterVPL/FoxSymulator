import 'animals/Animals.dart';
import 'animals/Fight.dart';
import 'animals/Fox.dart';
import 'game/Game.dart';
import 'locations/Location.dart';

void main() {
  // Fox robert = new Fox('Robert', new Location('void'));
  // Fox marcin = new Fox('Marcin', new Location('void'));

  // print('Start fight!');
  // Fox winner = Fight(marcin, robert).doFight((int damage, Animals whoLost) {
  //   if(damage == 0) {
  //     print('${whoLost.name} dodge the atack!');
  //   } else {
  //     print('${whoLost.name} lost: $damage hp! ${whoLost.name} has ${whoLost.acctualHp} HP');
  //   }
  // });
  // print('Winner is: ${winner.name}!! Congratulations!!!');
  Game game = new Game();
  while (!game.isExit) {
    game.nextTurn();
  }
}