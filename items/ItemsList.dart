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
          'benefits': {StatsType.SATIETY: 1}
        },
        {
          'id': 1,
          'name': '{Meat}',
          'benefits': {StatsType.SATIETY: 2}
        },
        {
          'id': 2,
          'name': '{Cake}',
          'benefits': {StatsType.SATIETY: 3}
        },
        {
          'id': 3,
          'name': '{Cake of meat}',
          'benefits': {StatsType.SATIETY: 4, StatsType.ACCTUALHP: 1}
        },
        {
          'id': 4,
          'name': '{Energy bar}',
          'benefits': {StatsType.SATIETY: 3, StatsType.ENERGY: 1}
        },
        {
          'id': 5,
          'name': '{Spicy hot dog}',
          'benefits': {StatsType.SATIETY: 6, StatsType.ACCTUALHP: -1}
        },
        {
          'id': 6,
          'name': '{Golden donut}',
          'benefits': {
            StatsType.SATIETY: 4,
            StatsType.ACCTUALHP: -2,
            StatsType.SPEED: 4
          }
        },
      ],
      ItemTypes.SHIELD: [
        {
          'id': 0,
          'name': '{Weak shield}',
          'benefits': {StatsType.DEFENCE: 1}
        },
        {
          'id': 1,
          'name': '{Normal shield}',
          'benefits': {StatsType.DEFENCE: 2}
        },
        {
          'id': 2,
          'name': '{Energy shield}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1}
        },
        {
          'id': 3,
          'name': '{Ironing board}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2}
        },
      ],
      ItemTypes.ARMMOR: [
        {
          'id': 0,
          'name': '{Weak Armmor}',
          'benefits': {StatsType.DEFENCE: 1}
        },
        {
          'id': 1,
          'name': '{Normal Armmor}',
          'benefits': {StatsType.DEFENCE: 2}
        },
        {
          'id': 2,
          'name': '{Energy Armmor}',
          'benefits': {StatsType.DEFENCE: 3, StatsType.SPEED: 1}
        },
        {
          'id': 3,
          'name': '{Pan Armmor}',
          'benefits': {StatsType.DEFENCE: 4, StatsType.SPEED: 2}
        },
      ],
      ItemTypes.WEAPON: [
        {
          'id': 0,
          'name': '{Weak Weapon}',
          'benefits': {StatsType.STRENGH: 1}
        },
        {
          'id': 1,
          'name': '{Normal Weapon}',
          'benefits': {StatsType.STRENGH: 2}
        },
        {
          'id': 2,
          'name': '{Energy Weapon}',
          'benefits': {StatsType.STRENGH: 3, StatsType.SPEED: 1}
        },
        {
          'id': 3,
          'name': "{Dragon's breath sword}",
          'benefits': {StatsType.STRENGH: 4, StatsType.SPEED: 2}
        },
      ]
    };
  }
}
