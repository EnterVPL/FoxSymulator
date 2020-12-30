import 'dart:io';
import 'dart:math';

import '../animals/Animals.dart';
import '../animals/Fox.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import '../locations/Location.dart';
import '../locations/LocationList.dart';
import 'Actions.dart';
import 'Handlers.dart';

/// Main game class
class Game {
  /// List of locations
  static List<Location> locations;

  /// If 'true' then this game is closing
  static bool isExit = false;

  /// Hero object
  static Fox hero;

  /// Path to save
  static String saveFilePath = './your.foxy';
  static String saveBagPath = './bag.foxy';
  static String saveWorehousePath = './worehouse.foxy';

  static String currnetLangPath = './lang.foxy';

  Game() {
    initGame();
  }

  /// Game initialization
  ///
  /// Created hero object and initialize whole locations
  static void initGame() {
    Language.loadTranslations();
    if (File(currnetLangPath).existsSync()) {
      String lang = File(currnetLangPath).readAsStringSync();
      List<ActiveLanguage> activeLangs = Language.getActive();
      Iterable<ActiveLanguage> contain =
          activeLangs.where((element) => element.name == lang);
      if (contain.isNotEmpty) {
        Language.currentLang = lang;
      }
    }
    hero = new Fox('', Location('Void'));
    locations = initLocations();
  }

  /// Initialize locations
  static List<Location> initLocations() {
    List<Location> locs = new List<Location>();
    dynamic locationList = LocationList.getJsonLocationList();
    for (var loc in locationList) {
      Location newLoc = new Location(loc['name']);
      if (loc['animals'] != null) {
        for (var animal in loc['animals']) {
          if (animal['howMany'] != null) {
            for (int i = 1; i <= animal['howMany']; i++) {
              newLoc.addAnimal((Animals()).create(
                  animal['name'],
                  animal['maxHp'],
                  animal['speed'],
                  animal['strengh'],
                  animal['defence']));
            }
          } else {
            newLoc.addAnimal((Animals()).create(animal['name'], animal['maxHp'],
                animal['speed'], animal['strengh'], animal['defence']));
          }
        }
      }
      for (var act in loc['actions']) {
        newLoc.addAction(new Actions(act['name'], act['handlerName']));
      }
      locs.add(newLoc);
    }

    return locs;
  }

  /// Universal method to clear console for Windows and Linux
  static void clearConsole() {
    print("\x1B[2J\x1B[0;0H");
  }

  static String text_bold(String text) {
    return "\x1b[1m${text}\x1b[0m";
  }

  /// Checking game is continued.
  /// If game is not continuing (if it is first run or normal run) then the game is running 'startGame()' method
  static void nextTurn() {
    if (hero.name != '') {
      printStats();
      doChoise(printActions());
    } else {
      startGame();
    }
    clearConsole();
  }

  /// Checking it is posible load game. If it is posible then load game else running making character
  static void startGame() {
    if (load()) {
      hero.changeLocation(locations.firstWhere((loc) => loc.name == '{home}'));
    } else {
      print(
          '${Language.getTranslation(LanguagesTypes.ACTIONS, "{Enter your fox name}")}: ');
      String name = stdin.readLineSync();
      hero.name = name;
      hero.changeLocation(locations.firstWhere((loc) => loc.name == '{home}'));
    }
  }

  /// Printing statistic
  static void printStats() {
    int maxComfort = hero.minMaxComfort.reduce(max);
    String name = '${fastStatsTranslate("{name}")}: ${hero.name}';
    String location = '${fastStatsTranslate("{location}")}: ${hero.location}';
    String hp =
        '${fastStatsTranslate("{HP}")}: ${hero.acctualHp}/${hero.maxHp}';
    String strengh = '${fastStatsTranslate("{strengh}")}: ${hero.strengh}';
    String defence = '${fastStatsTranslate("{defence}")}: ${hero.defence}';
    String speed = '${fastStatsTranslate("{speed}")}: ${hero.speed}';
    String satiety =
        '${fastStatsTranslate("{satiety}")}: ${hero.satiety}/$maxComfort';
    String energy =
        '${fastStatsTranslate("{energy}")}: ${hero.energy}/$maxComfort';

    print('$name \t $location');
    print('$hp \t $strengh \t $defence \t $speed');
    print('$satiety \t $energy');
    print('\n');
  }

