import 'dart:io';

import '../game/Game.dart';
import '../locations/Location.dart';
import 'Animals.dart';
import 'Fight.dart';


class Fox extends Animals {

  Location location;

  List<int> minMaxComfort = [1, 10];
  int satiety = 8;
  int energy = 10;

  Fox(String name, Location location) {
    this.name = name;
    this.acctualHp = this.maxHp = 25;
    this.speed = 15;
    this.defence = 10;
    this.strengh = 5;
    this.location = location;
  }

  void changeLocation(Location location) {
    this.location = location;
  }

  void talkingWithFriend() {
    print('Hi Friend. How are you?');
    print('Hi ${this.name}. I\'m really good.');
    print('| Please press enter to continue |');
    stdin.readLineSync();
  }

  @override
  String toString() {
    return 'name:$name,acctualHp:$acctualHp,maxHp:$maxHp,speed:$speed,strengh:$strengh,defence:$defence,isLive:$isLive,location:${location.toString()},satiety:$satiety,energy:$energy';
  }

  static Fox loadFromString(String data) {
    Fox fox = new Fox('', new Location("Home"));
    List<String> propsWithValue = data.split(',');
    for (String propVal in propsWithValue) {
      List<String> pv = propVal.split(':');
      switch (pv[0]) {
        case 'name':
          fox.name = pv[1];
          break;
        case 'acctualHp':
          fox.acctualHp = int.parse(pv[1]);
          break;
        case 'maxHp':
          fox.maxHp = int.parse(pv[1]);
          break;
        case 'speed':
          fox.speed = int.parse(pv[1]);
          break;
        case 'strengh':
          fox.strengh = int.parse(pv[1]);
          break;
        case 'defence':
          fox.defence = int.parse(pv[1]);
          break;
        case 'isLive':
          fox.isLive = pv[1].toLowerCase() == 'true';
          break;
        case 'satiety':
          fox.satiety = int.parse(pv[1]);
          break;
        case 'energy':
          fox.energy = int.parse(pv[1]);
          break;
      }
    }
    return fox;
  }

  void hunting() {
    Game.printOptions('Choose animal:', Game.hero.location.animalList,
      (choise) {
        Game.clearConsole();
        Animals winner = (new Fight(Game.hero, Game.hero.location.animalList[choise])).doFight((damage, an) {
          print('${an.name} lost $damage HP. | ${an.name} has ${an.acctualHp}/${an.maxHp} HP');
          sleep(Duration(milliseconds: 300)); 
        });
        print('| Fight is over. ${winner.name} is the winner! Please click enter to be continue |');
        stdin.readLineSync();
      },
      (choise) {

      }
    );
  }

}