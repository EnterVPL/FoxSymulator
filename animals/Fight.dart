import 'dart:io';
import 'dart:math';

import '../items/Item.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'Animals.dart';
import 'Fox.dart';
import '../inventory/Inventory.dart';

class Fight {
  Animals atacker;
  Animals defending;
  int lastDamage;

  Fight(Animals atacker, Animals defending) {
    this.atacker = atacker;
    this.defending = defending;
  }

  /// [handlerDamage] Callback after each atack. Handler's arguments are (int damage, Animals whoLostHP).
  ///
  /// Returns 'Animals' winner
  Animals doFight(handlerDamage) {
    bool whoseTurn = (new Random()).nextBool(); //true atacker, false defending
    int damage;
    while (atacker.isLive && defending.isLive) {
      damage = (whoseTurn ? atacker : defending)
          .atack((whoseTurn ? defending : atacker));
      handlerDamage(damage, (whoseTurn ? defending : atacker));
      whoseTurn = !whoseTurn;
    }
    Animals winner = (atacker.isLive ? atacker : defending);
    Animals loser = (!atacker.isLive ? atacker : defending);
    atacker.isLive = defending.isLive = true;

    if (winner is Fox) {
      loser.acctualHp = loser.maxHp;
      lootMeesage(doLoot(winner, loser), loser);
      winner.addExp(loser.dropExp);
    } else {
      winner.acctualHp = winner.maxHp;
    }
    return winner;
  }

  /// [hero] Fox
  /// [loser] Animals
  ///
  /// Generate item
  List<Item> doLoot(Fox hero, Animals loser) {
    return setRandomItem(hero, loser);
  }

  List<Item> setRandomItem(Fox hero, Animals loser) {
    return getRandomItems(loser.loots, hero.bag);
  }

  List<Item> getRandomItems(List<Map<String, dynamic>> loots, Inventory bag) {
    Random rnd = new Random();
    List<Item> items = new List();
    int maxDrop = 0;
    loots.forEach((items) {
      maxDrop += items["ids"].length;
    });

    maxDrop = rnd.nextInt(maxDrop);

    int currentDrop = 0;
    while (currentDrop <= maxDrop) {
      Map<String, dynamic> drop = loots.elementAt(rnd.nextInt(loots.length));
      int type = drop["type"];
      int id = drop["ids"].elementAt(rnd.nextInt(drop["ids"].length));
      items.add(bag.addItemByIds(type, id));
      currentDrop += 1;
    }
    return items;
  }

  void lootMeesage(List<Item> items, Animals loser) {
    String trans(String key) {
      return Language.getTranslation(LanguagesTypes.INVENTORY, key);
    }

    if (items.length > 0) {
      print('');
      print(trans("{Loot_title}"));
      print("${trans('{drop_exp_title}')}: ${loser.dropExp}");
      sleep(Duration(seconds: 1));
      items.forEach((item) {
        print(item.tName);
        sleep(Duration(seconds: 1));
      });
      print('');
    }
  }
}
