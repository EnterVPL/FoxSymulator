import 'dart:io';
import 'dart:math';

import '../inventory/BagMenu.dart';
import '../inventory/WarehouseMenu.dart';
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
    'game_over': gameOver,
    'gotoHome': gotoHome,
    'warehouseInventory': warehouseInventory,
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
    Game.hero.energy = Game.hero.minMaxComfort.reduce(max);
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

  static void gameOver() {
    Game.clearConsole();
    print(
        Language.getTranslation(LanguagesTypes.OPTIONS, "{game_over_energy}"));
    stdin.readLineSync();
    Game.isExit = true;
  }

  static void gotoHome() {
    Game.clearConsole();
    Game.hero.changeLocation(Game.locations[0]);
  }

  static void warehouseInventory() {
    WarehouseMenu.show(restart: true);
  }

  static void bagInventory() {
    BagMenu.show(restart: true);
  }
}
