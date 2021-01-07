import 'dart:convert';
import 'dart:io';

import '../game/Color.dart';
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
  Map<int, Item> usingItems = new Map();
  int _skill_points;
  int _toNextLvl = 100;

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

  int get speed {
    int speed_stat = stats[StatsType.SPEED];
    usingItems.forEach((type, item) {
      if (item != null) {
        item.benefits.forEach((stat, count) {
          if (stat == StatsType.SPEED) speed_stat += count;
        });
      }
    });
    return speed_stat;
  }

  int get strengh {
    int strengh_stat = stats[StatsType.STRENGH];
    usingItems.forEach((type, item) {
      if (item != null) {
        item.benefits.forEach((stat, count) {
          if (stat == StatsType.STRENGH) strengh_stat += count;
        });
      }
    });
    return strengh_stat;
  }

  int get defence {
    int defence_stat = stats[StatsType.DEFENCE];
    usingItems.forEach((type, item) {
      if (item != null) {
        item.benefits.forEach((stat, count) {
          if (stat == StatsType.DEFENCE) defence_stat += count;
        });
      }
    });
    return defence_stat;
  }

  Fox(String name, Location location) {
    this.name = name;
    this.acctualHp = this.maxHp = 28;
    this.speed = 50;
    this.defence = 7;
    this.strengh = 14;
    this.location = location;
    this.satiety = 10;
    this.energy = 10;
    this.comfort = 10;
    this.bag = new Inventory();
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
    return 'name:$name,acctualHp:$acctualHp,maxHp:$maxHp,speed:${stats[StatsType.SPEED]},strengh:${stats[StatsType.STRENGH]},defence:${stats[StatsType.DEFENCE]},isLive:$isLive,location:${location.toString()},satiety:$satiety,energy:$energy,comfort:$comfort,exp:$exp,lvl:$lvl,lvl_points:$_skill_points';
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
    Game.printOptions(
        '${title}:', Game.hero.getAnimalsNamesWithStats(), courseFight,
        (choise) {
      ++Game.hero.energy;
      print(Language.getTranslation(LanguagesTypes.ANIMALS, "{not_hunt}"));
      stdin.readLineSync();
    }, isPirntStats: true);
  }

  String getBagToSave() {
    return bag.toJson();
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
      });
    });
  }

  void loadInventory(String data, Inventory inventor) {
    Map<String, dynamic> dataJson = json.decode(data);
    dataJson.forEach((type_id, item) {
      inventor.items[item["type"]][item["id"]].count = item["count"];
      inventor.items[item["type"]][item["id"]].isWear = item["isWear"];
      if (item["isWear"]) {
        usingItems.putIfAbsent(
            item["type"], () => inventor.items[item["type"]][item["id"]]);
      }
    });
  }

  void loadBagFromJson(String data) {
    loadInventory(data, bag);
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

  List<AnimalSpecialName> getAnimalsNamesWithStats() {
    List<AnimalSpecialName> list = new List();
    Game.hero.location.animalList.forEach((animal) {
      String str = animal.name;
      int anNameLen = str.length;
      String cOfTab = " \t\t\t\t";
      if (anNameLen >= 20) {
        cOfTab = " \t";
      } else if (anNameLen >= 12) {
        cOfTab = " \t\t";
      } else if (anNameLen > 3) {
        cOfTab = " \t\t\t";
      }

      Map<String, dynamic> hpStrMap = colorStatByDiff(StatsType.MAXHP, animal);
      String hpStr = hpStrMap["str"];
      int totalDifficult = hpStrMap["how_difficult"];
      int difficultRev = hpStrMap["howdifficultRev"];

      Map<String, dynamic> speedStrMap =
          colorStatByDiff(StatsType.SPEED, animal);
      String speedStr = speedStrMap["str"];
      totalDifficult += speedStrMap["how_difficult"];
      difficultRev += speedStrMap["howdifficultRev"];

      Map<String, dynamic> strenghStrMap =
          colorStatByDiff(StatsType.STRENGH, animal);
      String strenghStr = strenghStrMap["str"];
      totalDifficult += strenghStrMap["how_difficult"];
      difficultRev += strenghStrMap["howdifficultRev"];

      Map<String, dynamic> defenceStrMap =
          colorStatByDiff(StatsType.DEFENCE, animal);
      String defenceStr = defenceStrMap["str"];
      totalDifficult += defenceStrMap["how_difficult"];
      difficultRev += defenceStrMap["howdifficultRev"];

      if (totalDifficult > difficultRev * 2) {
        str = Color.redBold(str);
      } else if (totalDifficult > difficultRev) {
        str = Color.yellowBold(str);
      } else if (totalDifficult == difficultRev) {
        str = Color.cyanBold(str);
      } else {
        str = Color.greenBold(str);
      }

      str += cOfTab + "$hpStr | $speedStr | $strenghStr | $defenceStr";

      list.add(new AnimalSpecialName(str));
    });
    return list;
  }

  /// return how difficult is nemy
  Map<String, dynamic> colorStatByDiff(int stat_type, Animals animal) {
    String str = StatsType.getName(stat_type) + ": ${animal.stats[stat_type]}";
    int howdifficult = 0;
    int howdifficultRev = 0;

    if (animal.stats[stat_type] > Game.hero.stats[stat_type] * 2) {
      str = Color.redBold(str);
      howdifficult = 3;
    } else if (animal.stats[stat_type] > Game.hero.stats[stat_type]) {
      str = Color.yellowBold(str);
      howdifficult = 2;
    } else if (animal.stats[stat_type] == Game.hero.stats[stat_type]) {
      str = Color.cyanBold(str);
      howdifficult = 1;
    } else {
      str = Color.greenBold(str);
    }

    if (Game.hero.stats[stat_type] > animal.stats[stat_type] * 2) {
      howdifficultRev = 3;
    } else if (Game.hero.stats[stat_type] > animal.stats[stat_type]) {
      howdifficultRev = 2;
    } else if (Game.hero.stats[stat_type] == animal.stats[stat_type]) {
      howdifficultRev = 1;
    }

    return {
      "str": str,
      "how_difficult": howdifficult,
      "howdifficultRev": howdifficultRev
    };
  }

  void courseFight(choise) {
    Animals animal = Game.hero.location.animalList[choise];
    String avoid =
        Language.getTranslation(LanguagesTypes.ANIMALS, "{avoid the attack}");
    String lost_hp =
        Language.getTranslation(LanguagesTypes.ANIMALS, "{lost_hp}");
    Game.clearConsole();
    int counter_face_ignore = 0;
    int ignore_for = 5;
    String fox_eyes_normal = "< . . >";
    String fox_eyes = fox_eyes_normal;
    String fox_eyes_lost = "< O O >";
    String fox_eyes_avoid = "< ^ ^ >";
    String fox_eyes_hitting = "< ^ ~ >";

    Animals winner = (new Fight(Game.hero, animal)).doFight((damage, an) {
      Game.clearConsole();
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

      if (an is Fox) {
        if (damage > 0) {
          fox_eyes = fox_eyes_lost;
          counter_face_ignore = ignore_for;
        } else if (damage == 0 && counter_face_ignore == 0) {
          fox_eyes = fox_eyes_avoid;
          counter_face_ignore = ignore_for;
        }
      } else {
        if (damage > 0 && counter_face_ignore == 0) {
          fox_eyes = fox_eyes_hitting;
          counter_face_ignore = ignore_for;
        } else if (damage == 0 && counter_face_ignore == 0) {
          fox_eyes = fox_eyes_normal;
          counter_face_ignore = ignore_for;
        }
      }
      if (counter_face_ignore > 0) {
        --counter_face_ignore;
      }

      String interface = '/\\,,,/\\\n';
      interface += "$fox_eyes\t" +
          Game.hero.name +
          "\t${Game.hero.acctualHp}/${Game.hero.maxHp}" +
          "\n";
      interface += "  \\_/\t  " + Game.hero.hpBar + "\n";
      interface += '\n\n';
      interface +=
          "\t" + animal.name + "\t${animal.acctualHp}/${animal.maxHp}" + "\n";
      interface += "\t  " + animal.hpBar + "\n";
      interface += "\n\n";

      print(interface);
      print(message);
      sleep(Duration(milliseconds: 300));
    });

    print("\n" +
        Language.getTranslation(LanguagesTypes.ANIMALS, "{fight_over}")
            .replaceAll("{winner}", winner.name));
    stdin.readLineSync();
  }
}
