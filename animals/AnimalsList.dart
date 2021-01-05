import '../items/Item.dart';

class AnimalsList {
  static Map<String, dynamic> getter = {
    "Chicken": {
      'name': '{chicken}',
      'maxHp': 8,
      'speed': 14,
      'strengh': 4,
      'defence': 2,
      'loot': {"min": 1, "max": 20},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 8
      }
    },
    "Turkey": {
      'name': '{Turkey}',
      'maxHp': 20,
      'speed': 40,
      'strengh': 18,
      'defence': 9,
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
      'speed': 30,
      'strengh': 10,
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
      'maxHp': 40,
      'speed': 45,
      'strengh': 20,
      'defence': 10,
      'loot': {"min": 10, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 40
      }
    },
    "Big_dog": {
      'name': '{big_dog}',
      'maxHp': 80,
      'speed': 60,
      'strengh': 40,
      'defence': 20,
      'loot': {"min": 20, "max": 100},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 80
      },
    },
    "Hot_dog": {
      'name': '{hot_dog}',
      'maxHp': 100,
      'speed': 70,
      'strengh': 50,
      'defence': 30,
      'loot': {"min": 50, "max": 110},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 100
      },
    },
    "Rabbit": {
      'name': '{rabbit}',
      'maxHp': 4,
      'speed': 70,
      'strengh': 2,
      'defence': 1,
      'loot': {"min": 1, "max": 40},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 4
      }
    },
    "Cow": {
      'name': '{cow}',
      'maxHp': 1440,
      'speed': 40,
      'strengh': 720,
      'defence': 360,
      'loot': {"min": 15, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 720
      },
    },
    "Pig": {
      'name': '{pig}',
      'maxHp': 600,
      'speed': 20,
      'strengh': 300,
      'defence': 150,
      'loot': {"min": 5, "max": 40},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 600
      },
    },
    "Deer": {
      'name': '{deer}',
      'maxHp': 140,
      'speed': 70,
      'strengh': 35,
      'defence': 18,
      'loot': {"min": 15, "max": 65},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 140
      },
    },
    "Bear": {
      'name': '{Bear}',
      'maxHp': 1200,
      'speed': 50,
      'strengh': 600,
      'defence': 300,
      'loot': {"min": 40, "max": 120},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 1200
      },
    },
    "Fox": {
      'name': '{Fox}',
      'maxHp': 28,
      'speed': 50,
      'strengh': 14,
      'defence': 7,
      'loot': {"min": 1, "max": 1000},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 28
      },
    },
    "Lynx": {
      'name': '{Lynx}',
      'maxHp': 60,
      'speed': 64,
      'strengh': 30,
      'defence': 15,
      'loot': {"min": 4, "max": 50},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 60
      },
    },
    "Wolf": {
      'name': '{Wolf}',
      'maxHp': 160,
      'speed': 60,
      'strengh': 80,
      'defence': 40,
      'loot': {"min": 20, "max": 70},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 160
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
      'maxHp': 8,
      'speed': 20,
      'strengh': 4,
      'defence': 3,
      'loot': {"min": 5, "max": 30},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 8
      },
    },
    "Too big rat": {
      'name': '{Too big rat}',
      'maxHp': 20,
      'speed': 30,
      'strengh': 10,
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
      'maxHp': 1,
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
      'maxHp': 280,
      'speed': 24,
      'strengh': 140,
      'defence': 70,
      'loot': {"min": 50, "max": 205},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 280
      },
    },
    "Small fish": {
      'name': '{Small fish}',
      'maxHp': 1,
      'speed': 40,
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
      'maxHp': 20,
      'speed': 80,
      'strengh': 10,
      'defence': 5,
      'loot': {"min": 15, "max": 45},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 20
      },
    },
    "Large fish": {
      'name': '{Large fish}',
      'maxHp': 600,
      'speed': 160,
      'strengh': 300,
      'defence': 150,
      'loot': {"min": 15, "max": 55},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 600
      },
    },
    "Raccoon": {
      'name': '{Raccoon}',
      'maxHp': 18,
      'speed':24,
      'strengh': 9,
      'defence': 5,
      'loot': {"min": 10, "max": 50},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 18
      },
    },
    "Clockwork dog": {
      'name': '{Clockwork dog}',
      'maxHp': 1000,
      'speed': 50,
      'strengh': 500,
      'defence': 300,
      'loot': {"min": 60, "max": 205},
      'drop': {
        "itemType": ItemTypes.FOOD,
        "ids": [1],
        "exp": 1000
      },
    }
  };
}
