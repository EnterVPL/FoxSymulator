import '../game/Game.dart';

class WarehouseMenu {
  static String _titleAction = "{WarehouseMenuActionTitle}";
  static List<WarehouseAction> _listAction = [
    new WarehouseAction('Get items'),
    new WarehouseAction('Use items'),
    new WarehouseAction('Put items'),
    new WarehouseAction('Remove items'),
    new WarehouseAction('Back'),
  ];

  static void selectAction() {
    Game.printOptions(
        _titleAction, _listAction, _handlerAction, _handlerMistake);
  }

  static void _handlerAction(int no) {
    print(no);
  }

  static void _handlerMistake(int no) {
    print(no);
  }
}

class WarehouseMenuActionTypes {
  static const int GET = 0;
  static const int USE = 1;
  static const int PUT = 2;
  static const int REMOVE = 3;
  static const int BACK = 4;
}

class WarehouseAction {
  final String name;
  WarehouseAction(this.name);

  @override
  String toString() {
    return this.name;
  }
}
