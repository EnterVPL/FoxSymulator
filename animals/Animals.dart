import 'dart:math';

import '../game/Color.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'Stats.dart';

class Animals {
  String _name;
  Map<int, int> stats = new Map();
  bool isLive = true;
  List<Map<String, dynamic>> loots = new List();
  int dropExp;

  int get acctualHp {
    return stats[StatsType.ACCTUALHP];
  }

  set acctualHp(int count) {
    stats[StatsType.ACCTUALHP] = count;
  }

  int get maxHp {
    return stats[StatsType.MAXHP];
  }

  set maxHp(int count) {
    stats[StatsType.MAXHP] = count;
  }

  int get speed {
    return stats[StatsType.SPEED];
  }

  set speed(int count) {
    stats[StatsType.SPEED] = count;
  }

  int get strengh {
    return stats[StatsType.STRENGH];
  }

  set strengh(int count) {
    stats[StatsType.STRENGH] = count;
  }

  int get defence {
    return stats[StatsType.DEFENCE];
  }

  set defence(int count) {
    stats[StatsType.DEFENCE] = count;
  }

  String get name {
    return Language.getTranslation(LanguagesTypes.ANIMALS, this._name);
  }

  Animals create(String name, int maxHp, int speed, int strengh, int defence,
      List<Map<String, dynamic>> loots, int dropExp) {
    Animals animal = new Animals();
    animal._name = name;
    animal.maxHp = animal.acctualHp = maxHp;
    animal.speed = speed;
    animal.strengh = strengh;
    animal.defence = defence;
    animal.loots = loots;
    animal.dropExp = dropExp;
    return animal;
  }

  int atack(Animals enemy) {
    int hitChance = calcHitChance(this.speed, enemy.speed);
    Random rnd = Random();
    int damage = 0;
    if (hitChance >= rnd.nextInt(200)) {
      damage = doDamage(this, enemy, rnd);
    }
    return damage;
  }

  int calcHitChance(int atackerSpeed, int defendingSpeed) {
    return ((atackerSpeed.toDouble() / defendingSpeed.toDouble()) * 100)
        .toInt();
  }

  int doDamage(Animals atacker, Animals defending, Random rnd) {
    int maxDamage = 0;
    maxDamage = atacker.strengh - defending.defence;
    if (maxDamage <= 0) {
      maxDamage = 1;
    }

    int damage = rnd.nextInt(maxDamage + 1);
    defending.acctualHp -= damage;
    if (defending.acctualHp <= 0) {
      defending.acctualHp = 0;
      defending.isLive = false;
    }
    return damage;
  }

  String get hpBar {
    String bar = Color.cyanBold("[");
    double maxWidth = 25;
    double acctualWidth = (((acctualHp / maxHp) * 100) / (100 / maxWidth));
    String currentHp = "";
    String spaces = "";
    if (acctualWidth > 0) {
      for (int i = 1; i < acctualWidth; i++) {
        currentHp += "=";
      }
    }

    if (currentHp.length < maxWidth) {
      for (int i = 1; i < maxWidth - currentHp.length; i++) {
        spaces += " ";
      }
    }

    if (acctualWidth <= maxWidth / 4) {
      currentHp = Color.redBold(currentHp);
    } else if (acctualWidth <= maxWidth / 2) {
      currentHp = Color.yellowBold(currentHp);
    } else {
      currentHp = Color.greenBold(currentHp);
    }

    bar += currentHp + spaces;
    bar += Color.cyanBold("]");
    return bar;
  }
}

class AnimalSpecialName {
  final String name;
  AnimalSpecialName(this.name);

  @override
  String toString() {
    return this.name;
  }
}
