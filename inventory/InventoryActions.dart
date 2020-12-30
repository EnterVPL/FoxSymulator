import 'dart:math';

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
        case WarehouseMenuActionTypes.GET:
          getItem(itemType, itemId);
          break;
        case WarehouseMenuActionTypes.PUT:
          putItem(itemType, itemId);
          break;
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

  static void getItem(int itemType, int itemId) {
    Item itemWarehouse = Game.hero.warehouse.items[itemType][itemId];
    if (itemWarehouse.count > 0) {
      Item itemBag = Game.hero.bag.items[itemType][itemId];
      itemBag.count += 1;
      itemWarehouse.count -= 1;
    }
  }

  static void putItem(int itemType, int itemId) {
    Item itemBag = Game.hero.bag.items[itemType][itemId];
    if (itemBag.count > 0) {
      Item itemWarehouse = Game.hero.warehouse.items[itemType][itemId];
      itemBag.count -= 1;
      itemWarehouse.count += 1;
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
        switch (inventor.items[itemType][itemId].type) {
          case ItemTypes.ARMMOR:
            Game.hero.usingArmmor;
            if (Game.hero.usingArmmor != null) {
              if (Game.hero.usingArmmor.id ==
                  inventor.items[itemType][itemId].id) break;
              Game.hero.usingArmmor.benefits.forEach((type, value) {
                Game.hero.stats[type] -= value;
              });
              Game.hero.usingArmmor.isWear = false;
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingArmmor = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            } else {
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingArmmor = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            }
            break;
          case ItemTypes.SHIELD:
            Game.hero.usingShield;
            if (Game.hero.usingShield != null) {
              if (Game.hero.usingShield.id ==
                  inventor.items[itemType][itemId].id) break;
              Game.hero.usingShield.benefits.forEach((type, value) {
                Game.hero.stats[type] -= value;
              });
              Game.hero.usingShield.isWear = false;
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingShield = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            } else {
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingShield = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            }
            break;
          case ItemTypes.WEAPON:
            Game.hero.usingWeapon;
            if (Game.hero.usingWeapon != null) {
              if (Game.hero.usingWeapon.id ==
                  inventor.items[itemType][itemId].id) break;
              Game.hero.usingWeapon.benefits.forEach((type, value) {
                Game.hero.stats[type] -= value;
              });
              Game.hero.usingWeapon.isWear = false;
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingWeapon = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            } else {
              inventor.items[itemType][itemId].isWear = true;
              Game.hero.usingWeapon = inventor.items[itemType][itemId];
              inventor.items[itemType][itemId].benefits.forEach((type, value) {
                Game.hero.stats[type] += value;
              });
            }
            break;
        }
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
    if (Game.hero.stats[StatsType.SATIETY] >
        Game.hero.minMaxComfort.reduce(max)) {
      Game.hero.stats[StatsType.SATIETY] = Game.hero.minMaxComfort.reduce(max);
    }
  }
}
