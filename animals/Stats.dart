import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';

class StatsType {
  static const int ACCTUALHP = 0;
  static const int MAXHP = 1;
  static const int SPEED = 2;
  static const int STRENGH = 3;
  static const int DEFENCE = 4;
  static const int SATIETY = 5;
  static const int ENERGY = 6;

  static String getName(int type) {
    String tName = '';
    switch (type) {
      case ACCTUALHP:
      case MAXHP:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{HP}");
        break;
      case SPEED:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{speed}");
        break;
      case STRENGH:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{strengh}");
        break;
      case DEFENCE:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{defence}");
        break;
      case SATIETY:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{satiety}");
        break;
      case ENERGY:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{energy}");
        break;
    }
    return tName;
  }
}
