import 'dart:io';

import 'package:dart_console/dart_console.dart';

import '../animals/Animals.dart';
import '../animals/Fox.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import '../locations/Location.dart';
import '../locations/LocationList.dart';
import 'Actions.dart';
import 'Color.dart';
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

  static int stepCounter = 0;

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
          if (animal == null) continue;
          newLoc.addAnimal((Animals()).create(
              animal['name'],
              animal['maxHp'],
              animal['speed'],
              animal['strengh'],
              animal['defence'],
              animal['drop']["items"],
              animal["drop"]["exp"]));
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
    final console = Console();
    console.clearScreen();
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
      changeLanguage(isStart: true);
      hero.energy--;
      clearConsole();
      print(
          '${Language.getTranslation(LanguagesTypes.ACTIONS, "{Enter your fox name}")}: ');
      String name = stdin.readLineSync();
      hero.name = name;
      hero.changeLocation(locations.firstWhere((loc) => loc.name == '{home}'));
    }
  }

  /// Printing statistic
  static void printStats() {
    int maxComfort = hero.comfort;
    String name = '${fastStatsTranslate("{name}")}: ${hero.name}';
    String location = '${fastStatsTranslate("{location}")}: ${hero.location}';
    String acctualHpString = "${hero.acctualHp}";
    if (hero.acctualHp <= hero.maxHp / 2 && hero.acctualHp > hero.maxHp / 5) {
      acctualHpString = Color.yellowBold(acctualHpString);
    } else if (hero.acctualHp <= 3) {
      acctualHpString = Color.redBold(acctualHpString);
    }
    String hp =
        '${fastStatsTranslate("{HP}")}: ${acctualHpString}/${hero.maxHp}';
    String strengh = '${fastStatsTranslate("{strengh}")}: ${hero.strengh}';
    String defence = '${fastStatsTranslate("{defence}")}: ${hero.defence}';
    String speed = '${fastStatsTranslate("{speed}")}: ${hero.speed}';
    String satietyString = "${hero.satiety}";
    if (hero.satiety <= 5 && hero.satiety > 3) {
      satietyString = Color.yellowBold(satietyString);
    } else if (hero.satiety <= 3) {
      satietyString = Color.redBold(satietyString);
    }
    String satiety =
        '${fastStatsTranslate("{satiety}")}: ${satietyString}/$maxComfort';
    String energyString = "${hero.energy}";
    if (hero.energy <= 5 && hero.energy > 3) {
      energyString = Color.yellowBold(energyString);
    } else if (hero.energy <= 3) {
      energyString = Color.redBold(energyString);
    }
    String energy =
        '${fastStatsTranslate("{energy}")}: ${energyString}/$maxComfort';

    String lvl = fastStatsTranslate("{level}") + ": ${hero.lvl}";
    String exp = fastStatsTranslate("{experience}") + ": ${hero.exp}";
    String skill_points = fastStatsTranslate("{skill points}") +
        ((hero.skill_points > 0
            ? ": ${Color.cyanBold('${hero.skill_points}')}"
            : ": ${hero.skill_points}"));
    String nextlvl = "${hero.nextLvl}";

    print('$name \t $location \t');
    print('$lvl \t $exp/$nextlvl');
    print('$skill_points');
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
      ++stepCounter;
      if (stepCounter % 2 == 0) {
        --hero.satiety;
      }
      if (hero.energy > 0 ||
          hero.location.actions[choise].handlerName == "goSleep") {
        Handlers.call(hero.location.actions[choise].handlerName);
      } else if (hero.energy <= 0) {
        Handlers.call('game_over_energy');
      }
      if (hero.satiety <= 0) {
        Handlers.call('game_over_satiety');
      } else if (hero.acctualHp <= 0) {
        Handlers.call('game_over_hp');
      }
    }
  }

  /// Saving game
  static save() {
    String data = hero.toString();
    File(saveFilePath).writeAsStringSync(data);
    String bag = hero.getBagToSave();
    File(saveBagPath).writeAsStringSync(bag);
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
      hero.loadBagFromJson(bag);
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
      String title, List optionsList, var handler, var handlerMistake,
      {bool isPirntStats: false}) {
    clearConsole();
    if (isPirntStats) {
      printStats();
    }
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

  static void changeLanguage({bool isStart: false}) {
    String _title = (!isStart
        ? Language.getTranslation(LanguagesTypes.OPTIONS, '{change language}')
        : Language.getTranslation(LanguagesTypes.OPTIONS, '{set language}'));
    printOptions(_title, Language.getActive(), (choise) {
      Language.currentLang = Language.getActive()[choise].name;
      String data = Language.currentLang;
      File(currnetLangPath).writeAsStringSync(data);
    }, (choise) {
      print(
          '| ${Language.getTranslation(LanguagesTypes.OPTIONS, '{incorrect choise}')} |');
      stdin.readLineSync();
    });

    ++Game.hero.energy;
    --Game.stepCounter;
  }
}
