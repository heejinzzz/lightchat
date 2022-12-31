import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/ChatPage.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/MessageManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Pages/LoginPage.dart';
import "../Pages/UserProfilePage.dart";
import "package:intl/intl.dart";

import '../Storage/LightChatUserId.dart';

class LightChatSearchResult extends StatefulWidget {
  final String searchWord;

  const LightChatSearchResult({super.key, required this.searchWord});

  @override
  State<StatefulWidget> createState() {
    return _LightChatSearchResultState();
  }

}

class _LightChatSearchResultState extends State<LightChatSearchResult> {
  late List<String> _searchUserIds;
  late List<String> _searchUserNames;
  late List<String> _searchUserAvatarUrls;
  late List<String> _searchFriendIds;
  late List<String> _searchFriendNames;
  late List<String> _searchFriendRemarkNames;
  late List<String> _searchFriendAvatarUrls;
  late List<String> _searchChatRecordContents;
  late List<String> _searchChatRecordNames;
  late List<String> _searchChatRecordAvatarUrls;
  late List<String> _searchChatRecordTimes;
  late List<String> _searchChatRecordSessionId;
  late List<String> _searchChatRecordTargetMessageId;

  Future _loadData() {
    return Future(() async {
      _searchUserIds = [];
      _searchUserNames = [];
      _searchUserAvatarUrls = [];
      _searchFriendIds = [];
      _searchFriendNames = [];
      _searchFriendRemarkNames = [];
      _searchFriendAvatarUrls = [];
      _searchChatRecordContents = [];
      _searchChatRecordNames = [];
      _searchChatRecordAvatarUrls = [];
      _searchChatRecordTimes = [];
      _searchChatRecordSessionId = [];
      _searchChatRecordTargetMessageId = [];
      final searchUserIdRes = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: widget.searchWord));
      if (searchUserIdRes.exist) {
        _searchUserIds.add(widget.searchWord);
        _searchUserNames.add(searchUserIdRes.name);
        _searchUserAvatarUrls.add("http://$fileManagerAddr/avatar/${widget.searchWord}");
      }
      final searchUserNumberRes = await userManagerClient.getUserInfoByNumber(getUserInfoByNumberRequest(number: widget.searchWord));
      if (searchUserNumberRes.exist) {
        _searchUserIds.add(searchUserNumberRes.id);
        _searchUserNames.add(searchUserNumberRes.name);
        _searchUserAvatarUrls.add("http://$fileManagerAddr/avatar/${searchUserNumberRes.id}");
      }
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
        return;
      }
      final getFriendsRes = await friendManagerClient.getFriends(getFriendsRequest(id: id));
      for (var friendId in getFriendsRes.ids) {
        var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: friendId));
        var friendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: id, targetId: friendId));
        if (info.name.contains(widget.searchWord) || friendInfo.remarkName.contains(widget.searchWord)) {
          _searchFriendIds.add(friendId);
          _searchFriendNames.add(info.name);
          _searchFriendRemarkNames.add(friendInfo.remarkName);
          _searchFriendAvatarUrls.add("http://$fileManagerAddr/avatar/$friendId");
        }
      }
      // 从聊天记录中查找关键词
      var searchRes = await messageManagerClient.search(SearchRequest(userId: id, keyword: widget.searchWord));
      for (var message in searchRes.messages) {
        final datetime = DateTime.fromMillisecondsSinceEpoch(message.timestamp.toInt());
        final DateFormat timeFormat = DateFormat("HH:mm");
        var now = DateTime.now();
        final timeText = timeFormat.format(datetime);
        final String dateTimeText;
        if (datetime.year == now.year && datetime.month == now.month && datetime.day == now.day) {
          dateTimeText = timeText;
        } else if (datetime.year == now.year && datetime.month == now.month && datetime.day == now.day-1) {
          dateTimeText = "昨天 $timeText";
        } else if (datetime.year == now.year && datetime.month == now.month && now.day-datetime.day < 7 && now.weekday > datetime.weekday) {
          const temp = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
          dateTimeText = "${temp[datetime.weekday-1]} $timeText";
        } else if (datetime.year == now.year) {
          dateTimeText = "${datetime.month}月${datetime.day}日 $timeText";
        } else {
          dateTimeText = "${datetime.year}年${datetime.month}月${datetime.day}日 $timeText";
        }
        final messageId = message.messageId;
        final pieces = messageId.split("-");
        final String userId;
        if (pieces[0] == id) {
          userId = pieces[1];
        } else {
          userId = pieces[0];
        }
        final targetInfo = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: userId));
        final targetFriendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: id, targetId: userId));
        _searchChatRecordNames.add(targetFriendInfo.isFriend ? targetFriendInfo.remarkName : targetInfo.name);
        _searchChatRecordAvatarUrls.add("http://$fileManagerAddr/avatar/$userId");
        _searchChatRecordContents.add(message.content);
        _searchChatRecordTimes.add(dateTimeText);
        _searchChatRecordSessionId.add("${pieces[0]}-${pieces[1]}");
        _searchChatRecordTargetMessageId.add(messageId);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _searchUserIds = [];
    _searchUserNames = [];
    _searchUserAvatarUrls = [];
    _searchFriendIds = [];
    _searchFriendNames = [];
    _searchFriendRemarkNames = [];
    _searchFriendAvatarUrls = [];
    _searchChatRecordNames = [];
    _searchChatRecordContents = [];
    _searchChatRecordAvatarUrls = [];
    _searchChatRecordTimes = [];
    _searchChatRecordSessionId = [];
    _searchChatRecordTargetMessageId = [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // searchUsersSheet
          var searchUsersSheetTiles = [];
          for (var i = 0; i < _searchUserNames.length; i++) {
            searchUsersSheetTiles.add(
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(_searchUserAvatarUrls[i]),
                    ),
                  ),
                  title: Text(_searchUserNames[i]),
                  onTap: () {
                    // 跳转到个人信息页
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return UserProfilePage(userId: _searchUserIds[i]);
                    }));
                  },
                )
            );
          }
          var searchUsersSheet = _searchUserNames.isEmpty ? const SizedBox() : ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text("用户搜索结果", style: TextStyle(color: Colors.grey)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(height: 0, thickness: 1),
                ),
                ...searchUsersSheetTiles
              ],
            ),
          );

          // searchFriendsSheet
          var searchFriendsSheetTiles = [];
          for (var i = 0; i < _searchFriendNames.length; i++) {
            searchFriendsSheetTiles.add(
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(_searchFriendAvatarUrls[i]),
                    ),
                  ),
                  title: _regenerateText(text: _searchFriendRemarkNames[i], keyword: widget.searchWord),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: _regenerateText(text: _searchFriendNames[i], keyword: widget.searchWord, prefix: "昵称："),
                  ),
                  onTap: () async {
                    // 跳转到聊天页面
                    final myId = await getMyId(context);
                    if (myId == null) {
                      return;
                    }
                    final sessionId = myId.compareTo(_searchFriendIds[i]) < 0 ? "$myId-${_searchFriendIds[i]}" : "${_searchFriendIds[i]}-$myId";
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return ChatPage(sessionId: sessionId);
                    }));
                  },
                )
            );
          }
          var searchFriendsSheet = _searchFriendNames.isEmpty ? const SizedBox() : ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text("联系人", style: TextStyle(color: Colors.grey)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(height: 0, thickness: 1),
                ),
                ...searchFriendsSheetTiles,
              ],
            ),
          );

          // searchChatRecordsSheet
          var searchChatRecordsSheetTiles = [];
          for (var i = 0; i < _searchChatRecordNames.length; i++) {
            searchChatRecordsSheetTiles.add(
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(_searchChatRecordAvatarUrls[i]),
                    ),
                  ),
                  title: Text(_searchChatRecordNames[i]),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: _regenerateText(text: _searchChatRecordContents[i], keyword: widget.searchWord),
                  ),
                  trailing: Column(
                    children: [
                      const SizedBox(height: 6),
                      Text(_searchChatRecordTimes[i], style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  onTap: () {
                    // 跳转到聊天页面指定消息处
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return ChatPage(sessionId: _searchChatRecordSessionId[i], targetMessageId: _searchChatRecordTargetMessageId[i]);
                    }));
                  },
                )
            );
          }
          var searchChatRecordsSheet = _searchChatRecordNames.isEmpty ? const SizedBox() : ColoredBox(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text("聊天记录", style: TextStyle(color: Colors.grey)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(height: 0, thickness: 1),
                ),
                ...searchChatRecordsSheetTiles
              ],
            ),
          );

          return (_searchUserNames.isEmpty && _searchFriendNames.isEmpty && _searchChatRecordNames.isEmpty) ?
          const Center(child: Text("无搜索结果"),) : ListView(
            children: [
              const SizedBox(height: 10),
              searchUsersSheet,
              SizedBox(height: _searchUserNames.isEmpty ? 0 : 10),
              searchFriendsSheet,
              SizedBox(height: _searchFriendNames.isEmpty ? 0 : 10),
              searchChatRecordsSheet,
              const SizedBox(height: 10),
            ],
          );
        }
        return const LightChatLoadingPage();
      },
    );
  }

  Text _regenerateText({required String text, required String keyword, String? prefix}) {
    var texts = text.split(keyword);
    var textPieces = [
      TextSpan(text: texts[0])
    ];
    for (var i = 1; i < texts.length; i++) {
      textPieces.add(TextSpan(text: keyword, style: const TextStyle(color: Colors.blue)));
      textPieces.add(TextSpan(text: texts[i]));
    }
    if (prefix != null) {
      textPieces.insert(0, TextSpan(text: prefix));
    }
    return Text.rich(TextSpan(children: textPieces), overflow: TextOverflow.ellipsis, maxLines: 1);
  }

}