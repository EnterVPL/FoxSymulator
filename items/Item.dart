class Item {
  final int id;
  final String name;

  /// use ItemTypes
  final int type;

  /// map<stat, count>
  final Map<int, int> benefits;
  int count;

  Item(this.id, this.name, this.type, this.benefits);

  Map<int, int> useIt() {
    if (count <= 0) {
      return {0: 0};
    }
    count--;
    return benefits;
  }
}

class ItemTypes {
  static const int FOOD = 0;
  static const int SHIELD = 1;
  static const int ARMMOR = 2;
  static const int WEAPON = 3;
}
