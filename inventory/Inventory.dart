import '../items/Item.dart';

class Inventory {
  // map<type, <id, item>>
  Map<int, Map<int, Item>> items;

  Inventory() {
    this.items = new Map();
  }

  addItem(Item item) {
    items.putIfAbsent(item.type, () => {item.id: item});
    items[item.type].putIfAbsent(item.id, () => item);
  }

  addItemByIds(int type, int id) {
    items[type][id].count++;
    return items[type][id];
  }

  String toJson() {
    Map<String, String> json = new Map();
    items.forEach((type, itemslist) {
      itemslist.forEach((id, item) {
        json.putIfAbsent('"${type}_${item.id}"', () => item.toString());
      });
    });
    return json.toString();
  }
}
