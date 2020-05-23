import 'animals/Animals.dart';
import 'animals/Fight.dart';
import 'animals/Fox.dart';

void main() {
  Fox robert = new Fox('Robert');
  Fox marcin = new Fox('Marcin');

  print('Start fight!');
  Fox winner = Fight(marcin, robert).doFight((int damage, Animals whoLost) {
    if(damage == 0) {
      print('${whoLost.name} dodge the atack!');
    } else {
      print('${whoLost.name} lost: $damage hp! ${whoLost.name} has ${whoLost.acctualHp} HP');
    }
  });
  print('Winner is: ${winner.name}!! Congratulations!!!');
}