import 'Animals.dart';
import '../game/Game.dart';
import '../langs/Language.dart';
import '../langs/LanguagesTypes.dart';
import 'Stats.dart';

class Friend extends Animals {
  static List<FriendActionName> _optionsListSellPoints = [
    new FriendActionName(ts("{HP}")),
    new FriendActionName(ts("{strengh}")),
    new FriendActionName(ts("{defence}")),
    new FriendActionName(ts("{comfort}")),
    new FriendActionName(ts("{speed}")),
    new FriendActionName(t("{back}"))
  ];

  static String t(String key) {
    return Language.getTranslation(LanguagesTypes.FRIEND, key);
  }

  static String ts(String key) {
    return Language.getTranslation(LanguagesTypes.STATS, key);
  }

  static talkingWithFriend() {
    String hi = t("{hi_friend}");
    hi = hi.replaceAll("{name}", Game.hero.name);
    hi += "\n" + t("{hi_hero}");

    String title = hi + "\n\n" + t("{friend_title}");

    List<FriendActionName> optionsList = [
      new FriendActionName(t("{I want to strengthen myself}")),
      new FriendActionName(t("{exit}"))
    ];
    Game.printOptions(title, optionsList, handlerFirst, handlerMistake);
  }

  static handlerFirst(int choise) {
    switch (choise) {
      case 0:
        sellPoints();
        break;
    }
  }

  static handlerMistake(dynamic choise) {
    print(t("{frined_mistake_handler}") + "\n");
    print(
        Language.getTranslation(LanguagesTypes.OPTIONS, "{enter to continue}"));
  }

  static sellPoints() {
    Game.printOptions(t("{sell_points_title}"), _optionsListSellPoints,
        sellPointsHandeler, handlerMistake,
        isPirntStats: true);
  }

  static sellPointsHandeler(int choise) {
    if (Game.hero.skill_points > 0 &&
        choise != _optionsListSellPoints.length - 1) {
      switch (choise) {
        case 0:
          Game.hero.train(StatsType.MAXHP);
          break;
        case 1:
          Game.hero.train(StatsType.STRENGH);
          break;
        case 2:
          Game.hero.train(StatsType.DEFENCE);
          break;
        case 3:
          Game.hero.train(StatsType.COMFORT);
          break;
        case 4:
          Game.hero.train(StatsType.SPEED);
          break;
      }
      sellPoints();
    } else if (choise == _optionsListSellPoints.length - 1) {
      talkingWithFriend();
    }
  }
}

class FriendActionName {
  final String name;
  FriendActionName(this.name);

  @override
  String toString() {
    return this.name;
  }
}
