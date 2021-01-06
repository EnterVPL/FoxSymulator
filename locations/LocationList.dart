import '../animals/AnimalsList.dart';

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
            'defence': 20,
            'drop': {
              "itemType": 0,
              "ids": [1],
              "exp": 10
            },
          }
        ],
        'actions': [
          {'name': '{Talking with Friend}', 'handlerName': 'talkingWithFriend'},
          {'name': '{Change location}', 'handlerName': 'changeLocation'},
          {'name': '{Go sleep and save game}', 'handlerName': 'goSleep'},
          {'name': '{Check bag}', 'handlerName': 'bagInventory'},
          {'name': '{Change language}', 'handlerName': 'changeLanguage'},
          {'name': '{Exit from game}', 'handlerName': 'exit'}
        ]
      },
      {
        'name': '{chicken_farm}',
        'animals': [
          AnimalsList.getter["Chicken"],
          AnimalsList.getter["Turkey"],
          AnimalsList.getter["Small_dog"],
          AnimalsList.getter["Normal_dog"],
        ],
        'actions': globalActions
      },
      {
        'name': '{Rabbit_farm}',
        'animals': [
          AnimalsList.getter["Rabbit"],
          AnimalsList.getter["Small_dog"],
          AnimalsList.getter["Normal_dog"],
        ],
        'actions': globalActions
      },
      {
        'name': '{Dairy_farm}',
        'animals': [
          AnimalsList.getter["Cow"],
          AnimalsList.getter["Pig"],
          AnimalsList.getter["Small_dog"],
          AnimalsList.getter["Normal_dog"],
          AnimalsList.getter["Big_dog"],
          AnimalsList.getter["Hot_dog"],
        ],
        'actions': globalActions
      },
      {
        'name': '{Sunny forest}',
        'animals': [
          AnimalsList.getter["Deer"],
          AnimalsList.getter["Bear"],
          AnimalsList.getter["Fox"],
          AnimalsList.getter["Lynx"],
          AnimalsList.getter["Wolf"],
          AnimalsList.getter["Rat"],
          AnimalsList.getter["Too_big_spider"],
          AnimalsList.getter["Forester"],
        ],
        'actions': globalActions
      },
      {
        'name': '{Picnic forest}',
        'animals': [
          AnimalsList.getter["Deer"],
          AnimalsList.getter["Rat"],
          AnimalsList.getter["Spider"],
          AnimalsList.getter["Forester"],
        ],
        'actions': globalActions
      },
      {
        'name': '{moutain}',
        'animals': [
          AnimalsList.getter["Goat"],
          AnimalsList.getter["Lynx"],
          AnimalsList.getter["Wolf"],
          AnimalsList.getter["Bear"],
        ],
        'actions': globalActions
      },
      {
        'name': '{riven}',
        'animals': [
          AnimalsList.getter["Small fish"],
          AnimalsList.getter["Normal fish"],
          AnimalsList.getter["Large fish"],
          AnimalsList.getter["Bear"],
          AnimalsList.getter["Deer"],
        ],
        'actions': globalActions
      },
      {
        'name': '{Landfill}',
        'animals': [
          AnimalsList.getter["Rat"],
          AnimalsList.getter["Big_rat"],
          AnimalsList.getter["Too_big_rat"],
          AnimalsList.getter["Raccoon"],
          AnimalsList.getter["Big_dog"],
          AnimalsList.getter["Clockwork dog"],
        ],
        'actions': globalActions
      }
    ];
  }
}
