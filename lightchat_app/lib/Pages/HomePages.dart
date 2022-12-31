import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/Pages/UserProfilePage.dart';
import 'package:lightchat_app/Storage/LightChatMessageReadRecord.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/proto/MessageManager.pb.dart';
import 'MyProfilePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SearchPage.dart';
import "MessagePage.dart";
import "DirectoryPage.dart";
import "DiscoveryPage.dart";
import "package:qrscan/qrscan.dart" as scanner;
import "package:url_launcher/url_launcher.dart";


class HomePages extends StatefulWidget {
  final int currentIndex;

  const HomePages({this.currentIndex = 0, super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePagesState();
  }

}

class _HomePagesState extends State<HomePages> {
  late GlobalKey _appBarKey;

  var _currentIndex = 0;

  late bool _hasUnread;
  StreamSubscription? _checkUnreadSubscription;

  static const _pageLabels = ["消息", "通讯录", "发现", "我"];
  static const _pageIcons = [
    Icon(Icons.chat),
    Icon(Icons.people),
    Icon(Icons.language),
    Icon(Icons.person),
    Icon(Icons.mark_unread_chat_alt)
  ];
  static const _pages = [
    MessagePage(),
    DirectoryPage(),
    DiscoveryPage(),
    MyProfilePage(),
  ];
  static const _popupMenuLabels = ["添加联系人", "创建群聊", "扫一扫"];
  static const _popupMenuIcons = [
    Icon(Icons.person_add_alt_1, color: Colors.blue),
    Icon(Icons.groups, color: Colors.blue),
    Icon(Icons.qr_code_scanner, color: Colors.blue),
  ];

  @override
  void dispose() {
    super.dispose();
    _checkUnreadSubscription?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _appBarKey = GlobalKey();
    _hasUnread = false;
    _checkUnreadSubscription = null;
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        elevation: 0,
        leading: _pageIcons[_currentIndex],
        title: Text(_pageLabels[_currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: const Icon(Icons.add_circle_outline),
              onTap: () {
                showMenu(
                    useRootNavigator: true,
                    context: context,
                    position: RelativeRect.fromLTRB(2.0/3.0*_appBarKey.currentContext!.size!.width, _appBarKey.currentContext!.size!.height, 5, 0),
                    items: [
                      PopupMenuItem(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            showModalBottomSheet(useRootNavigator: true, context: context, builder: (childContext) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.search, color: Colors.blue),
                                    title: const Text("搜索轻聊号/手机号"),
                                    onTap: () {
                                      Navigator.of(childContext).pop();
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                        return const SearchPage();
                                      }));
                                    },
                                  ),
                                  const Divider(height: 0),
                                  ListTile(
                                    leading: const Icon(Icons.qr_code_scanner, color: Colors.orange),
                                    title: const Text("扫描身份二维码"),
                                    onTap: () {
                                      Navigator.of(childContext).pop();
                                      _scanQrCode(context);
                                    },
                                  ),
                                  Container(color: Colors.grey[300], height: 7),
                                  ListTile(
                                    title: const Text("取消", textAlign: TextAlign.center),
                                    onTap: () {
                                      Navigator.of(childContext).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                          },
                          child: Row(
                            children: [
                              Padding(padding: const EdgeInsets.fromLTRB(2, 0, 12, 0), child: _popupMenuIcons[0]),
                              Text(_popupMenuLabels[0])
                            ],
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        height: 2,
                        child: Divider(height: 1.8, thickness: 0.6),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          // TODO: 创建群聊
                          Fluttertoast.showToast(
                            msg: "群聊功能尚未开放",
                            backgroundColor: Colors.grey[300],
                            textColor: Colors.black,
                          );
                        },
                        child: Row(
                          children: [
                            Padding(padding: const EdgeInsets.fromLTRB(2, 0, 12, 0), child: _popupMenuIcons[1]),
                            Text(_popupMenuLabels[1])
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 2,
                        child: Divider(height: 1.8, thickness: 0.6),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          _scanQrCode(context);
                        },
                        child: Row(
                          children: [
                            Padding(padding: const EdgeInsets.fromLTRB(2, 0, 12, 0), child: _popupMenuIcons[2]),
                            Text(_popupMenuLabels[2])
                          ],
                        ),
                      )
                    ]
                );
              },
            ),
          )
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: StatefulBuilder(builder: (context, childSetState) {
                if (_checkUnreadSubscription == null) {
                  _checkUnreadSubscription = checkUnreadController.stream.listen((event) async {
                    final myId = await getMyId(context);
                    final record = await getMessageReadRecord();
                    if (record == null) {
                      if (mounted) {
                        childSetState(() {
                          _hasUnread = false;
                        });
                      }
                      return;
                    }
                    final res = await messageManagerClient.getSessionList(GetSessionListRequest(userId: myId));
                    for (final message in res.messages) {
                      final pieces = message.messageId.split("-");
                      if (record["${pieces[0]}-${pieces[1]}"] == null || int.parse(pieces[2]) > record["${pieces[0]}-${pieces[1]}"]!) {
                        if (mounted) {
                          childSetState(() {
                            _hasUnread = true;
                          });
                        }
                        return;
                      }
                    }
                    if (mounted) {
                      childSetState(() {
                        _hasUnread = false;
                      });
                    }
                  });
                  checkUnreadController.add(1);
                }

                return _hasUnread ? _pageIcons[4] : _pageIcons[0];
              }),
              label: _pageLabels[0]
          ),
          BottomNavigationBarItem(
              icon: _pageIcons[1],
              label: _pageLabels[1]
          ),
          BottomNavigationBarItem(
              icon: _pageIcons[2],
              label: _pageLabels[2]
          ),
          BottomNavigationBarItem(
              icon: _pageIcons[3],
              label: _pageLabels[3]
          )
        ],
      ),
    );
  }

  void _scanQrCode(BuildContext context) async {
    try {
      var result = (await scanner.scan())!;
      if(result.startsWith("LightChatQrCode-")) {
        // 跳转到识别出的用户详情页面
        var userId = result.substring("LightChatQrCode-".length);
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return UserProfilePage(userId: userId);
        }));
      } else {
        var url = Uri.parse(result);
        var future = launchUrl(url);
        try {
          await future.then((value) => null);
        } on Exception catch(e) {
          Fluttertoast.showToast(
            msg: "无法识别的URL: $result",
            backgroundColor: Colors.grey[300],
            textColor: Colors.black,
          );
        }
      }
    } on Exception catch(e) {
      if (e.toString().contains(scanner.CameraAccessDenied)) {
        Fluttertoast.showToast(
          msg: "未获得相机使用权限，请在应用管理中开启轻聊的相机权限！",
          backgroundColor: Colors.grey[300],
          textColor: Colors.black,
        );
      } else {
        Fluttertoast.showToast(
          msg: "未识别到二维码",
          backgroundColor: Colors.grey[300],
          textColor: Colors.black,
        );
      }
    }
  }

}