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
  static getIt() {
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
      ]
    };
  }
}
