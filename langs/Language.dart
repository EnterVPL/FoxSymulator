import 'dart:io';
import 'dart:convert';

import 'LanguagesTypes.dart';

class Language {
    static String currentLang = "EN";
    static List<String> activeLangs = ["EN", "PL"];

    static String getTranslation(int type, String key) {

        String path = 'langs/${currentLang}/';
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
        String data = _getTranslationData('${path}.json');
        String text = _getTextByKey(data, key);
        return text;

    }

    static String _getTranslationData(String path) {
        if (File(path).existsSync()) {
            String data = File(path).readAsStringSync();
            return '$data';
        }
    }

    static String _getTextByKey(String data, String key) {
        Map<String, dynamic> dataJson = json.decode(data);
        return dataJson[key];
    }

}