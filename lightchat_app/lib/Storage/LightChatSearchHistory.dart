import 'dart:async';

import "package:shared_preferences/shared_preferences.dart";

Future<List<String>?> getLightChatSearchHistory() {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("SearchHistory");
  });
}

Future<void> deleteLightChatSearchHistory() {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("SearchHistory");
  });
}

Future<void> setLightChatSearchHistory(List<String> words) {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("SearchHistory", words);
  });
}
