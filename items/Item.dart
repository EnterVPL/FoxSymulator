class Item {
  final int id;
  final String name;

  /// use ItemTypes
  final int type;

  /// map<stat, count>
  final Map<int, int> benefits;
  int count;

  Item(this.id, this.name, this.type, this.benefits) {
    this.count = 0;
  }

  Map<int, int> useIt() {
    if (count <= 0) {
      return {0: 0};
    }
    count--;
    return benefits;
  }

  @override
  String toString() {
    Map<String, int> ben = new Map();
    benefits.forEach((stat, count) {
      ben.putIfAbsent('"$stat"', () => count);
    });
    return '{ "id": $id, "name": "$name", "type": $type, "benefits": $ben, "count": $count }';
  }
}

class ItemTypes {
  static const int FOOD = 0;
  static const int SHIELD = 1;
  static const int ARMMOR = 2;
  static const int WEAPON = 3;
}
