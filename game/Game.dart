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

  String _saveFilePath = './your.foxy';

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
      if(load()) {
        hero.changeLocation(_locations.firstWhere((loc) => loc.name == 'Home'));
      } else {
        print('Enter your fox name: ');
        String name = stdin.readLineSync();
        hero.name = name;
        hero.changeLocation(_locations.firstWhere((loc) => loc.name == 'Home')); 
      }
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
    int upper = 1;
    hero.location.actions.asMap().forEach((index, action) {
      print('${index + upper}: ${action.name}');
    });
    print('\nI will: ');
    int choise = int.tryParse(stdin.readLineSync()) ?? (-1);
    return choise - upper;

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
          int upper = 1;
          print('Select new location');
          locations.asMap().forEach((key, loc) {
            print('${key + upper}: ${loc.name}');
          });
          print('\nI will: ');
          int choiseLoc = int.tryParse(stdin.readLineSync()) ?? (-1);
          choiseLoc -= upper;
          if(locations.asMap().containsKey(choiseLoc)) {
            hero.changeLocation(locations[choiseLoc]);
          } else {
            print('I know.. you may stay here..');
            print('| Please press enter to continue |');
            stdin.readLineSync();
          }
          break;
        case 'exit':
          isExit = true;
          break;
        case 'goSleep':
          save();
          break;
      }
    }
  }


  void save() {
    String data = hero.toString();
    File(_saveFilePath).writeAsStringSync(data);
    _clearConsole();
    print('Game was saved');
    print('| Please press enter to continue |');
    stdin.readLineSync();
  }

  bool load() {
    if (File(_saveFilePath).existsSync()) {
      String data = File(_saveFilePath).readAsStringSync();
      hero = Fox.loadFromString(data);
      return true;
    } else {
      return false;
    }
  }

}