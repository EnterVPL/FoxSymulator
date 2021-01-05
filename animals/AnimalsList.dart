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
        "ids": [1],
        "exp": 10
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
        "ids": [1],
        "exp": 20
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
        "ids": [1],
        "exp": 20
      }
    },
    "Normal_dog": {
      'name': '{normal_dog}',
      'maxHp': 30,
      'speed': 20,
      'strengh': 5,
      'defence': 7,
      'loot': {"min": 10, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 30
      }
    },
    "Big_dog": {
      'name': '{big_dog}',
      'maxHp': 50,
      'speed': 25,
      'strengh': 9,
      'defence': 8,
      'loot': {"min": 20, "max": 100},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 50
      },
    },
    "Hot_dog": {
      'name': '{hot_dog}',
      'maxHp': 60,
      'speed': 30,
      'strengh': 9,
      'defence': 8,
      'loot': {"min": 50, "max": 110},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 60
      },
    },
    "Rabbit": {
      'name': '{rabbit}',
      'maxHp': 10,
      'speed': 20,
      'strengh': 3,
      'defence': 2,
      'loot': {"min": 1, "max": 40},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 10
      }
    },
    "Cow": {
      'name': '{cow}',
      'maxHp': 40,
      'speed': 10,
      'strengh': 6,
      'defence': 5,
      'loot': {"min": 15, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 40
      },
    },
    "Pig": {
      'name': '{pig}',
      'maxHp': 20,
      'speed': 10,
      'strengh': 5,
      'defence': 3,
      'loot': {"min": 5, "max": 40},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Deer": {
      'name': '{deer}',
      'maxHp': 40,
      'speed': 20,
      'strengh': 6,
      'defence': 5,
      'loot': {"min": 15, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 40
      },
    },
    "Bear": {
      'name': '{Bear}',
      'maxHp': 50,
      'speed': 15,
      'strengh': 10,
      'defence': 5,
      'loot': {"min": 40, "max": 120},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 50
      },
    },
    "Fox": {
      'name': '{Fox}',
      'maxHp': 25,
      'speed': 15,
      'strengh': 5,
      'defence': 10,
      'loot': {"min": 1, "max": 1000},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 25
      },
    },
    "Lynx": {
      'name': '{Lynx}',
      'maxHp': 20,
      'speed': 13,
      'strengh': 4,
      'defence': 7,
      'loot': {"min": 4, "max": 50},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Wolf": {
      'name': '{Wolf}',
      'maxHp': 28,
      'speed': 17,
      'strengh': 8,
      'defence': 8,
      'loot': {"min": 20, "max": 70},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 30
      },
    },
    "Rat": {
      'name': '{Rat}',
      'maxHp': 5,
      'speed': 15,
      'strengh': 2,
      'defence': 1,
      'loot': {"min": 1, "max": 20},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 5
      },
    },
    "Big rat": {
      'name': '{Big rat}',
      'maxHp': 10,
      'speed': 15,
      'strengh': 4,
      'defence': 3,
      'loot': {"min": 5, "max": 30},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 10
      },
    },
    "Too big rat": {
      'name': '{Too big rat}',
      'maxHp': 20,
      'speed': 20,
      'strengh': 5,
      'defence': 4,
      'loot': {"min": 30, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Spider": {
      'name': '{Spider}',
      'maxHp': 5,
      'speed': 3,
      'strengh': 1,
      'defence': 1,
      'loot': {"min": 1, "max": 10},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 5
      },
    },
    "Too_big_spider": {
      'name': '{too_big_spider}',
      'maxHp': 60,
      'speed': 30,
      'strengh': 15,
      'defence': 10,
      'loot': {"min": 100, "max": 200},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 60
      },
    },
    "Forester": {
      'name': '{Forester}',
      'maxHp': 25,
      'speed': 10,
      'strengh': 6,
      'defence': 5,
      'loot': {"min": 15, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 25
      },
    },
    "Goat": {
      'name': '{goat}',
      'maxHp': 10,
      'speed': 10,
      'strengh': 2,
      'defence': 2,
      'loot': {"min": 50, "max": 205},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 10
      },
    },
    "Small fish": {
      'name': '{Small fish}',
      'maxHp': 1,
      'speed': 15,
      'strengh': 1,
      'defence': 1,
      'loot': {"min": 15, "max": 35},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 5
      },
    },
    "Normal fish": {
      'name': '{Normal fish}',
      'maxHp': 10,
      'speed': 15,
      'strengh': 2,
      'defence': 2,
      'loot': {"min": 15, "max": 45},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 10
      },
    },
    "Large fish": {
      'name': '{Large fish}',
      'maxHp': 20,
      'speed': 20,
      'strengh': 3,
      'defence': 3,
      'loot': {"min": 15, "max": 55},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Raccoon": {
      'name': '{Raccoon}',
      'maxHp': 20,
      'speed': 15,
      'strengh': 5,
      'defence': 3,
      'loot': {"min": 10, "max": 50},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Clockwork dog": {
      'name': '{Clockwork dog}',
      'maxHp': 20,
      'speed': 25,
      'strengh': 9,
      'defence': 13,
      'loot': {"min": 60, "max": 205},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    }
  };
}
