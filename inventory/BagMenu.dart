import '../animals/Stats.dart';
import '../game/Color.dart';
import '../game/Game.dart';
import '../items/Item.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'InventoryActions.dart';

class BagMenu {
  static int _menuType = BagMenuTypes.ACTION;
  static String _titleAction = _translate("{WarehouseMenuActionTitle}");
  static String _titleType = _translate("{WarehouseMenuTypeTitle}");
  static String _titleItem = _translate("{WarehouseMenuItemTitle}");

  static List<BagAction> _listAction = [
    new BagAction(_translate('{Use items}')),
    new BagAction(_translate('{Remove items}')),
    new BagAction(_translate('{Back}')),
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
      _menuType = BagMenuTypes.ACTION;
    }
    switch (_menuType) {
      case BagMenuTypes.ACTION:
        selectAction();
        break;
      case BagMenuTypes.ITEM_TYPE:
        selectType();
        break;
      case BagMenuTypes.ITEM:
        selectItem();
        break;
    }
  }

  static void selectAction() {
    Game.printOptions(_titleAction, _listAction, _handlerAction, (int no) {},
        isPirntStats: true);
  }

  static void _handlerAction(int no) {
    switch (_menuType) {
      case BagMenuTypes.ACTION:
        _typeOfAction = no;
        _menuType = BagMenuTypes.ITEM_TYPE;
        break;
      case BagMenuTypes.ITEM_TYPE:
        if (no >= _maxTypes || no == -1) {
          _menuType = BagMenuTypes.ACTION;
          break;
        }
        _itemType = no;
        _menuType = BagMenuTypes.ITEM;
        break;
      case BagMenuTypes.ITEM:
        if (no >= _maxItems || no == -1) {
          _menuType = BagMenuTypes.ITEM_TYPE;
          break;
        }
        _itemId = no;
        doAction(_typeOfAction, _itemType, _itemId);
        break;
    }
    if (_typeOfAction <= BagMenuActionTypes.MAX) {
      show();
    }
  }

  static void selectType() {
    List<BagAction> listType = new List();
    List<String> itemTypesList = ItemTypes.asList();
    itemTypesList.forEach((element) {
      listType.add(new BagAction(_translate(element)));
    });
    _maxTypes = itemTypesList.length;
    listType.add(new BagAction(_translate('{Back}')));

    Game.printOptions(_titleType, listType, _handlerAction, (int no) {},
        isPirntStats: true);
  }

  static void selectItem() {
    List<BagAction> listType = new List();
    Map<int, Item> items = Game.hero.bag.items[_itemType];
    items.forEach((key, item) {
      int highTextLen = Color.cyanBold("").length;
      String tName = item.isWear ? Color.cyanBold(item.tName) : item.tName;
      int tNameLen = item.isWear ? tName.length - highTextLen : tName.length;
      String cOfTab = " \t\t\t\t";
      if (tNameLen >= 20) {
        cOfTab = " \t";
      } else if (tNameLen >= 11) {
        cOfTab = " \t\t";
      } else if (tNameLen > 3) {
        cOfTab = " \t\t\t";
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
      listType
          .add(new BagAction("${tName}${cOfTab}(${item.count})\t${benefits}"));
    });
    listType.add(new BagAction(_translate('{Back}')));
    Game.printOptions(_titleItem, listType, _handlerAction, (int no) {},
        isPirntStats: true);
  }

  static void doAction(int typeOfAction, int itemType, int itemId) {
    InventoryActions.doAction(typeOfAction, itemType, itemId, Game.hero.bag,
        type: 1);
  }
}

class BagMenuTypes {
  static const int ACTION = 0;
  static const int ITEM_TYPE = 1;
  static const int ITEM = 2;

  static const int MAX = 2;
}

class BagMenuActionTypes {
  static const int USE = 0;
  static const int REMOVE = 1;

  static const int MAX = 1;
}

class BagAction {
  final String name;
  BagAction(this.name);

  @override
  String toString() {
    return this.name;
  }
}
