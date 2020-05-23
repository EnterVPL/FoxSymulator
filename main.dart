import 'dart:math';

import 'animals/Fox.dart';

void main() {
  print('Start fight!');
  Fox robert = new Fox('Robert');
  Fox marcin = new Fox('Marcin');

  bool whatFirst = (new Random()).nextBool(); //true robert, false marcin

  while (robert.isLive && marcin.isLive) {
    if(whatFirst) {
      int lost = marcin.hurt(robert);
      print('${marcin.name} lost: $lost hp!');
    } else {
      int lost = robert.hurt(marcin);
      print('${robert.name} lost: $lost hp!');
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