import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'Game.dart';

/// Handlers for actions in /locations/LocationsList.dart
class Handlers {

    static Map<String, Function> callerMap = {
        'talkingWithFriend' : talkingWithFriend,
        'changeLocation' : changeLocation,
        'goSleep' : goSleep,
        'exit' : exit,
        'hunting' : hunting,
        'changeLanguage' : changeLanguage
    };

    /// Run method using method [name]
    ///
    /// Returned 'true' if method is exists or 'false' if method is not exists
    static bool call(String name) {
        if(callerMap.containsKey(name)) {
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
        print('Select new location');
        Game.locations.asMap().forEach((key, loc) {
            print('${key + upper}: ${loc}');
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

}