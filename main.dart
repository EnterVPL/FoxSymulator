import 'animals/Animals.dart';
import 'animals/Fight.dart';
import 'animals/Fox.dart';

void main() {
  print('Start fight!');
  Fox robert = new Fox('Robert');
  Fox marcin = new Fox('Marcin');

  void printDamageMessage(int damage, Animals whoLost) {
     print('${whoLost.name} lost: $damage hp! ${whoLost.name} has ${whoLost.acctualHp} HP');
  }

  Fox winner = (Fight(marcin, robert).doFight(printDamageMessage));
  print('Winner is: ${winner.name}!! Congratulations!!!');
}