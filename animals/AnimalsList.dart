import '../items/Item.dart';

class AnimalsList {
  static Map<String, dynamic> getter = {
    "Chicken": {
      'name': '{chicken}',
      'maxHp': 10,
      'speed': 10,
      'strengh': 2,
      'defence': 2,
      'loot': {"min": 1, "max": 20},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1]
      }
    },
    "Turkey": {
      'name': '{Turkey}',
      'maxHp': 20,
      'speed': 13,
      'strengh': 3,
      'defence': 2,
      'loot': {"min": 1, "max": 45},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1]
      }
    },
    "Small_dog": {
      'name': '{small_dog}',
      'maxHp': 20,
      'speed': 15,
      'strengh': 4,
      'defence': 5,
      'loot': {"min": 3, "max": 50},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1]
      }
    },
  };
}
