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
  static const int COMFORT = 7;
  static const int EXP = 8;
  static const int LVL = 9;

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
      case COMFORT:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{comfort}");
        break;  
      case EXP:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{experience}");
        break;  
      case LVL:
        tName = Language.getTranslation(LanguagesTypes.STATS, "{level}");
        break;
    }
    return tName;
  }
}
