import 'dart:io';
import 'dart:math';

import 'Game.dart';

class Handlers {

  static void talkingWithFriend() {
    Game.clearConsole();
    Game.hero.talkingWithFriend();
  }

  static void changeLocation() {
    Game.clearConsole();
    int upper = 1;
    print('Select new location');
    Game.locations.asMap().forEach((key, loc) {
      print('${key + upper}: ${loc.name}');
    });
    print('\nI will: ');
    int choiseLoc = int.tryParse(stdin.readLineSync()) ?? (-1);
    choiseLoc -= upper;
    if(Game.locations.asMap().containsKey(choiseLoc)) {
      if(Game.hero.location.name == Game.locations[choiseLoc].name) ++Game.hero.energy;
      Game.hero.changeLocation(Game.locations[choiseLoc]);
    } else {
      ++Game.hero.energy;
      print('I know.. you have stay here..');
      print('| Please press enter to continue |');
      stdin.readLineSync();
    }
  }

  static void goSleep() {
    Game.hero.energy = Game.hero.minMaxComfort.reduce(max);
    Game.save();
  }

  static void exit() {
    Game.isExit = true;
  }

  static void hunting() {
    Game.hero.hunting();
  }

}