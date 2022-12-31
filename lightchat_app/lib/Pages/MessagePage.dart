import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:lightchat_app/Clients/ChatStream.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/ChatPage.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/MessageManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Storage/LightChatMessageReadRecord.dart';
import '../config.dart';
import "KeepAliveWrapper.dart";
import "package:intl/intl.dart";

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }

}

class _MessagePageState extends State<StatefulWidget> with SingleTickerProviderStateMixin {
  static const _tabLabels = [
    Text("全部"),
    Text("联系人"),
    Text("群聊"),
  ];

  late final TabController _tabController;

  late List<Widget> _listViewTiles;

  late Future _future;

  Future _loadData() {
    return Future(() async {
      _listViewTiles = [];

      // 加载聊天会话列表
      final myId = await getMyId(context);
      if (myId == null) {
        return;
      }
      var res = await messageManagerClient.getSessionList(GetSessionListRequest(userId: myId));
      final messageReadRecord = await getMessageReadRecord();
      for (var message in res.messages) {
        final messageId = message.messageId;
        final pieces = messageId.split("-");
        final sessionId = "${pieces[0]}-${pieces[1]}";
        final userId = pieces[0] == myId ? pieces[1] : pieces[0];
        final sessionAvatarUrl = "http://$fileManagerAddr/avatar/$userId";
        final info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: userId));
        final friendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: userId));
        final sessionName = friendInfo.isFriend ? friendInfo.remarkName : info.name;
        final String latestMessageContent;
        if (message.type == MessageType.TEXT) {
          latestMessageContent = message.content;
        } else if (message.type == MessageType.IMAGE) {
          latestMessageContent = "[图片]";
        } else if (message.type == MessageType.VIDEO) {
          latestMessageContent = "[视频]";
        } else {
          latestMessageContent = "[文件]";
        }
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
        final int unReadNum;
        if (messageReadRecord == null) {
          unReadNum = 0;
          await updateMessageReadRecord(messageId);
        } else {
          final countId = int.parse(pieces[2]);
          unReadNum = messageReadRecord.containsKey(sessionId) ? countId - messageReadRecord[sessionId]! : countId;
        }
        _listViewTiles.add(
          ListTile(
            tileColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(sessionAvatarUrl, fit: BoxFit.cover),
              ),
            ),
            title: Text(sessionName),
            subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(latestMessageContent, overflow: TextOverflow.ellipsis, maxLines: 1)
            ),
            trailing: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      dateTimeText,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      color: unReadNum == 0 ? Colors.white : Colors.blue,
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: Text(
                        // 未读消息数
                        unReadNum < 100 ? unReadNum.toString() : "99+",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
            onTap: () async {
              // 根据 sessionId 跳转到聊天页面
              await updateMessageReadRecord(messageId);
              checkUnreadController.add(1);
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return ChatPage(sessionId: sessionId);
              })).then((value) async {
                if (mounted) {
                  await _loadData();
                  setState(() {});
                }
              });
            },
          )
        );
        _listViewTiles.add(const Divider(height: 0));
      }
      if (_listViewTiles.isNotEmpty) {
        _listViewTiles = _listViewTiles.getRange(0, _listViewTiles.length-1).toList();
      }
      var prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("MessageRead")) {
        await prefs.setStringList("MessageRead", []);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _listViewTiles = [];

    _future = _loadData();

    chatStreamController.stream.listen((event) async {
      if (mounted) {
        await _loadData();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          labelColor: Colors.blue,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.blue,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          tabs: _tabLabels,
          controller: _tabController,
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: _tabController,
            children: [
              KeepAliveWrapper(
                child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return RefreshIndicator(
                        onRefresh: () {
                          return Future(() async {
                            if (mounted) {
                              await _loadData();
                              setState(() {});
                            }
                          });
                        },
                        child: Scaffold(
                          backgroundColor: Colors.grey[300],
                          body: _listViewTiles.isEmpty ? const Center(
                            child: Text("暂无消息"),
                          ) : ListView(
                            children: _listViewTiles,
                          ),
                        ),
                      );
                    }
                    return const LightChatLoadingPage();
                  },
                )
              ),
              KeepAliveWrapper(
                child: FutureBuilder(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return RefreshIndicator(
                        onRefresh: () {
                          return Future(() async {
                            if (mounted) {
                              await _loadData();
                              setState(() {});
                            }
                          });
                        },
                        child: Scaffold(
                          backgroundColor: Colors.grey[300],
                          body: _listViewTiles.isEmpty ? const Center(
                            child: Text("暂无消息"),
                          ) : ListView(
                            children: _listViewTiles,
                          ),
                        ),
                      );
                    }
                    return const LightChatLoadingPage();
                  },
                )
              ),
              KeepAliveWrapper(
                // TODO: 群聊消息列表
                child: ColoredBox(
                  color: Colors.grey[300]!,
                  child: const Center(
                    child: Text("群聊功能尚未开放"),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

}