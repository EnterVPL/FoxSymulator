import 'dart:io';
import 'dart:convert';

import 'LanguagesTypes.dart';

class Language {
    static String currentLang = "EN";
    static Map<String, dynamic> translations = new Map();
    static List<ActiveLanguage> activeLangs = [
        new ActiveLanguage("EN"),
        new ActiveLanguage("PL")
    ];

    static String getTranslation(int type, String key) {
        return translations[currentLang][type][key];
    }

    static List<ActiveLanguage> getActive() {
        return activeLangs;
    }

    static void loadTranslations() {
        activeLangs.forEach((lang) {
            translations.putIfAbsent(lang.name, () => {});
        });
        activeLangs.forEach((lang) {
            for(int type = 0; type <= LanguagesTypes.LAST; type++) {
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
                }
                String data = File('$path.json').readAsStringSync();
                if(data == '') continue;
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

