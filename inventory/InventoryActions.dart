import '../animals/Stats.dart';
import '../game/Game.dart';
import '../items/Item.dart';
import 'BagMenu.dart';
import 'Inventory.dart';
import 'WarehouseMenu.dart';

class InventoryActions {
  static void doAction(
      int typeOfAction, int itemType, int itemId, Inventory inventor,
      {type = 0}) {
    if (type == 0) {
      switch (typeOfAction) {
        case WarehouseMenuActionTypes.REMOVE:
          removeItem(itemType, itemId, inventor);
          break;
        case WarehouseMenuActionTypes.USE:
          useItem(itemType, itemId, inventor);
          break;
      }
    } else {
      switch (typeOfAction) {
        case BagMenuActionTypes.REMOVE:
          removeItem(itemType, itemId, inventor);
          break;
        case BagMenuActionTypes.USE:
          useItem(itemType, itemId, inventor);
          break;
      }
    }
  }

  static void removeItem(int itemType, int itemId, Inventory inventor) {
    Item item = inventor.items[itemType][itemId];
    if (item.count > 0) {
      item.count -= 1;
    }
  }

  static void useItem(int itemType, int itemId, Inventory inventor) {
    if (inventor.items[itemType][itemId].count > 0) {
      if (inventor.items[itemType][itemId].type != ItemTypes.FOOD) {
        wearItem(inventor.items[itemType][itemId]);
      } else {
        inventor.items[itemType][itemId].count -= 1;
        inventor.items[itemType][itemId].benefits.forEach((type, value) {
          Game.hero.stats[type] += value;
        });
      }
    }
    if (Game.hero.stats[StatsType.ACCTUALHP] >
        Game.hero.stats[StatsType.MAXHP]) {
      Game.hero.stats[StatsType.ACCTUALHP] = Game.hero.stats[StatsType.MAXHP];
    }
    if (Game.hero.stats[StatsType.SATIETY] > Game.hero.comfort) {
      Game.hero.stats[StatsType.SATIETY] = Game.hero.comfort;
    }
    if (Game.hero.stats[StatsType.ENERGY] > Game.hero.comfort) {
      Game.hero.stats[StatsType.ENERGY] = Game.hero.comfort;
    }
  }

  static void wearItem(Item wearingItem) {
    if (Game.hero.usingItems.containsKey(wearingItem.type)) {
      Game.hero.usingItems[wearingItem.type].isWear = false;
      Game.hero.usingItems[wearingItem.type] = wearingItem;
      Game.hero.usingItems[wearingItem.type].isWear = true;
    } else {
      Game.hero.usingItems.putIfAbsent(wearingItem.type, () => wearingItem);
      Game.hero.usingItems[wearingItem.type].isWear = true;
    }
  }
}
