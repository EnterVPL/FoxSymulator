import 'dart:io';
import 'dart:math';


import '../animals/Animals.dart';
import '../animals/Fox.dart';
import '../locations/Location.dart';
import '../locations/LocationList.dart';
import 'Actions.dart';

class Game 
{
  List<Location> _locations;

  List<Location> get locations {
    return _locations;
  }

  bool isExit = false;
  Fox hero;

  Game() {
    _initGame();
  }

  void _initGame() {
    hero = new Fox('', Location('Void'));
    _locations = _initLocations();

  }

  List<Location> _initLocations() {
    List<Location> locs = new List<Location>();
    var locationList = LocationList.getJsonLocationList();
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

  void _clearConsole() {
    print("\x1B[2J\x1B[0;0H"); 
  }

  void nextTurn() {
    if(hero.name != '') {
      _printStats();
      _doChoise(_printActions());
    } else {
      _startGame();
    }
    _clearConsole();
  }

  void _startGame() {
      print('Enter your fox name: ');
      String name = stdin.readLineSync();
      hero.name = name;
      hero.changeLocation(_locations.firstWhere((loc) => loc.name == 'Home')); 
  }

  void _printStats() {
      print('Name: ${hero.name} \t Location: ${hero.location.name}');
      print('HP: ${hero.acctualHp}/${hero.maxHp} \t Strengh: ${hero.strengh} \t Defence: ${hero.defence} \t Speed: ${hero.speed}');
      int maxComfort = hero.minMaxComfort.reduce(max);
      print('Satiety ${hero.satiety}/$maxComfort \t Energy: ${hero.energy}/$maxComfort');
      print('\n');
  }

  int _printActions() {
    print('Enter number of action');
    hero.location.actions.asMap().forEach((index, action) {
      print('${index}: ${action.name}');
    });
    print('${hero.location.actions.length}: Exit from game.');
    print('\nI will: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? -1;
    return choise;

  }

  void _doChoise(int choise) {
    if(hero.location.actions.asMap().containsKey(choise)) {
      switch (hero.location.actions[choise].handlerName) {
        case 'talkingWithFriend':
          _clearConsole();
          hero.talkingWithFriend();
          break;
        case 'changeLocation': 
          _clearConsole();
          print('Select new location');
          locations.asMap().forEach((key, loc) {
            print('${key}: ${loc.name}');
          });
          print('\nI will: ');
          int choiseLoc = int.tryParse(stdin.readLineSync()) ?? -1;
          if(locations.asMap().containsKey(choiseLoc)) {
            hero.changeLocation(locations[choiseLoc]);
          } else {
            print('I know.. you may stay here..');
            print('| Please press enter to continue |');
            stdin.readLineSync();
          }
          break;
        default:
      }
    }
    if(choise == hero.location.actions.length) {
      isExit = true;
    }
    /*if(_options.contains(choise)) {
      switch (choise) {
        case "100":
          isExit = true;
          break;
        default:
          print('Unaccepted choise.');
          break;
      }
    }*/
  }

}