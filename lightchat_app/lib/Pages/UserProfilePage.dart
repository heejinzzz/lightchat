import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/FriendManager.pbgrpc.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import 'ChatPage.dart';
import "MyProfilePage.dart";
import "../CustomWidgets/LightChatAvatar.dart";
import "FriendCirclePage.dart";
import "AddFriendPage.dart";
import "package:fluttertoast/fluttertoast.dart";

class UserProfilePage extends StatefulWidget {
  final String userId;
  final StreamController? refreshController;

  const UserProfilePage({super.key, required this.userId, this.refreshController});

  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }

}

class _UserProfilePageState extends State<UserProfilePage> {
  late bool _isMyself;
  late bool _isFriend;
  late String? _remarkName;
  late String _name;
  late Icon _genderIcon;
  late Image _avatar;

  late TextEditingController _remarkNameInputBoxController;

  Future _loadData() {
    return Future(() async {
      _isMyself = false;
      _isFriend = false;
      var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: widget.userId));
      _name = info.name;
      _genderIcon = info.gender == Gender.MALE ? maleGenderIcon : femaleGenderIcon;
      _avatar = Image.network("http://$fileManagerAddr/avatar/${widget.userId}");
      var id = await getMyId(context);
      if (id == null) {
        return;
      }
      if (widget.userId == id) {
        _isMyself = true;
        return;
      }
      var res = await friendManagerClient.checkFriend(checkFriendRequest(id: id, targetId: widget.userId));
      if (res.isFriend) {
        _isFriend = true;
        _remarkName = res.remarkName;
        _remarkNameInputBoxController.text = _remarkName!;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isMyself = false;
    _isFriend = false;
    _remarkName = "";
    _name = "";
    _genderIcon = maleGenderIcon;
    _avatar = Image.network("http://$fileManagerAddr/avatar/${widget.userId}");

    _remarkNameInputBoxController = TextEditingController(text: _remarkName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("个人信息"),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: ColoredBox(
                    color: Colors.grey[300]!,
                    child: ListView(
                      children: [
                        ColoredBox(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AspectRatio(
                                      aspectRatio: 1/1,
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: LightChatBigAvatar(_avatar),
                                      )
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(_isFriend ? _remarkName! : _name, style: Theme.of(context).textTheme.titleLarge)
                                      ),
                                      _isFriend ? Container(
                                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                          alignment: Alignment.centerLeft,
                                          child: Text("昵称：$_name", style: Theme.of(context).textTheme.bodySmall)
                                      ) : Container(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: _genderIcon,
                                  ),
                                )
                              ],
                            )
                        ),
                        _isFriend ? const Divider(height: 0) : const SizedBox(),
                        _isFriend ? RawMaterialButton(
                          onPressed: () {
                            // 修改备注
                            showDialog(context: context, builder: (childContext) {
                              return AlertDialog(
                                title: const Text("修改备注名", textAlign: TextAlign.center),
                                content: TextField(
                                  autofocus: true,
                                  controller: _remarkNameInputBoxController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()
                                  ),
                                  maxLength: 15,
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      const Divider(height: 0),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  Navigator.of(childContext).pop();
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    "取消",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              )
                                          ),
                                          const SizedBox(
                                            height: 50,
                                            child: VerticalDivider(width: 0),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  if(_remarkNameInputBoxController.text.isEmpty) {
                                                    Fluttertoast.showToast(
                                                      msg: "保存失败：备注名不能为空！",
                                                      backgroundColor: Colors.white,
                                                      textColor: Colors.black,
                                                    );
                                                  } else {
                                                    Navigator.of(childContext).pop();
                                                    // 修改备注
                                                    showLightChatLoadingDialog(context: context, title: "正在保存");
                                                    Future(() async {
                                                      var id = await getMyId(context);
                                                      if (id == null) {
                                                        return;
                                                      }
                                                      var res = await friendManagerClient.changeRemarkName(changeRemarkNameRequest(
                                                          id: id,
                                                          friendId: widget.userId,
                                                          newRemarkName: _remarkNameInputBoxController.text
                                                      ));
                                                      setState(() {});
                                                      widget.refreshController?.add(1);
                                                      Navigator.of(context).pop();
                                                      if (!res.isFriend) {
                                                        Fluttertoast.showToast(
                                                          msg: "保存失败：对方不是您的联系人",
                                                          backgroundColor: Colors.white,
                                                          textColor: Colors.black,
                                                        );
                                                        return;
                                                      }
                                                      Fluttertoast.showToast(
                                                        msg: res.succeed ? "保存成功" : "保存失败",
                                                        backgroundColor: Colors.white,
                                                        textColor: Colors.black,
                                                      );
                                                    }).then((value) {});
                                                  }
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    "保存",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(color: Colors.blue),
                                                  ),
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              );
                            });
                          },
                          child: const ListTile(
                            title: Text("修改备注名"),
                            trailing: Icon(Icons.navigate_next, color: Colors.grey),
                            tileColor: Colors.white,
                          ),
                        ) : const SizedBox(),
                        const SizedBox(height: 15),
                        !_isFriend && !_isMyself ? RawMaterialButton(
                          onPressed: () {
                            // 添加为联系人
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return AddFriendPage(userId: widget.userId, name: _name, avatar: _avatar);
                            }));
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 0.04*MediaQuery.of(context).size.width),
                                  child: const Icon(Icons.person_add, color: Colors.blue),
                                ),
                                const Text("添加为联系人")
                              ],
                            ),
                            tileColor: Colors.white,
                          ),
                        ) : const SizedBox(),
                        _isFriend || _isMyself ? RawMaterialButton(
                          onPressed: () {
                            // 浏览朋友圈
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return FriendCirclePage(
                                H: MediaQuery.of(context).size.height,
                                W: MediaQuery.of(context).size.width,
                                userId: widget.userId,
                              );
                            }));
                          },
                          child: const ListTile(
                            leading: Icon(Icons.camera, color: Colors.orange),
                            title: Text("浏览朋友圈"),
                            trailing: Icon(Icons.navigate_next, color: Colors.grey),
                            tileColor: Colors.white,
                          ),
                        ) : const SizedBox(),
                        _isFriend ? const Divider(height: 0) : const SizedBox(),
                        _isFriend ? RawMaterialButton(
                          onPressed: () async {
                            // 发消息
                            final myId = await getMyId(context);
                            if (myId == null) {
                              return;
                            }
                            final sessionId = myId.compareTo(widget.userId) < 0 ? "$myId-${widget.userId}" : "${widget.userId}-$myId";
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return ChatPage(sessionId: sessionId);
                            })).then((value) {
                              if (mounted) {
                                setState(() {});
                              }
                            });
                          },
                          child: const ListTile(
                            leading: Icon(Icons.chat_bubble, color: Colors.blue),
                            title: Text("发消息"),
                            trailing: Icon(Icons.navigate_next, color: Colors.grey),
                            tileColor: Colors.white,
                          ),
                        ) : const SizedBox(),
                        const SizedBox(height: 15),
                        _isFriend ? RawMaterialButton(
                          onPressed: () {
                            // 删除联系人
                            showDialog(context: context, builder: (childContext) {
                              return AlertDialog(
                                title: const Text("删除联系人", textAlign: TextAlign.center),
                                content: const Text(
                                    "删除该联系人后，你们将无法再互相发送消息、浏览朋友圈",
                                    softWrap: true,
                                    textAlign: TextAlign.justify
                                ),
                                actions: [
                                  Column(
                                    children: [
                                      const Divider(height: 0),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  Navigator.of(childContext).pop();
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    "取消",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              )
                                          ),
                                          const SizedBox(
                                            height: 50,
                                            child: VerticalDivider(width: 0),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: RawMaterialButton(
                                                onPressed: () {
                                                  // 删除联系人
                                                  Navigator.of(childContext).pop();
                                                  showLightChatLoadingDialog(context: context, title: "正在删除");
                                                  Future(() async {
                                                    var id = await getMyId(context);
                                                    if (id == null) {
                                                      return;
                                                    }
                                                    var res = await friendManagerClient.deleteFriend(deleteFriendRequest(
                                                      id: id,
                                                      friendId: widget.userId,
                                                    ));
                                                    setState(() {});
                                                    widget.refreshController?.add(1);
                                                    Navigator.of(context).pop();
                                                    Fluttertoast.showToast(
                                                      msg: res.succeed ? "删除成功" : "删除失败",
                                                      backgroundColor: Colors.white,
                                                      textColor: Colors.black,
                                                    );
                                                    return;
                                                  }).then((value) {});
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    "删除",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(color: Colors.red),
                                                  ),
                                                ),
                                              )
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              );
                            });
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text("删除联系人", style: TextStyle(color: Colors.red))],
                            ),
                            tileColor: Colors.white,
                          ),
                        ) : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const LightChatLoadingPage();
        },
      ),
    );
  }

}