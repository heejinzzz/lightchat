import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/AcceptFriendPage.dart';
import 'package:lightchat_app/Pages/UserProfilePage.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import 'package:lpinyin/lpinyin.dart';
import "KeepAliveWrapper.dart";
import "../CustomWidgets/LightChatTextDivider.dart";
import "../CustomWidgets/LightChatSideNavigator.dart";
import "../CustomWidgets/LightChatDirectoryTile.dart";
import "package:scroll_to_index/scroll_to_index.dart";

class DirectoryPage extends StatefulWidget {
  static const sideNavigatorLabels = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
    "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"
  ];

  const DirectoryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DirectoryPageState();
  }

}

class _DirectoryPageState extends State<StatefulWidget> with SingleTickerProviderStateMixin {
  static const _tabLabels = [
    Text("联系人"),
    Text("群聊"),
    Text("通知"),
  ];

  late List<Widget> _friendDirectoryTiles;
  late List<Widget> _listViewTiles;
  late Map<String, int> _friendDirectoryTextDividerIndexes;

  late List<NewFriendRequest> _newFriendRequests;
  late List<Widget> _newFriendRequestTiles;

  late final TabController _tabController;

  late AutoScrollController _listViewController;

  late StreamController _refreshStreamController;

  Future _loadFriendsData() {
    return Future(() async {
      _friendDirectoryTiles = [];
      _listViewTiles = [];
      _friendDirectoryTextDividerIndexes = {};

      // 获取联系人列表
      var id = await getMyId(context);
      if (id == null) {
        return;
      }
      var res = await friendManagerClient.getFriends(getFriendsRequest(id: id));
      Map<String, List<LightChatDirectoryTile>> friendMap = {};
      for (var key in DirectoryPage.sideNavigatorLabels) {
        friendMap[key] = [];
      }
      for (var friendId in res.ids) {
        var info = await friendManagerClient.checkFriend(checkFriendRequest(id: id, targetId: friendId));
        var pinyin = PinyinHelper.getPinyin(info.remarkName).toUpperCase();
        if (DirectoryPage.sideNavigatorLabels.contains(pinyin.substring(0, 1))) {
          friendMap[pinyin.substring(0, 1)]?.add(LightChatDirectoryTile(
            id: friendId,
            name: info.remarkName,
            avatar: Image.network("http://$fileManagerAddr/avatar/$friendId"),
            refreshController: _refreshStreamController,
          ));
        } else {
          friendMap["#"]?.add(LightChatDirectoryTile(
            id: friendId,
            name: info.remarkName,
            avatar: Image.network("http://$fileManagerAddr/avatar/$friendId"),
            refreshController: _refreshStreamController,
          ));
        }
      }
      for (var label in DirectoryPage.sideNavigatorLabels) {
        if (friendMap[label]!.isNotEmpty) {
          friendMap[label]?.sort((a, b) {
            return PinyinHelper.getPinyin(a.name).compareTo(PinyinHelper.getPinyin(b.name));
          });
          _friendDirectoryTiles.add(LightChatTextDivider(label));
          _friendDirectoryTiles.addAll(friendMap[label]!);
        }
      }

      var count = 0;
      for(var i = 0; i < _friendDirectoryTiles.length; i++) {
        if(_friendDirectoryTiles[i] is LightChatTextDivider) {
          _listViewTiles.add(AutoScrollTag(
            key: ValueKey(count),
            controller: _listViewController,
            index: count,
            child: _friendDirectoryTiles[i],
          ));
          _friendDirectoryTextDividerIndexes[(_friendDirectoryTiles[i] as LightChatTextDivider).text] = count;
          count++;
        } else {
          _listViewTiles.add(_friendDirectoryTiles[i]);
        }
      }
    });
  }

