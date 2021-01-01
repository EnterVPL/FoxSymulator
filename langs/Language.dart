import 'dart:io';
import 'dart:convert';

import 'LanguagesTypes.dart';

class Language {
  static String currentLang = "EN";
  static String emergencyLang = 'EN';
  static Map<String, dynamic> translations = new Map();
  static List<ActiveLanguage> activeLangs = [
    new ActiveLanguage("EN"),
    new ActiveLanguage("PL")
  ];

  static String getTranslation(int type, String key) {
    String text;
    if (translations[currentLang][type].containsKey(key)) {
      text = translations[currentLang][type][key];
    } else {
      text = translations[emergencyLang][type][key];
      translations[currentLang][type].putIfAbsent(key, () => text);
    }
    return text;
  }

  static List<ActiveLanguage> getActive() {
    return activeLangs;
  }

  static void loadTranslations() {
    activeLangs.forEach((lang) {
      translations.putIfAbsent(lang.name, () => {});
    });
    activeLangs.forEach((lang) {
      for (int type = 0; type <= LanguagesTypes.LAST; type++) {
        String path = 'langs/${lang.name}/';
        switch (type) {
          case LanguagesTypes.ACTIONS:
            path += 'actions';
            break;
          case LanguagesTypes.ANIMALS:
            path += 'animals';
            break;
          case LanguagesTypes.LOCATIONS:
            path += 'locations';
            break;
          case LanguagesTypes.OPTIONS:
            path += 'options';
            break;
          case LanguagesTypes.STATS:
            path += 'stats';
            break;
          case LanguagesTypes.FRIEND:
            path += 'friend';
            break;
          case LanguagesTypes.ITEMS:
            path += 'items';
            break;
          case LanguagesTypes.INVENTORY:
            path += 'inventory';
            break;
        }
        String data = File('$path.json').readAsStringSync();
        if (data == '') continue;
        Map<String, dynamic> dataJson = json.decode(data);
        translations[lang.name].putIfAbsent(type, () => dataJson);
      }
    });
  }
}

class ActiveLanguage {
  final String name;
  ActiveLanguage(this.name);

  @override
  String toString() {
    return this.name;
  }
}
