import 'dart:math';

import 'animals/Fox.dart';

void main() {
  print('Start fight!');
  Fox robert = new Fox('Robert');
  Fox marcin = new Fox('Marcin');

  bool whatFirst = (new Random()).nextBool(); //true robert, false marcin

  while (robert.isLive && marcin.isLive) {
    if(!whatFirst) {
      int damage = marcin.atack(robert);
      print('${robert.name} lost: $damage hp! ${robert.name} has ${robert.hp} HP');
    } else {
      int damage = robert.atack(marcin);
      print('${marcin.name} lost: $damage hp! ${marcin.name} has ${marcin.hp} HP');
    }
    if(!marcin.isLive) {
      print('${marcin.name} die!');
    }
    if(!robert.isLive) {
      print('${robert.name} die!');
    }
    whatFirst = !whatFirst;
  }



}