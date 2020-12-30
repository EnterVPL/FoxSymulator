import '../animals/Stats.dart';
import '../game/Game.dart';
import '../items/Item.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'InventoryActions.dart';

class WarehouseMenu {
  static int _menuType = WarehouseMenuTypes.ACTION;
  static String _titleAction = _translate("{WarehouseMenuActionTitle}");
  static String _titleType = _translate("{WarehouseMenuTypeTitle}");
  static String _titleItem = _translate("{WarehouseMenuItemTitle}");

  static List<WarehouseAction> _listAction = [
    new WarehouseAction(_translate('{Get items}')),
    new WarehouseAction(_translate('{Use items}')),
    new WarehouseAction(_translate('{Put items}')),
    new WarehouseAction(_translate('{Remove items}')),
    new WarehouseAction(_translate('{Back}')),
  ];

  static int _typeOfAction = -1;
  static int _itemType = -1;
  static int _itemId = -1;
  static int _maxTypes = -1;
  static int _maxItems = -1;

  static String _translate(key) {
    return Language.getTranslation(LanguagesTypes.INVENTORY, key);
  }

  static void show({restart = false}) {
    if (restart) {
      _menuType = WarehouseMenuTypes.ACTION;
    }
    switch (_menuType) {
      case WarehouseMenuTypes.ACTION:
        selectAction();
        break;
      case WarehouseMenuTypes.ITEM_TYPE:
        selectType();
        break;
      case WarehouseMenuTypes.ITEM:
        selectItem();
        break;
    }
  }

  static void selectAction() {
    Game.printOptions(_titleAction, _listAction, _handlerAction, (int no) {});
  }

  static void _handlerAction(int no) {
    switch (_menuType) {
      case WarehouseMenuTypes.ACTION:
        _typeOfAction = no;
        _menuType = WarehouseMenuTypes.ITEM_TYPE;
        break;
      case WarehouseMenuTypes.ITEM_TYPE:
        if (no >= _maxTypes || no == -1) {
          _menuType = WarehouseMenuTypes.ACTION;
          break;
        }
        _itemType = no;
        _menuType = WarehouseMenuTypes.ITEM;
        break;
      case WarehouseMenuTypes.ITEM:
        if (no >= _maxItems || no == -1) {
          _menuType = WarehouseMenuTypes.ITEM_TYPE;
          break;
        }
        _itemId = no;
        doAction(_typeOfAction, _itemType, _itemId);
        break;
    }
    if (_typeOfAction <= WarehouseMenuActionTypes.MAX) {
      show();
    }
  }

  static void selectType() {
    List<WarehouseAction> listType = new List();
    List<String> itemTypesList = ItemTypes.asList();
    if (_typeOfAction == WarehouseMenuActionTypes.USE) {
      listType.add(new WarehouseAction(_translate("{Food}")));
    } else {
      itemTypesList.forEach((element) {
        listType.add(new WarehouseAction(_translate(element)));
      });
    }

    _maxTypes = listType.length;

    listType.add(new WarehouseAction(_translate('{Back}')));

    Game.printOptions(_titleType, listType, _handlerAction, (int no) {});
  }

  static void selectItem() {
    List<WarehouseAction> listType = new List();
    Map<int, Item> items = Game.hero.warehouse.items[_itemType];
    items.forEach((key, item) {
      String tName = item.tName;
      String cOfTab = " \t\t";
      if (tName.length > 20) {
        cOfTab = " ";
      } else if (tName.length >= 12) {
        cOfTab = " \t";
      }
      String benefits = '';
      item.benefits.forEach((stat, value) {
        benefits += "| ${StatsType.getName(stat)} ";
        if (value >= 0) {
          benefits += "+${value} ";
        } else {
          benefits += "${value} ";
        }
      });
      _maxItems = items.length;
      listType.add(
          new WarehouseAction("${tName}${cOfTab}(${item.count})\t${benefits}"));
    });
    listType.add(new WarehouseAction(_translate('{Back}')));
    Game.printOptions(_titleItem, listType, _handlerAction, (int no) {});
  }

  static void doAction(int typeOfAction, int itemType, int itemId) {
    InventoryActions.doAction(
        typeOfAction, itemType, itemId, Game.hero.warehouse);
  }
}

class WarehouseMenuTypes {
  static const int ACTION = 0;
  static const int ITEM_TYPE = 1;
  static const int ITEM = 2;

  static const int MAX = 2;
}

class WarehouseMenuActionTypes {
  static const int GET = 0;
  static const int USE = 1;
  static const int PUT = 2;
  static const int REMOVE = 3;

  static const int MAX = 3;
}

class WarehouseAction {
  final String name;
  WarehouseAction(this.name);

  @override
  String toString() {
    return this.name;
  }
}
