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
import 'Stats.dart';

class Fox extends Animals {
  String name;
  Location location;
  Inventory bag;
  Inventory warehouse;
  Item usingWeapon;
  Item usingShield;
  Item usingArmmor;

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

  Fox(String name, Location location) {
    this.name = name;
    this.acctualHp = this.maxHp = 25;
    this.speed = 15;
    this.defence = 10;
    this.strengh = 5;
    this.location = location;
    this.satiety = 10;
    this.energy = 10;
    this.bag = new Inventory(30);
    this.warehouse = new Inventory(90000);
    _generateItems();
  }

  void changeLocation(Location location) {
    this.location = location;
  }

  void talkingWithFriend() {
    print(Language.getTranslation(LanguagesTypes.FRIEND, "{hi_hero}"));
    print(Language.getTranslation(LanguagesTypes.FRIEND, "{hi_friend}")
        .replaceAll("{name}", this.name));
    print("\n" +
        Language.getTranslation(LanguagesTypes.OPTIONS, "{enter to continue}"));
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
        Item itemB = new Item(id, name, type, benefits);
        bag.addItem(itemB);
        Item itemW = new Item(id, name, type, benefits);
        warehouse.addItem(itemW);
      });
    });
  }

  void loadInventory(String data, Inventory inventor) {
    Map<String, dynamic> dataJson = json.decode(data);
    dataJson.forEach((type_id, item) {
      inventor.items[item["type"]][item["id"]].count = item["count"];
    });
  }

  void loadBagFromJson(String data) {
    loadInventory(data, bag);
  }

  void loadWorehouseFromJson(String data) {
    loadInventory(data, warehouse);
  }
}
