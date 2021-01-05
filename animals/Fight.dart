import 'dart:io';
import 'dart:math';

import '../items/Item.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'Animals.dart';
import 'Fox.dart';

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
      lootMeesage(doLoot(winner, loser));
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
    int minChance = loser.loots["min"];
    int maxChance = loser.loots["max"];
    int randomChance =
        minChance + (new Random()).nextInt(maxChance - minChance);
    return setRandomItem(randomChance, hero);
  }

  List<Item> setRandomItem(int chance, Fox hero) {
    List<Item> items = new List();
    hero.bag.items.forEach((type, map_items) {
      map_items.forEach((id, item) {
        if (item.chance['min'] <= chance && item.chance["max"] >= chance) {
          items.add(item);
          item.count += 1;
        }
      });
    });
    return items;
  }

  void lootMeesage(List<Item> items) {
    String trans(String key) {
      return Language.getTranslation(LanguagesTypes.INVENTORY, key);
    }

    if (items.length > 0) {
      print('');
      print(trans("{Loot_title}"));
      sleep(Duration(seconds: 1));
      items.forEach((item) {
        print(item.tName);
        sleep(Duration(seconds: 1));
      });
      print('');
    }
  }
}
