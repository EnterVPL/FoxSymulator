import '../items/Item.dart';

class AnimalsList {
  static Map<String, dynamic> getter = {
    "Chicken": {
      'name': '{chicken}',
      'maxHp': 8,
      'speed': 14,
      'strengh': 4,
      'defence': 2,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1],
          }
        ],
        "exp": 8
      }
    },
    "Turkey": {
      'name': '{Turkey}',
      'maxHp': 20,
      'speed': 40,
      'strengh': 18,
      'defence': 9,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1],
          }
        ],
        "exp": 20
      }
    },
    "Small_dog": {
      'name': '{small_dog}',
      'maxHp': 20,
      'speed': 30,
      'strengh': 10,
      'defence': 5,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [2],
          }
        ],
        "exp": 20
      }
    },
    "Normal_dog": {
      'name': '{normal_dog}',
      'maxHp': 40,
      'speed': 45,
      'strengh': 20,
      'defence': 10,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [2, 2, 8],
          }
        ],
        "exp": 40
      }
    },
    "Big_dog": {
      'name': '{big_dog}',
      'maxHp': 80,
      'speed': 60,
      'strengh': 40,
      'defence': 20,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [2, 2, 2, 9, 10],
          }
        ],
        "exp": 80
      },
    },
    "Hot_dog": {
      'name': '{hot_dog}',
      'maxHp': 100,
      'speed': 70,
      'strengh': 50,
      'defence': 30,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [10, 10, 10, 2, 9],
          }
        ],
        "exp": 100
      },
    },
    "Rabbit": {
      'name': '{rabbit}',
      'maxHp': 4,
      'speed': 70,
      'strengh': 2,
      'defence': 1,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [2],
          }
        ],
        "exp": 4
      }
    },
    "Cow": {
      'name': '{cow}',
      'maxHp': 1440,
      'speed': 40,
      'strengh': 720,
      'defence': 360,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [5, 7, 8, 11],
          }
        ],
        "exp": 720
      },
    },
    "Pig": {
      'name': '{pig}',
      'maxHp': 600,
      'speed': 20,
      'strengh': 300,
      'defence': 150,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [2, 2, 2],
          }
        ],
        "exp": 600
      },
    },
    "Deer": {
      'name': '{deer}',
      'maxHp': 140,
      'speed': 70,
      'strengh': 35,
      'defence': 18,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [4, 8],
          }
        ],
        "exp": 140
      },
    },
    "Bear": {
      'name': '{Bear}',
      'maxHp': 1200,
      'speed': 50,
      'strengh': 600,
      'defence': 300,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [10, 12, 13],
          }
        ],
        "exp": 1200
      },
    },
    "Fox": {
      'name': '{Fox}',
      'maxHp': 28,
      'speed': 50,
      'strengh': 14,
      'defence': 7,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1, 12, 2, 1, 1, 1],
          }
        ],
        "exp": 28
      },
    },
    "Lynx": {
      'name': '{Lynx}',
      'maxHp': 60,
      'speed': 64,
      'strengh': 30,
      'defence': 15,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1, 2, 8, 7],
          }
        ],
        "exp": 60
      },
    },
    "Wolf": {
      'name': '{Wolf}',
      'maxHp': 160,
      'speed': 60,
      'strengh': 80,
      'defence': 40,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [
              8,
              10,
              12,
            ],
          }
        ],
        "exp": 160
      },
    },
    "Rat": {
      'name': '{Rat}',
      'maxHp': 5,
      'speed': 15,
      'strengh': 2,
      'defence': 1,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1],
          }
        ],
        "exp": 5
      },
    },
    "Big rat": {
      'name': '{Big rat}',
      'maxHp': 8,
      'speed': 20,
      'strengh': 4,
      'defence': 3,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1, 2],
          }
        ],
        "exp": 8
      },
    },
    "Too big rat": {
      'name': '{Too big rat}',
      'maxHp': 20,
      'speed': 30,
      'strengh': 10,
      'defence': 4,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1, 1, 2, 2],
          }
        ],
        "exp": 20
      },
    },
    "Spider": {
      'name': '{Spider}',
      'maxHp': 1,
      'speed': 3,
      'strengh': 1,
      'defence': 1,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1],
          }
        ],
        "exp": 5
      },
    },
    "Too_big_spider": {
      'name': '{too_big_spider}',
      'maxHp': 120,
      'speed': 70,
      'strengh': 60,
      'defence': 30,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [8, 10, 12],
          }
        ],
        "exp": 120
      },
    },
    "Forester": {
      'name': '{Forester}',
      'maxHp': 140,
      'speed': 30,
      'strengh': 70,
      'defence': 35,
      'drop': {
        "items": [
          {
            "type": ItemTypes.SHIELD,
            "ids": [0, 1],
          },
          {
            "type": ItemTypes.ARMMOR,
            "ids": [0, 1],
          },
          {
            "type": ItemTypes.FOOD,
            "ids": [8, 11, 12, 13, 9, 10, 7, 6],
          }
        ],
        "exp": 140
      },
    },
    "Goat": {
      'name': '{goat}',
      'maxHp': 280,
      'speed': 24,
      'strengh': 140,
      'defence': 70,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [1, 3, 8],
          }
        ],
        "exp": 280
      },
    },
    "Small fish": {
      'name': '{Small fish}',
      'maxHp': 1,
      'speed': 40,
      'strengh': 1,
      'defence': 1,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [13],
          }
        ],
        "exp": 5
      },
    },
    "Normal fish": {
      'name': '{Normal fish}',
      'maxHp': 20,
      'speed': 80,
      'strengh': 10,
      'defence': 5,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [13, 13, 13],
          }
        ],
        "exp": 20
      },
    },
    "Large fish": {
      'name': '{Large fish}',
      'maxHp': 600,
      'speed': 160,
      'strengh': 300,
      'defence': 150,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [13, 13, 13, 13, 13, 13, 13, 8, 8, 8],
          }
        ],
        "exp": 600
      },
    },
    "Raccoon": {
      'name': '{Raccoon}',
      'maxHp': 18,
      'speed': 24,
      'strengh': 9,
      'defence': 5,
      'drop': {
        "items": [
          {
            "type": ItemTypes.FOOD,
            "ids": [0, 0],
          },
          {
            "type": ItemTypes.ARMMOR,
            "ids": [0, 0],
          }
        ],
        "exp": 18
      },
    },
    "Clockwork dog": {
      'name': '{Clockwork dog}',
      'maxHp': 1000,
      'speed': 50,
      'strengh': 500,
      'defence': 300,
      'drop': {
        "items": [
          {
            "type": ItemTypes.WEAPON,
            "ids": [1],
          },
          {
            "type": ItemTypes.SHIELD,
            "ids": [1],
          },
          {
            "type": ItemTypes.ARMMOR,
            "ids": [1],
          }
        ],
        "exp": 1000
      },
    }
  };
}
