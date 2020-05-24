import '../animals/Fox.dart';

class LocationList
{
  static getJsonLocationList() {
      return [
      {
        'name': 'Home',
        'animals': [
          {
            'name' : 'Friend',
            'maxHp' : 50,
            'speed' : 30,
            'strengh' : 5,
            'defence' : 20
          }
        ],
        'actions' : [
          {
            'name' : 'Talking with Friend',
            'handlerName' : 'talkingWithFriend'
          },
          {
            'name' : 'Change location',
            'handlerName' : 'changeLocation'
          }
        ]
      },
      {
        'name': 'Farm',
        'animals': [
          {
            'name' : 'Chicken',
            'maxHp' : 10,
            'speed' : 10,
            'strengh' : 2,
            'defence' : 2,
            'howMany' : 15
          },
          {
            'name' : 'Rabbit',
            'maxHp' : 10,
            'speed' : 20,
            'strengh' : 3,
            'defence' : 3,
            'howMany' : 30
          },
        ],
        'actions' : [
          {
            'name' : 'Hunting',
            'handlerName' : 'hunting'
          },
          {
            'name' : 'Change location',
            'handlerName' : 'changeLocation'
          }
        ]
      },
      {
        'name' : 'Void',
        'actions' : [
          {
            'name' : 'Change location',
            'handlerName' : 'changeLocation'
          }
        ]
      }
    ];
  }
  
}