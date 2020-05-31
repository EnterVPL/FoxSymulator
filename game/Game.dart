import 'dart:io';
import 'dart:math';
import 'dart:mirrors';


import '../animals/Animals.dart';
import '../animals/Fox.dart';
import '../locations/Location.dart';
import '../locations/LocationList.dart';
import 'Actions.dart';
import 'Handlers.dart';

class Game 
{
  static List<Location> locations;

  static bool isExit = false;
  static Fox hero;

  static String saveFilePath = './your.foxy';

  Game() {
    initGame();
  }

  static void initGame() {
    hero = new Fox('', Location('Void'));
    locations = initLocations();
  }

  static List<Location> initLocations() {
    List<Location> locs = new List<Location>();
    dynamic locationList = LocationList.getJsonLocationList();
    for(var loc in locationList) {
      Location newLoc = new Location(loc['name']);
      if(loc['animals'] != null) {
        for (var animal in loc['animals']) {
          if(animal['howMany'] != null) {
            for(int i = 1; i <= animal['howMany']; i++) {
              newLoc.addAnimal((Animals()).create(animal['name'], animal['maxHp'], animal['speed'], animal['strengh'], animal['defence']));
            }
          } else {
            newLoc.addAnimal((Animals()).create(animal['name'], animal['maxHp'], animal['speed'], animal['strengh'], animal['defence']));
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

  static void clearConsole() {
    print("\x1B[2J\x1B[0;0H"); 
  }

  static void nextTurn() {
    if(hero.name != '') {
      printStats();
      doChoise(printActions());
    } else {
      startGame();
    }
    clearConsole();
  }

  static void startGame() {
      if(load()) {
        hero.changeLocation(locations.firstWhere((loc) => loc.name == 'Home'));
      } else {
        print('Enter your fox name: ');
        String name = stdin.readLineSync();
        hero.name = name;
        hero.changeLocation(locations.firstWhere((loc) => loc.name == 'Home')); 
      }
  }

  static void printStats() {
      print('Name: ${hero.name} \t Location: ${hero.location.name}');
      print('HP: ${hero.acctualHp}/${hero.maxHp} \t Strengh: ${hero.strengh} \t Defence: ${hero.defence} \t Speed: ${hero.speed}');
      int maxComfort = hero.minMaxComfort.reduce(max);
      print('Satiety ${hero.satiety}/$maxComfort \t Energy: ${hero.energy}/$maxComfort');
      print('\n');
  }

  static int printActions() {
    print('Enter number of action');
    int upper = 1;
    hero.location.actions.asMap().forEach((index, action) {
      print('${index + upper}: ${action.name}');
    });
    print('\nI will: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? (-1);
    return choise - upper;

  }

  static doChoise(int choise) {
    if(hero.location.actions.asMap().containsKey(choise)) {
      --hero.energy;
      Symbol act = new Symbol(hero.location.actions[choise].handlerName);
      final im = reflectClass(Handlers);
      im.invoke(act, []);
    }
  }


   static save() {
    String data = hero.toString();
    File(saveFilePath).writeAsStringSync(data);
    clearConsole();
    print('Game was saved');
    print('| Please press enter to continue |');
    stdin.readLineSync();
  }

  static bool load() {
    if (File(saveFilePath).existsSync()) {
      String data = File(saveFilePath).readAsStringSync();
      hero = Fox.loadFromString(data);
      return true;
    } else {
      return false;
    }
  }

  static void printOptions(String title, List optionsList, var handler, var handlerMistake) {
    clearConsole();
    int upper = 1;
    print(title);
    optionsList.asMap().forEach((key, val) {
      print('${key + upper}: ${val.name}');
    });
    print('\nI will: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? (-1);
    choise -= upper;
    if(optionsList.asMap().containsKey(choise)) {
      handler(choise);
    } else {
      handlerMistake(choise);
    }
  }

}
