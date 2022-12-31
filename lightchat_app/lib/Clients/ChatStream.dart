import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:lightchat_app/Storage/LightChatMessageReadRecord.dart';
import 'package:lightchat_app/proto/MessageManager.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:fixnum/fixnum.dart" as $fixnum;

import '../config.dart';

late StreamController<MessageTile> chatStreamController;
StreamSubscription? chatStreamSubscription;

Future startListenChatStream() {
  return Future(() async {
    final prefs = await SharedPreferences.getInstance();
    final myId = prefs.getString("ID");
    if (myId == null) {
      return;
    }
    await stopListenChatStream();
    final socket = await WebSocket.connect(chatStreamUrl);
    socket.add(myId);
    chatStreamSubscription = socket.listen((message) async {
      checkUnreadController.add(1);
      final messageMap = json.decode(message);
      var messageTile = MessageTile(
        messageId: messageMap["messageId"],
        countId: messageMap["countId"] == null ? $fixnum.Int64(0) : $fixnum.Int64(messageMap["countId"]),
        userId: messageMap["userId"],
        type: messageMap["type"] == null ? MessageType.TEXT : MessageType.valueOf(messageMap["type"]),
        content: messageMap["content"] ?? "",
        size: messageMap["size"] == null ? $fixnum.Int64(0) : $fixnum.Int64(messageMap["size"]),
        timestamp: $fixnum.Int64(messageMap["timestamp"])
      );
      chatStreamController.add(messageTile);
    }, onDone: () {
      startListenChatStream().then((value) {});
    });
  });
}

Future stopListenChatStream() {
  return Future(() async {
    if (chatStreamSubscription != null) {
      await chatStreamSubscription!.cancel();
    }
  });
}