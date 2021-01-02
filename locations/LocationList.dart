/// Saved each location / action / animal / etc. etc.
class LocationList {
  static List<Map<String, dynamic>> get globalActions {
    return [
      {'name': '{Hunting}', 'handlerName': 'hunting'},
      {'name': '{Change location}', 'handlerName': 'changeLocation'},
      {'name': '{Check bag}', 'handlerName': 'bagInventory'},
      {'name': '{Go to home}', 'handlerName': 'gotoHome'}
    ];
  }

  static getJsonLocationList() {
    return [
      {
        'name': '{home}',
        'animals': [
          {
            'name': '{friend}',
            'maxHp': 50,
            'speed': 30,
            'strengh': 5,
            'defence': 20
          }
        ],
        'actions': [
          {'name': '{Talking with Friend}', 'handlerName': 'talkingWithFriend'},
          {'name': '{Change location}', 'handlerName': 'changeLocation'},
          {'name': '{Go sleep and save game}', 'handlerName': 'goSleep'},
          {'name': '{Check bag}', 'handlerName': 'bagInventory'},
          {'name': '{Check warehouse}', 'handlerName': 'warehouseInventory'},
          {'name': '{Change language}', 'handlerName': 'changeLanguage'},
          {'name': '{Exit from game}', 'handlerName': 'exit'}
        ]
      },
      {
        'name': '{chicken_farm}',
        'animals': [
          {
            'name': '{chicken}',
            'maxHp': 8,
            'speed': 14,
            'strengh': 4,
            'defence': 2,
            'loot': {"min": 1, "max": 20}
          },
          {
            'name': '{Turkey}',
            'maxHp': 22,
            'speed': 13,
            'strengh': 11,
            'defence': 6,
            'loot': {"min": 1, "max": 45}
          },
          {
            'name': '{small_dog}',
            'maxHp': 14,
            'speed': 24,
            'strengh': 7,
            'defence': 3,
            'loot': {"min": 3, "max": 50}
          },
          {
            'name': '{normal_dog}',
            'maxHp': 30,
            'speed': 48,
            'strengh': 15,
            'defence': 7,
            'loot': {"min": 10, "max": 65}
          },
        ],
        'actions': globalActions
      },
      {
        'name': '{Rabbit_farm}',
        'animals': [
          {
            'name': '{rabbit}',
            'maxHp': 6,
            'speed': 70,
            'strengh': 3,
            'defence': 1,
            'loot': {"min": 1, "max": 40}
          },
          {
            'name': '{small_dog}',
            'maxHp': 14,
            'speed': 24,
            'strengh': 7,
            'defence': 3,
            'loot': {"min": 3, "max": 50}
          },
          {
            'name': '{normal_dog}',
            'maxHp': 30,
            'speed': 48,
            'strengh': 15,
            'defence': 7,
            'loot': {"min": 10, "max": 65}
          }
        ],
        'actions': globalActions
      },
      {
        'name': '{Dairy_farm}',
        'animals': [
          {
            'name': '{cow}',
            'maxHp': 1440,
            'speed': 40,
            'strengh': 720,
            'defence': 360,
            'loot': {"min": 15, "max": 65}
          },
          {
            'name': '{pig}',
            'maxHp': 500,
            'speed': 18,
            'strengh': 250,
            'defence': 125,
            'loot': {"min": 5, "max": 40}
          },
          {
           'name': '{small_dog}',
            'maxHp': 14,
            'speed': 24,
            'strengh': 7,
            'defence': 3,
            'loot': {"min": 3, "max": 50}
          },
          {
            'name': '{normal_dog}',
            'maxHp': 30,
            'speed': 48,
            'strengh': 15,
            'defence': 7,
            'loot': {"min": 10, "max": 65}
          },
          {
            'name': '{big_dog}',
            'maxHp': 50,
            'speed': 25,
            'strengh': 9,
            'defence': 8,
            'loot': {"min": 20, "max": 100}
          },
          {
            'name': '{hot_dog}',
            'maxHp': 36,
            'speed': 69,
            'strengh': 18,
            'defence': 9,
            'loot': {"min": 50, "max": 110}
          },
        ],
        'actions': globalActions
      },
      {
        'name': '{Sunny forest}',
        'animals': [
          {
            'name': '{deer}',
            'maxHp': 1600,
            'speed': 48,
            'strengh': 80,
            'defence': 40,
            'loot': {"min": 15, "max": 65}
          },
          {
            'name': '{Bear}',
            'maxHp': 1240,
            'speed': 35,
            'strengh': 620,
            'defence': 310,
            'loot': {"min": 40, "max": 120}
          },
          {
            'name': '{Fox}',
            'maxHp': 36,
            'speed': 50,
            'strengh': 14,
            'defence': 7,
            'loot': {"min": 1, "max": 1000}
          },
          {
            'name': '{Lynx}',
            'maxHp': 18,
            'speed': 80,
            'strengh': 9,
            'defence': 4,
            'loot': {"min": 4, "max": 50}
          },
          {
            'name': '{Wolf}',
            'maxHp': 160,
            'speed': 60,
            'strengh': 80,
            'defence': 40,
            'loot': {"min": 20, "max": 70}
          },
          {
            'name': '{Rat}',
            'maxHp': 4,
            'speed': 15,
            'strengh': 2,
            'defence': 1,
            'loot': {"min": 1, "max": 20}
          },
          {
            'name': '{too_big_spider}',
            'maxHp': 60,
            'speed': 30,
            'strengh': 15,
            'defence': 10,
            'loot': {"min": 100, "max": 200}
          },
          {
            'name': '{Forester}',
            'maxHp': 160,
            'speed': 25,
            'strengh': 80,
            'defence': 40,
            'loot': {"min": 15, "max": 65}
          },
        ],
        'actions': globalActions
      },
      {
        'name': '{Picnic forest}',
        'animals': [
          {
            'name': '{deer}',
            'maxHp': 40,
            'speed': 20,
            'strengh': 6,
            'defence': 5,
            'loot': {"min": 15, "max": 65}
          },
          {
            'name': '{Rat}',
            'maxHp': 5,
            'speed': 15,
            'strengh': 2,
            'defence': 1,
            'loot': {"min": 1, "max": 20}
          },
          {
            'name': '{Spider}',
            'maxHp': 5,
            'speed': 3,
            'strengh': 1,
            'defence': 1,
            'loot': {"min": 1, "max": 10}
          },
          {
            'name': '{Forester}',
            'maxHp': 25,
            'speed': 10,
            'strengh': 6,
            'defence': 5,
            'loot': {"min": 15, "max": 65}
          },
        ],
        'actions': globalActions
      },
      {
        'name': '{moutain}',
        'animals': [
          {
            'name': '{goat}',
            'maxHp': 280,
            'speed': 24,
            'strengh': 140,
            'defence': 70,
            'loot': {"min": 50, "max": 205}
          },
          {
            'name': '{Lynx}',
            'maxHp': 20,
            'speed': 13,
            'strengh': 4,
            'defence': 7,
            'loot': {"min": 4, "max": 50}
          },
          {
            'name': '{Wolf}',
            'maxHp': 28,
            'speed': 17,
            'strengh': 8,
            'defence': 8,
            'loot': {"min": 20, "max": 70}
          },
          {
            'name': '{Bear}',
            'maxHp': 50,
            'speed': 15,
            'strengh': 10,
            'defence': 5,
            'loot': {"min": 40, "max": 120}
          }
        ],
        'actions': globalActions
      },
      {
        'name': '{riven}',
        'animals': [
          {
            'name': '{Small fish}',
            'maxHp': 1,
            'speed': 15,
            'strengh': 1,
            'defence': 1,
            'loot': {"min": 15, "max": 35}
          },
          {
            'name': '{Normal fish}',
            'maxHp': 10,
            'speed': 15,
            'strengh': 2,
            'defence': 2,
            'loot': {"min": 15, "max": 45}
          },
          {
            'name': '{Large fish}',
            'maxHp': 20,
            'speed': 20,
            'strengh': 3,
            'defence': 3,
            'loot': {"min": 15, "max": 55}
          },
          {
            'name': '{Bear}',
            'maxHp': 50,
            'speed': 15,
            'strengh': 10,
            'defence': 5,
            'loot': {"min": 40, "max": 120}
          },
          {
            'name': '{deer}',
            'maxHp': 40,
            'speed': 20,
            'strengh': 6,
            'defence': 5,
            'loot': {"min": 15, "max": 65}
          }
        ],
        'actions': globalActions
      },
      {
        'name': '{Landfill}',
        'animals': [
          {
            'name': '{Rat}',
            'maxHp': 5,
            'speed': 15,
            'strengh': 2,
            'defence': 1,
            'loot': {"min": 1, "max": 20}
          },
          {
            'name': '{Big rat}',
            'maxHp': 10,
            'speed': 15,
            'strengh': 4,
            'defence': 3,
            'loot': {"min": 5, "max": 30}
          },
          {
            'name': '{Too big rat}',
            'maxHp': 20,
            'speed': 20,
            'strengh': 5,
            'defence': 4,
            'loot': {"min": 30, "max": 65}
          },
          {
            'name': '{Raccoon}',
            'maxHp': 20,
            'speed': 15,
            'strengh': 5,
            'defence': 3,
            'loot': {"min": 10, "max": 50}
          },
          {
            'name': '{big_dog}',
            'maxHp': 50,
            'speed': 25,
            'strengh': 9,
            'defence': 8,
            'loot': {"min": 20, "max": 100}
          },
          {
            'name': '{Clockwork dog}',
            'maxHp': 20,
            'speed': 25,
            'strengh': 9,
            'defence': 13,
            'loot': {"min": 60, "max": 205}
          }
        ],
        'actions': globalActions
      }
    ];
  }
}