  static String fastStatsTranslate(key) {
    return Language.getTranslation(LanguagesTypes.STATS, key);
  }

  /// Printing possible actions from current location
  static int printActions() {
    print(Language.getTranslation(
        LanguagesTypes.ACTIONS, '{Enter number of action}'));
    int upper = 1;
    hero.location.actions.asMap().forEach((index, action) {
      print(
          '${index + upper}: ${Language.getTranslation(LanguagesTypes.ACTIONS, action.name)}');
    });
    print(
        '\n${Language.getTranslation(LanguagesTypes.OPTIONS, "{I prefer}")}: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? (-1);
    return choise - upper;
  }

  /// Do choise from number of action. List of possible actions is located in /game/Handlers
  static doChoise(int choise) {
    if (hero.location.actions.asMap().containsKey(choise)) {
      --hero.energy;
      if (hero.energy > 0 ||
          hero.location.actions[choise].handlerName == "goSleep") {
        Handlers.call(hero.location.actions[choise].handlerName);
      } else if (hero.energy <= 0) {
        Handlers.call('game_over');
      }
    }
  }

  /// Saving game
  static save() {
    String data = hero.toString();
    File(saveFilePath).writeAsStringSync(data);
    String bag = hero.getBagToSave();
    File(saveBagPath).writeAsStringSync(bag);
    String worehouse = hero.getWarehouseToSave();
    File(saveWorehousePath).writeAsStringSync(worehouse);
    clearConsole();
    print(Language.getTranslation(LanguagesTypes.OPTIONS, "{Game was saved}"));
    print(
        Language.getTranslation(LanguagesTypes.OPTIONS, "{enter to continue}"));
    stdin.readLineSync();
  }

  /// Loading game from save
  static bool load() {
    if (File(saveFilePath).existsSync()) {
      String data = File(saveFilePath).readAsStringSync();
      hero = Fox.loadFromString(data);
      String bag = File(saveBagPath).readAsStringSync();
      String worehouse = File(saveWorehousePath).readAsStringSync();
      hero.loadBagFromJson(bag);
      hero.loadWorehouseFromJson(worehouse);
      return true;
    } else {
      return false;
    }
  }

  /// Printing specific options. Use the [optionsList] for printing that options.
  ///
  /// [handler] is using if option is use
  ///
  /// [handlerMistake] is using if number of choise is not recognized
  static void printOptions(
      String title, List optionsList, var handler, var handlerMistake) {
    clearConsole();
    int upper = 1;
    print(title);
    optionsList.asMap().forEach((key, val) {
      print('${key + upper}: ${val.name}');
    });
    print(
        '\n${Language.getTranslation(LanguagesTypes.OPTIONS, "{I prefer}")}: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? (-1);
    choise -= upper;
    if (optionsList.asMap().containsKey(choise)) {
      handler(choise);
    } else {
      handlerMistake(choise);
    }
  }

  static void changeLanguage() {
    printOptions(
        Language.getTranslation(LanguagesTypes.OPTIONS, '{change language}'),
        Language.getActive(), (choise) {
      Language.currentLang = Language.getActive()[choise].name;
      String data = Language.currentLang;
      File(currnetLangPath).writeAsStringSync(data);
    }, (choise) {
      print(
          '| ${Language.getTranslation(LanguagesTypes.OPTIONS, '{incorrect choise}')} |');
      stdin.readLineSync();
    });

    ++Game.hero.energy;
  }
}
