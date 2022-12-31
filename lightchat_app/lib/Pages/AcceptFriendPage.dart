import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/MessageManager.pbgrpc.dart';
import '../CustomWidgets/LightChatAvatar.dart';

class AcceptFriendPage extends StatefulWidget {
  final NewFriendRequest request;
  final String userName;

  const AcceptFriendPage({super.key, required this.request, required this.userName});

  @override
  State<StatefulWidget> createState() {
    return _AcceptFriendPageState();
  }

}

class _AcceptFriendPageState extends State<AcceptFriendPage> {
  late String _name;
  late Image _avatar;

  late TextEditingController _applyInfoInputController;
  late TextEditingController _remarkNameInputController;

  @override
  void initState() {
    super.initState();
    _applyInfoInputController = TextEditingController(text: widget.request.content);
    _remarkNameInputController = TextEditingController(text: widget.userName);

    _name = widget.userName;
    _avatar = Image.network("http://$fileManagerAddr/avatar/${widget.request.fromId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("申请信息"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: LightChatSmallAvatar(
              userId: widget.request.fromId,
              image: _avatar,
              enableJump: false,
            ),
            title: Text(_name, style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text("申请信息", style: Theme.of(context).textTheme.bodyMedium),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: TextField(
              readOnly: true,
              enabled: false,
              controller: _applyInfoInputController,
              maxLines: 6,
              maxLength: 150,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                counterText: "",
                filled: true,
                fillColor: Colors.grey[200],
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
              bottom: 15,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10))
                      ),
                      onPressed: () {
                        if (_remarkNameInputController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "备注名不能为空！",
                            backgroundColor: Colors.grey[300],
                            textColor: Colors.black,
                          );
                          return;
                        }
                        // 同意申请
                        showLightChatLoadingDialog(context: context, title: "正在发送");
                        Future(() async {
                          var request = widget.request;
                          var sessionId = request.fromId.compareTo(request.toId)<0 ? "${request.fromId}-${request.toId}" : "${request.toId}-${request.fromId}";
                          var createRes = await messageManagerClient.createSession(CreateSessionRequest(sessionId: sessionId, userId: request.toId));
                          request.toRemarkName = _remarkNameInputController.text;
                          request.state = NewFriendRequestState.ACCEPTED;
                          var res = await friendManagerClient.acceptNewFriend(request);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop("refresh");
                          Fluttertoast.showToast(
                            msg: (createRes.succeed && res.succeed) ? "已同意" : "同意失败",
                            backgroundColor: Colors.grey[300],
                            textColor: Colors.black,
                          );
                        }).then((value) {});
                      },
                      child: Text("同意", style: TextStyle(
                        fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                        letterSpacing: 1
                      )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10))
                      ),
                      onPressed: () {
                        // 拒绝申请
                        showLightChatLoadingDialog(context: context, title: "正在发送");
                        Future(() async {
                          var request = widget.request;
                          request.state = NewFriendRequestState.REJECTED;
                          var res = await friendManagerClient.rejectNewFriend(widget.request);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop("refresh");
                          Fluttertoast.showToast(
                            msg: res.succeed ? "已拒绝" : "拒绝失败",
                            backgroundColor: Colors.grey[300],
                            textColor: Colors.black,
                          );
                        }).then((value) {});
                      },
                      child: Text("拒绝", style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                          letterSpacing: 1
                      )),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}