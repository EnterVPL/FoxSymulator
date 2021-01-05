import 'dart:convert';
import 'dart:io';

import '../game/Game.dart';
import '../inventory/Inventory.dart';
import '../items/Item.dart';
import '../items/ItemsList.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import '../locations/Location.dart';
import 'Animals.dart';
import 'Fight.dart';
import 'Friend.dart';
import 'Stats.dart';

class Fox extends Animals {
  String name;
  Location location;
  Inventory bag;
  Inventory warehouse;
  Item usingWeapon;
  Item usingShield;
  Item usingArmmor;
  int _skill_points;
  int _toNextLvl = 100;

  List<int> minMaxComfort = [1, 10];
  int get satiety {
    return stats[StatsType.SATIETY];
  }

  set satiety(int count) {
    stats[StatsType.SATIETY] = count;
  }

  int get energy {
    return stats[StatsType.ENERGY];
  }

  set energy(int count) {
    stats[StatsType.ENERGY] = count;
  }

  int get exp {
    return stats[StatsType.EXP];
  }

  set exp(int count) {
    stats[StatsType.EXP] = count;
  }

  int get lvl {
    return stats[StatsType.LVL];
  }

  set lvl(int count) {
    stats[StatsType.LVL] = count;
  }

  int get comfort {
    return stats[StatsType.COMFORT];
  }

  set comfort(int count) {
    stats[StatsType.COMFORT] = count;
  }

  int get skill_points {
    return _skill_points;
  }

  int get nextLvl {
    return _toNextLvl;
  }

  Fox(String name, Location location) {
    this.name = name;
    this.acctualHp = this.maxHp = 28;
    this.speed = 13;
    this.defence = 14;
    this.strengh = 7;
    this.location = location;
    this.satiety = 10;
    this.energy = 10;
    this.comfort = 10;
    this.bag = new Inventory(30);
    this.warehouse = new Inventory(90000);
    _generateItems();
    this.exp = 0;
    this.lvl = 1;
    this._skill_points = 0;
  }

  void changeLocation(Location location) {
    this.location = location;
  }

  void talkingWithFriend() {
    Friend.talkingWithFriend();
  }

  @override
  String toString() {
    return 'name:$name,acctualHp:$acctualHp,maxHp:$maxHp,speed:$speed,strengh:$strengh,defence:$defence,isLive:$isLive,location:${location.toString()},satiety:$satiety,energy:$energy,comfort:$comfort,exp:$exp,lvl:$lvl,lvl_points:$_skill_points';
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
        case 'comfort':
          fox.comfort = int.parse(pv[1]);
          break;
        case 'exp':
          fox.exp = int.parse(pv[1]);
          break;
        case 'lvl':
          fox.lvl = int.parse(pv[1]);
          break;
        case 'lvl_points':
          fox._skill_points = int.parse(pv[1]);
          break;
      }
    }
    fox.refreshNextLvl();
    return fox;
  }

  void hunting() {
    String title =
        Language.getTranslation(LanguagesTypes.ANIMALS, "{Choose animal}");
    String avoid =
        Language.getTranslation(LanguagesTypes.ANIMALS, "{avoid the attack}");
    String lost_hp =
        Language.getTranslation(LanguagesTypes.ANIMALS, "{lost_hp}");
    Game.printOptions('${title}:', Game.hero.location.animalList, (choise) {
      Game.clearConsole();
      Animals winner =
          (new Fight(Game.hero, Game.hero.location.animalList[choise]))
              .doFight((damage, an) {
        String message = an.name;
        if (damage == 0) {
          message += ' ${avoid}';
        } else {
          message += ' $lost_hp'
              .replaceAll("{damage}", damage.toString())
              .replaceAll("{name}", an.name)
              .replaceAll("{acctualHp}", an.acctualHp.toString())
              .replaceAll("{maxHp}", an.maxHp.toString());
        }
        print(message);
        sleep(Duration(milliseconds: 300));
      });
      print(Language.getTranslation(LanguagesTypes.ANIMALS, "{fight_over}")
          .replaceAll("{winner}", winner.name));
      stdin.readLineSync();
    }, (choise) {
      ++Game.hero.energy;
      print(Language.getTranslation(LanguagesTypes.ANIMALS, "{not_hunt}"));
      stdin.readLineSync();
    });
  }

  String getBagToSave() {
    return bag.toJson();
  }

  String getWarehouseToSave() {
    return warehouse.toJson();
  }

  void _generateItems() {
    Map<int, List<Map<String, dynamic>>> items = ItemsList.getIt();
    items.forEach((typeId, list) {
      int type = typeId;
      list.asMap().forEach((key, value) {
        int id = value['id'];
        String name = value['name'];
        Map<int, int> benefits = value['benefits'];
        Map<String, int> chance = value['chance'];
        Item itemB = new Item(id, name, type, benefits, chance, false);
        bag.addItem(itemB);
        Item itemW = new Item(id, name, type, benefits, chance, false);
        warehouse.addItem(itemW);
      });
    });
  }

  void loadInventory(String data, Inventory inventor) {
    Map<String, dynamic> dataJson = json.decode(data);
    dataJson.forEach((type_id, item) {
      inventor.items[item["type"]][item["id"]].count = item["count"];
      inventor.items[item["type"]][item["id"]].isWear = item["isWear"];
      if (item["isWear"]) {
        switch (item["type"]) {
          case ItemTypes.ARMMOR:
            usingArmmor = inventor.items[item["type"]][item["id"]];
            break;
          case ItemTypes.WEAPON:
            usingWeapon = inventor.items[item["type"]][item["id"]];
            break;
          case ItemTypes.SHIELD:
            usingShield = inventor.items[item["type"]][item["id"]];
            break;
        }
      }
    });
  }

  void loadBagFromJson(String data) {
    loadInventory(data, bag);
  }

  void loadWorehouseFromJson(String data) {
    loadInventory(data, warehouse);
  }

  void addExp(int count) {
    exp += count;
    while (exp >= _toNextLvl) {
      refreshLvl();
    }
  }

  void refreshLvl() {
    if (exp >= _toNextLvl) {
      lvl += 1;
      addLvlPoints(3);
      refreshNextLvl();
    }
  }

  void refreshNextLvl() {
    _toNextLvl = (lvl * 100) + ((lvl - 1) * 100);
  }

  void addLvlPoints(int count) {
    _skill_points += 3;
  }

  bool train(int stat) {
    if (_skill_points > 0) {
      _skill_points -= 1;
      stats[stat] += 1;
      return true;
    } else {
      return false;
    }
  }
}
