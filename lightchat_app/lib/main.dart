import 'dart:async';

import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:lightchat_app/Clients/ChatStream.dart';
import 'package:lightchat_app/Clients/FriendCircleManager.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/LoginPage.dart';
import 'package:lightchat_app/Storage/LightChatMessageReadRecord.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "Pages/HomePages.dart";
import "package:permission_handler/permission_handler.dart";
import "package:flutter/services.dart";
import "Clients/UserManagerClient.dart";

_requestPermissions() async {
  await Permission.storage.request();
  await Permission.camera.request();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,   // 竖屏 Portrait 模式
    DeviceOrientation.portraitDown,
  ]);
  connectUserManager();
  connectFriendManager();
  connectFriendCircleManager();
  connectMessageManager();
  chatStreamController = StreamController.broadcast();
  checkUnreadController = StreamController.broadcast();
  await startListenChatStream();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  Future<bool> _checkLogin() {
    return Future(() async {
      var prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("ID")) {
        return true;
      }
      return false;
    });
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '轻聊',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("zh", "CH")
      ],
      home: FutureBuilder(
        future: _checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return snapshot.data as bool
                  ? const HomePages()
                  : const LoginPage();
            }
          }
          return const ColoredBox(
              color: Colors.white, child: LightChatLoadingPage());
        },
      )
    );
  }
}
