import '../locations/Location.dart';
import 'Animals.dart';


class Fox extends Animals {

  Location location;

  Fox(String name) {
    this.name = name;
    this.acctualHp = this.maxHp = 25;
    this.speed = 15;
    this.defence = 10;
    this.strengh = 3;
  }

  void changeLocation(Location location) {
    this.location = location;
  }

}