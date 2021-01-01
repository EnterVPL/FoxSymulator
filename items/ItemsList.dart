import '../animals/Stats.dart';
import 'Item.dart';

class ItemsList {
  /**
   * type: [
   *  id: {
   *    name: name,
   *    benefits: [
   *      {
   *        stat: count
   *      }
   *    ]
   *  }
   * ]
   */
  static Map<int, List<Map<String, dynamic>>> getIt() {
    return {
      ItemTypes.FOOD: [
        {
          'id': 0,
          'name': '{Apple}',
          'benefits': {StatsType.SATIETY: 1},
          'chance': {"min": 5, "max": 40}
        },
        {
          'id': 1,
          'name': '{Meat}',
          'benefits': {StatsType.SATIETY: 2},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 2,
          'name': '{Cake}',
          'benefits': {StatsType.SATIETY: 3},
          'chance': {"min": 40, "max": 60}
        },
        {
          'id': 3,
          'name': '{Cake of meat}',
          'benefits': {StatsType.SATIETY: 4, StatsType.ACCTUALHP: 1},
          'chance': {"min": 50, "max": 60}
        },
        {
          'id': 4,
          'name': '{Energy bar}',
          'benefits': {StatsType.SATIETY: 3, StatsType.ENERGY: 1},
          'chance': {"min": 55, "max": 70}
        },
        {
          'id': 5,
          'name': '{Spicy hot dog}',
          'benefits': {StatsType.SATIETY: 6, StatsType.ACCTUALHP: -1},
          'chance': {"min": 50, "max": 60}
        },
        {
          'id': 6,
          'name': '{Golden donut}',
          'benefits': {
            StatsType.SATIETY: 4,
            StatsType.ACCTUALHP: -2,
            StatsType.SPEED: 4
          },
          'chance': {"min": 100, "max": 105}
        },
        {
          'id': 7,
          'name': "{Crunchy goose}",
          'benefits': {
            StatsType.SATIETY: 4,
            StatsType.ACCTUALHP: 2,
          },
          'chance': {"min": 70, "max": 110}
        },
        {
          'id': 8,
          'name': '{Strawberry cake}',
          'benefits': {StatsType.SATIETY: 5, StatsType.ACCTUALHP: 2},
          'chance': {"min": 80, "max": 110}
        }
      ],
      ItemTypes.SHIELD: [
        {
          'id': 0,
          'name': '{Weak shield}',
          'benefits': {StatsType.DEFENCE: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Normal shield}',
          'benefits': {StatsType.DEFENCE: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Energy shield}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 3,
          'name': '{Ironing board}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
      ],
      ItemTypes.ARMMOR: [
        {
          'id': 0,
          'name': '{Weak Armmor}',
          'benefits': {StatsType.DEFENCE: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Normal Armmor}',
          'benefits': {StatsType.DEFENCE: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Energy Armmor}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 3,
          'name': '{Pan Armmor}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
      ],
      ItemTypes.WEAPON: [
        {
          'id': 0,
          'name': '{Weak Weapon}',
          'benefits': {StatsType.STRENGH: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Normal Weapon}',
          'benefits': {StatsType.STRENGH: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Energy Weapon}',
          'benefits': {StatsType.STRENGH: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 3,
          'name': "{Dragon's breath sword}",
          'benefits': {StatsType.STRENGH: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
      ]
    };
  }
}
