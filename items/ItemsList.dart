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
          'name': '{Poultry}',
          'benefits': {StatsType.SATIETY: 2},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 2,
          'name': '{Meat}',
          'benefits': {StatsType.SATIETY: 2},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 3,
          'name': '{Goat meat}',
          'benefits': {StatsType.SATIETY: 3},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 4,
          'name': '{Venison}',
          'benefits': {StatsType.SATIETY: 5, StatsType.ACCTUALHP: 1},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 5,
          'name': '{Beef}',
          'benefits': {StatsType.SATIETY: 10, StatsType.ACCTUALHP: 5},
          'chance': {"min": 15, "max": 30}
        },
        {
          'id': 6,
          'name': '{Cake}',
          'benefits': {StatsType.SATIETY: 3},
          'chance': {"min": 40, "max": 60}
        },
        {
          'id': 7,
          'name': '{Cake of meat}',
          'benefits': {StatsType.SATIETY: 4, StatsType.ACCTUALHP: 1},
          'chance': {"min": 50, "max": 60}
        },
        {
          'id': 8,
          'name': '{Energy bar}',
          'benefits': {StatsType.SATIETY: 3, StatsType.ENERGY: 1},
          'chance': {"min": 55, "max": 70}
        },
        {
          'id': 9,
          'name': '{Spicy hot dog}',
          'benefits': {StatsType.SATIETY: 6, StatsType.ACCTUALHP: -1},
          'chance': {"min": 50, "max": 60}
        },
        {
          'id': 10,
          'name': '{Golden donut}',
          'benefits': {
            StatsType.SATIETY: 4,
            StatsType.ACCTUALHP: -2,
            StatsType.SPEED: 4
          },
          'chance': {"min": 100, "max": 105}
        },
        {
          'id': 11,
          'name': "{Crunchy goose}",
          'benefits': {
            StatsType.SATIETY: 4,
            StatsType.ACCTUALHP: 2,
          },
          'chance': {"min": 70, "max": 110}
        },
        {
          'id': 12,
          'name': '{Strawberry cake}',
          'benefits': {StatsType.SATIETY: 5, StatsType.ACCTUALHP: 2},
          'chance': {"min": 80, "max": 110}
        },
        {
          'id': 13,
          'name': '{Raw fish}',
          'benefits': {StatsType.SATIETY: 2},
          'chance': {"min": 15, "max": 30}
        },
      ],
      ItemTypes.SHIELD: [
        {
          'id': 0,
          'name': '{Wood shield}',
          'benefits': {StatsType.DEFENCE: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Iron shield}',
          'benefits': {StatsType.DEFENCE: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Mithril shield}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.STRENGH: 1},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 3,
          'name': '{Energy shield}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 4,
          'name': '{Ironing board}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
        {
          'id': 5,
          'name': '{Crystal shield}',
          'benefits': {StatsType.DEFENCE: 5},
          'chance': {"min": 200, "max": 205}
        },
      ],
      ItemTypes.ARMMOR: [
        {
          'id': 0,
          'name': '{Wood Armmor}',
          'benefits': {StatsType.DEFENCE: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Iron Armmor}',
          'benefits': {StatsType.DEFENCE: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Mithril Armmor}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.STRENGH: 1},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 3,
          'name': '{Energy Armmor}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 4,
          'name': '{Pan Armmor}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
        {
          'id': 5,
          'name': '{Crtystal Armmor}',
          'benefits': {StatsType.DEFENCE: 5},
          'chance': {"min": 100, "max": 110}
        },
      ],
      ItemTypes.WEAPON: [
        {
          'id': 0,
          'name': '{Wood Weapon}',
          'benefits': {StatsType.STRENGH: 1},
          'chance': {"min": 30, "max": 40}
        },
        {
          'id': 1,
          'name': '{Iron Weapon}',
          'benefits': {StatsType.STRENGH: 2},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 2,
          'name': '{Mithril Weapon}',
          'benefits': {StatsType.STRENGH: 4},
          'chance': {"min": 60, "max": 70}
        },
        {
          'id': 3,
          'name': '{Energy Weapon}',
          'benefits': {StatsType.STRENGH: 3, StatsType.SPEED: 1},
          'chance': {"min": 100, "max": 110}
        },
        {
          'id': 4,
          'name': "{Dragon's breath sword}",
          'benefits': {StatsType.STRENGH: 4, StatsType.SPEED: 2},
          'chance': {"min": 200, "max": 205}
        },
        {
          'id': 5,
          'name': '{Crystal Weapon}',
          'benefits': {StatsType.STRENGH: 3, StatsType.DEFENCE: 2},
          'chance': {"min": 100, "max": 110}
        },
      ]
    };
  }
}
