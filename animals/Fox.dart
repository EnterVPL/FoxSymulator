import 'dart:io';

import '../locations/Location.dart';
import 'Animals.dart';


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
    this.strengh = 3;
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

  void hunting() {
    
  }

}