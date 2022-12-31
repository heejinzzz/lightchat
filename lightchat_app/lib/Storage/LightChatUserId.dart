import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/LoginPage.dart';

Future<String?> getMyId(BuildContext context) {
  return Future(() async {
    var prefs = await SharedPreferences.getInstance();
    var id = prefs.getString("ID");
    if (id == null) {
      prefs.getKeys().forEach((key) async {
        await prefs.remove(key);
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }),
              (route) => false
      );
      return null;
    }
    return id;
  });
}