import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/Clients/FriendCircleManager.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import '../proto/FriendManager.pb.dart';
import 'LightChatLoadingDialog.dart';
import 'LightChatLoadingPage.dart';
import "LightChatNameLabel.dart";
import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import "package:lightchat_app/proto/FriendCircleManager.pb.dart";
import 'package:fixnum/fixnum.dart' as $fixnum;

class LightChatFriendCircleSheet extends StatefulWidget {
  final $fixnum.Int64 friendCircleId;
  final StreamController refreshController;

  const LightChatFriendCircleSheet({super.key, required this.friendCircleId, required this.refreshController});

  @override
  State<StatefulWidget> createState() {
    return _LightChatFriendCircleSheet();
  }

}

class _LightChatFriendCircleSheet extends State<LightChatFriendCircleSheet> {
  late List<String> _thumbIds;
  late List<String> _thumbNames;
  late List<String> _commentIds;
  late List<CommentType> _commentTypes;
  late List<String> _commentNames;
  late List<String> _commentToNames;
  late List<String> _comments;
  late List<Widget>? _wrapItems;
  late List<Widget>? _commentItems;

  late Future _future;

  Future _loadData() {
    return Future(() async {
      var myId = await getMyId(context);
      if (myId == null) {
        return;
      }
      var friendCircle = await friendCircleManagerClient.getDetail(GetDetailRequest(id: widget.friendCircleId));
      _thumbIds = friendCircle.thumbUpIds;
      _thumbNames = [];
      for (var id in _thumbIds) {
        final String name;
        var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: id));
        var friendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: id));
        name = friendInfo.isFriend ? friendInfo.remarkName : info.name;
        _thumbNames.add(name);
      }
      // thumb sheet
      _wrapItems = _thumbIds.isEmpty ? null : [Container(
        margin: const EdgeInsets.only(top: 3, right: 5),
        child: Icon(
          Icons.thumb_up,
          color: Colors.blue,
          size: Theme.of(context).textTheme.bodyMedium?.fontSize,
        ),
      )];
      for (var i = 0; i < _thumbIds.length; i++) {
        _wrapItems?.add(LightChatNameLabel(
            userId: _thumbIds[i],
            name: _thumbNames[i],
            fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize)
        );
        _wrapItems?.add(Text("、", style: Theme.of(context).textTheme.bodyMedium));
      }
      if (_wrapItems != null) {
        _wrapItems = _wrapItems!.getRange(0, _wrapItems!.length-1).toList();
      }
      _commentIds = [];
      _commentNames = [];
      _commentToNames = [];
      _commentTypes = [];
      _comments = [];
      for (var comment in friendCircle.comments) {
        _commentIds.add(comment.fromId);
        _commentTypes.add(comment.type);
        _comments.add(comment.content);
        var fromInfo = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: comment.fromId));
        var fromFriendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: comment.fromId));
        _commentNames.add(fromFriendInfo.isFriend ? fromFriendInfo.remarkName : fromInfo.name);
        if (comment.type == CommentType.REPLY) {
          var toInfo = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: comment.toId));
          var toFriendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: comment.toId));
          _commentToNames.add(toFriendInfo.isFriend ? toFriendInfo.remarkName : toInfo.name);
        } else {
          _commentToNames.add("");
        }
      }
      // comment sheet
      _commentItems = _commentIds.isEmpty ? null : [];
      for (var i = 0; i < _commentIds.length; i++) {
        final replyInputController = TextEditingController();
        final replyInputFocusNode = FocusNode();

        _commentItems?.add(RawMaterialButton(
          constraints: const BoxConstraints(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, childSetState) {
                    return Container(
                        color: Colors.grey[300],
                        margin: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: TextField(
                                    controller: replyInputController,
                                    focusNode: replyInputFocusNode,
                                    autofocus: true,
                                    minLines: 1,
                                    maxLines: 5,
                                    maxLength: 120,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                        hintText: "回复${i < _commentNames.length ? _commentNames[i] : ""}: ",
                                        border: const OutlineInputBorder(),
                                        filled: true,
                                        fillColor: Colors.white,
                                        counterText: ""
                                    ),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.deny(RegExp(r"\n"))
                                    ],
                                    onChanged: (text) {
                                      childSetState(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                                  child: IconButton(
                                    iconSize: 32,
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.only(),
                                    onPressed: () {
                                      if(replyInputFocusNode.hasPrimaryFocus) {
                                        // 失去焦点，收起键盘
                                        replyInputFocusNode.unfocus();
                                      } else {
                                        // 获取焦点，唤起键盘
                                        replyInputFocusNode.requestFocus();
                                      }
                                    },
                                    icon: Icon(
                                        replyInputFocusNode.hasPrimaryFocus ? Icons.emoji_emotions_outlined : Icons.keyboard_outlined,
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 42,
                                      child: OutlinedButton(
                                        style: ButtonStyle(
                                            backgroundColor: replyInputController.text.isEmpty ?
                                            MaterialStateProperty.all(Colors.grey[200]) : MaterialStateProperty.all(Colors.blue)
                                        ),
                                        onPressed: replyInputController.text.isEmpty ? null : () async {
                                          // 发送回复
                                          Navigator.of(context).pop();
                                          showLightChatLoadingDialog(context: context, title: "正在发送");
                                          var myId = await getMyId(context);
                                          if (myId == null) {
                                            return;
                                          }
                                          var comment = Comment(
                                            type: CommentType.REPLY,
                                            fromId: myId,
                                            toId: _commentIds[i],
                                            content: replyInputController.text,
                                            timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                          );
                                          var res = await friendCircleManagerClient.sendComment(SendCommentRequest(
                                            friendCircleId: widget.friendCircleId,
                                            comment: comment
                                          ));
                                          Navigator.of(context).pop();
                                          replyInputController.text = "";
                                          if (mounted) {
                                            // await _loadData();
                                            // setState(() {});
                                            widget.refreshController.add(1);
                                          }
                                          Fluttertoast.showToast(
                                            msg: res.succeed ? "回复成功" : "回复失败",
                                            backgroundColor: Colors.grey[300],
                                            textColor: Colors.black,
                                          );
                                        },
                                        child: Text(
                                          "发送",
                                          style: TextStyle(
                                              color: replyInputController.text.isEmpty ? Colors.grey : Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                            replyInputFocusNode.hasPrimaryFocus ? const SizedBox() : Container(
                              height: 0.4 * MediaQuery.of(context).size.height,
                              margin: const EdgeInsets.only(top: 10),
                              child: EmojiPicker(
                                textEditingController: replyInputController,
                                config: const Config(
                                    bgColor: Colors.white
                                ),
                                onEmojiSelected: (category, emoji) {
                                  childSetState(() {});
                                },
                                onBackspacePressed: () {
                                  childSetState(() {});
                                },
                              ),
                            )
                          ],
                        )
                    );
                  });
                }
            );
          },
          child: _commentTypes[i] == CommentType.COMMENT ? Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                      text: "${_commentNames[i]}: ",
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextSpan(
                      text: _comments[i],
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        color: Colors.black,
                      )
                  )
                ]
            ),
          ) : Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "${_commentNames[i]} ",
                    style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: "回复",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Colors.black,
                    )
                ),
                TextSpan(
                    text: " ${_commentToNames[i]}: ",
                    style: TextStyle(
                        fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: _comments[i],
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                      color: Colors.black,
                    )
                )
              ]
          )),
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _thumbIds = [];
    _thumbNames = [];
    _commentIds = [];
    _commentTypes = [];
    _commentNames = [];
    _commentToNames = [];
    _comments = [];
    _wrapItems = [];
    _commentItems = [];

    widget.refreshController.stream.listen((event) async {
      if (mounted) {
        await _loadData();
        setState(() {});
      }
    });

    _future = _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return (_thumbNames.isEmpty && _comments.isEmpty) ? const SizedBox() : Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _wrapItems == null ? const SizedBox() : Wrap(
                  children: _wrapItems!,
                ),
                (_thumbNames.isEmpty || _comments.isEmpty) ? const SizedBox(width: double.infinity, height: 0) : const Padding(
                  padding: EdgeInsets.only(top: 7, bottom: 1),
                  child: Divider(height: 0),
                ),
                _commentItems == null ? const SizedBox() : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _commentItems!.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: item,
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }
        return Container(
          width: double.infinity,
          height: 0.16 * MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Colors.grey[200],
          child: const LightChatLoadingPage(),
        );
      },
    );
  }

}