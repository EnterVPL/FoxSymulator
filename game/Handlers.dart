import 'dart:io';

import '../inventory/BagMenu.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';

import 'Game.dart';

/// Handlers for actions in /locations/LocationsList.dart
class Handlers {
  static Map<String, Function> callerMap = {
    'talkingWithFriend': talkingWithFriend,
    'changeLocation': changeLocation,
    'goSleep': goSleep,
    'exit': exit,
    'hunting': hunting,
    'changeLanguage': changeLanguage,
    'game_over_energy': gameOverEnergy,
    'game_over_satiety': gameOverSatiety,
    'game_over_hp': gameOverHP,
    'gotoHome': gotoHome,
    'bagInventory': bagInventory
  };

  /// Run method using method [name]
  ///
  /// Returned 'true' if method is exists or 'false' if method is not exists
  static bool call(String name) {
    if (callerMap.containsKey(name)) {
      callerMap[name]();
      return true;
    } else {
      return false;
    }
  }

  /// Talking with hero friend
  static void talkingWithFriend() {
    Game.clearConsole();
    Game.hero.talkingWithFriend();
  }

  /// Open change location menu
  static void changeLocation() {
    Game.clearConsole();
    int upper = 1;
    print(
        Language.getTranslation(LanguagesTypes.LOCATIONS, "{select location}"));
    Game.locations.asMap().forEach((key, loc) {
      print('${key + upper}: ${loc}');
    });
    print(
        '\n${Language.getTranslation(LanguagesTypes.OPTIONS, "{I prefer}")}: ');
    int choiseLoc = int.tryParse(stdin.readLineSync()) ?? (-1);
    choiseLoc -= upper;
    if (Game.locations.asMap().containsKey(choiseLoc)) {
      if (Game.hero.location.name == Game.locations[choiseLoc].name)
        ++Game.hero.energy;
      Game.hero.changeLocation(Game.locations[choiseLoc]);
    } else {
      ++Game.hero.energy;
      print(Language.getTranslation(
          LanguagesTypes.LOCATIONS, "{I know.. you have stay here..}"));
      print(Language.getTranslation(
          LanguagesTypes.OPTIONS, "{enter to continue}"));
      stdin.readLineSync();
    }
  }

  /// Go sleep and save the game
  static void goSleep() {
    Game.hero.energy = Game.hero.comfort;
    Game.hero.acctualHp += 3;
    if (Game.hero.acctualHp > Game.hero.maxHp) {
      Game.hero.acctualHp = Game.hero.maxHp;
    }
    Game.save();
  }

  /// Set exit flag on 'true'
  static void exit() {
    Game.isExit = true;
  }

  /// Open hunting menu
  static void hunting() {
    Game.hero.hunting();
  }

  static void changeLanguage() {
    Game.changeLanguage();
  }

  static void gameOverEnergy() {
    Game.clearConsole();
    print(
        Language.getTranslation(LanguagesTypes.OPTIONS, "{game_over_energy}"));
    stdin.readLineSync();
    Game.isExit = true;
  }

  static void gameOverSatiety() {
    Game.clearConsole();
    print(
        Language.getTranslation(LanguagesTypes.OPTIONS, "{game_over_satiety}"));
    stdin.readLineSync();
    Game.isExit = true;
  }

  static void gameOverHP() {
    Game.clearConsole();
    print(Language.getTranslation(LanguagesTypes.OPTIONS, "{game_over_hp}"));
    stdin.readLineSync();
    Game.isExit = true;
  }

  static void gotoHome() {
    Game.clearConsole();
    Game.hero.changeLocation(Game.locations[0]);
  }

  static void bagInventory() {
    BagMenu.show(restart: true);
  }
}
