import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

late StreamController checkUnreadController;

Future<Map<String, int>?> getMessageReadRecord() {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("MessageRead")) {
      return null;
    }
    final messages = prefs.getStringList("MessageRead");
    Map<String, int> map = {};
    for (var message in messages!) {
      final pieces = message.split("-");
      final sessionId = "${pieces[0]}-${pieces[1]}";
      final countId = int.parse(pieces[2]);
      map[sessionId] = countId;
    }
    return map;
  });
}

Future<void> updateMessageReadRecord(String messageId) {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("MessageRead")) {
      await prefs.setStringList("MessageRead", [messageId]);
      return;
    }
    final pieces = messageId.split("-");
    final sessionId = "${pieces[0]}-${pieces[1]}";
    final messages = prefs.getStringList("MessageRead");
    for (var msg in messages!) {
      if (msg.startsWith(sessionId)) {
        messages.remove(msg);
        break;
      }
    }
    messages.add(messageId);
    await prefs.setStringList("MessageRead", messages);
  });
}