import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import "../CustomWidgets/LightChatAvatar.dart";

class AddFriendPage extends StatefulWidget {
  final String userId;
  final String name;
  final Image avatar;

  const AddFriendPage({super.key, required this.userId, required this.name, required this.avatar});

  @override
  State<StatefulWidget> createState() {
    return _AddFriendPageState();
  }

}

class _AddFriendPageState extends State<AddFriendPage> {
  late String _myName;

  late TextEditingController _applyInfoInputController;
  late TextEditingController _remarkNameInputController;

  Future _loadData() {
    return Future(() async {
      var id = await getMyId(context);
      var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: id));
      _myName = info.name;
      _applyInfoInputController.text = "我是$_myName";
    });
  }

  @override
  void initState() {
    super.initState();
    _myName = "";
    _applyInfoInputController = TextEditingController(text: "我是$_myName");
    _remarkNameInputController = TextEditingController(text: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("添加联系人"),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                const SizedBox(height: 20),
                ListTile(
                  leading: LightChatSmallAvatar(
                    userId: widget.userId,
                    image: widget.avatar,
                    enableJump: false,
                  ),
                  title: Text(widget.name, style: Theme.of(context).textTheme.titleLarge),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Text("填写申请信息", style: Theme.of(context).textTheme.bodyMedium),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TextField(
                    controller: _applyInfoInputController,
                    maxLines: 6,
                    maxLength: 150,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: "",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("设置备注名", style: Theme.of(context).textTheme.bodyMedium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _remarkNameInputController,
                    maxLength: 15,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if(_remarkNameInputController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "发送失败：备注名不能为空！",
                          backgroundColor: Colors.grey[300],
                          textColor: Colors.black,
                        );
                      } else {
                        // 发送添加联系人申请
                        showLightChatLoadingDialog(context: context, title: "正在发送");
                        Future(() async {
                          var id = await getMyId(context);
                          var res = await friendManagerClient.sendNewFriendRequest(NewFriendRequest(
                            fromId: id,
                            toId: widget.userId,
                            state: NewFriendRequestState.WAIT_FOR_ACCEPT,
                            content: _applyInfoInputController.text,
                            fromRemarkName: _remarkNameInputController.text,
                          ));
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                            msg: res.succeed ? "发送成功" : "发送失败",
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                        }).then((value) {});
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "发送",
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          color: Colors.white,
                          letterSpacing: 1
                        )
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const LightChatLoadingPage();
        },
      )
    );
  }

}