  Future _loadRequestsData() {
    _newFriendRequests = [];
    _newFriendRequestTiles = [];

    return Future(() async {
      var id = await getMyId(context);
      if (id == null) {
        return;
      }
      // 获取与自己有关的添加联系人通知
      var requestsRes = await friendManagerClient.getNewFriendRequests(getNewFriendRequestsRequest(id: id));
      _newFriendRequests = requestsRes.requests;
      for (var request in _newFriendRequests) {
        var tileUserId = request.fromId == id ? request.toId : request.fromId;
        var tileUserInfo = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: tileUserId));
        final Widget trailing;
        if (request.state == NewFriendRequestState.WAIT_FOR_ACCEPT) {
          trailing = request.fromId == id ?
          const Text("待同意", style: TextStyle(color: Colors.grey)) : OutlinedButton(
            onPressed: () {
              // 跳转到申请详情页
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return AcceptFriendPage(request: request, userName: tileUserInfo.name);
              })).then((value) {
                if (value == "refresh") {
                  setState(() {});
                }
              });
            },
            child: const Text("查看"),
          );
        } else if (request.state == NewFriendRequestState.ACCEPTED) {
          trailing = Text(request.fromId == id ? "被同意" : "已同意", style: const TextStyle(color: Colors.grey));
        } else {
          trailing = Text(request.fromId == id ? "被拒绝" : "已拒绝", style: const TextStyle(color: Colors.grey));
        }
        _newFriendRequestTiles.add(ColoredBox(color: Colors.white, child: ListTile(
          tileColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network("http://$fileManagerAddr/avatar/$tileUserId"),
            ),
          ),
          title: Text(tileUserInfo.name),
          subtitle: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(request.content, overflow: TextOverflow.ellipsis, maxLines: 1)
          ),
          trailing: trailing,
          onTap: () {
            // 跳转到用户个人信息页
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
              return UserProfilePage(userId: tileUserId);
            }));
          },
        )));
        _newFriendRequestTiles.add(const Divider(height: 0, thickness: 0.5));
      }
      if (_newFriendRequestTiles.isNotEmpty) {
        _newFriendRequestTiles = _newFriendRequestTiles.getRange(0, _newFriendRequestTiles.length-1).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _listViewController = AutoScrollController();
    _refreshStreamController = StreamController();
    _refreshStreamController.add((event) {
      if (mounted) {
        setState(() {});
      }
    });

    _friendDirectoryTiles = [];
    _listViewTiles = [];
    _friendDirectoryTextDividerIndexes = {};
    _newFriendRequests = [];
    _newFriendRequestTiles = [];
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
                  future: _loadFriendsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Stack(
                        children: [
                          ColoredBox(
                            color: Colors.grey[300]!,
                            child: _friendDirectoryTiles.isEmpty ? const Center(
                              child: Text("暂无联系人"),
                            ) : ListView(
                              controller: _listViewController,
                              children: _listViewTiles,
                            ),
                          ),
                          Positioned(
                            right: 0.02*MediaQuery.of(context).size.width,
                            top: 0.1*MediaQuery.of(context).size.height,
                            child: LightChatSideNavigator(
                              labels: DirectoryPage.sideNavigatorLabels,
                              labelIndexes: _friendDirectoryTextDividerIndexes,
                              listViewController: _listViewController,
                            ),
                          )
                        ],
                      );
                    }
                    return const LightChatLoadingPage();
                  },
                )
              ),
              KeepAliveWrapper(
                // TODO: 群聊列表页面
                child: ColoredBox(
                  color: Colors.grey[300]!,
                  child: const Center(
                    child: Text("群聊功能尚未开放"),
                  ),
                ),
              ),
              KeepAliveWrapper(
                // 添加联系人通知页面
                child: FutureBuilder(
                  future: _loadRequestsData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return RefreshIndicator(
                        displacement: 0.1*MediaQuery.of(context).size.height,
                        onRefresh: () {
                          return Future(() {
                            setState(() {});
                          });
                        },
                        child: ColoredBox(
                            color: Colors.grey[300]!,
                            child: _newFriendRequestTiles.isEmpty ? const Center(
                                child: Text("暂无通知")
                            ) : ListView(
                              children: _newFriendRequestTiles,
                            )
                        ),
                      );
                    }
                    return const LightChatLoadingPage();
                  },
                )
              ),
            ],
          ),
        )
      ],
    );
  }

}