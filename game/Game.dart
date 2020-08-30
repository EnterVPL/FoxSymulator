import 'dart:io';
import 'dart:math';

import '../animals/Animals.dart';
import '../animals/Fox.dart';
import '../locations/Location.dart';
import '../locations/LocationList.dart';
import 'Actions.dart';
import 'Handlers.dart';

/// Main game class
class Game 
{
    /// List of locations
    static List<Location> locations;

    /// If 'true' then this game is closing
    static bool isExit = false;
    /// Hero object
    static Fox hero;

    /// Path to save
    static String saveFilePath = './your.foxy';

    Game() {
        initGame();
    }

    /// Game initialization
    /// 
    /// Created hero object and initialize whole locations
    static void initGame() {
        hero = new Fox('', Location('Void'));
        locations = initLocations();
    }

    /// Initialize locations
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

    /// Universal method to clear console for Windows and Linux
    static void clearConsole() {
        print("\x1B[2J\x1B[0;0H"); 
    }

    /// Checking game is continued.
    /// If game is not continuing (if it is first run or normal run) then the game is running 'startGame()' method
    static void nextTurn() {
        if(hero.name != '') {
            printStats();
            doChoise(printActions());
        } else {
            startGame();
        }
        clearConsole();
    }

    /// Checking it is posible load game. If it is posible then load game else running making character
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

    /// Printing statistic
    static void printStats() {
        print('Name: ${hero.name} \t Location: ${hero.location.name}');
        print('HP: ${hero.acctualHp}/${hero.maxHp} \t Strengh: ${hero.strengh} \t Defence: ${hero.defence} \t Speed: ${hero.speed}');
        int maxComfort = hero.minMaxComfort.reduce(max);
        print('Satiety ${hero.satiety}/$maxComfort \t Energy: ${hero.energy}/$maxComfort');
        print('\n');
    }

    /// Printing possible actions from current location
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

    /// Do choise from number of action. List of possible actions is located in /game/Handlers
    static doChoise(int choise) {
        if(hero.location.actions.asMap().containsKey(choise)) {
            --hero.energy;
            Handlers.call(hero.location.actions[choise].handlerName);
        }
    }

    /// Saving game
    static save() {
        String data = hero.toString();
        File(saveFilePath).writeAsStringSync(data);
        clearConsole();
        print('Game was saved');
        print('| Please press enter to continue |');
        stdin.readLineSync();
    }

    /// Loading game from save
    static bool load() {
        if (File(saveFilePath).existsSync()) {
            String data = File(saveFilePath).readAsStringSync();
            hero = Fox.loadFromString(data);
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
