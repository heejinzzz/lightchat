import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/Clients/FriendCircleManager.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendCircleManager.pb.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import "LightChatAvatar.dart";
import 'LightChatLoadingPage.dart';
import "LightChatNameLabel.dart";
import "LightChatLoadingDialog.dart";
import "LightChatConfirmDialog.dart";
import "LightChatFriendCircleSheet.dart";
import "../Pages/ViewFriendCircleImagesPage.dart";
import "LightChatFriendCircleThumbnail.dart";
import "package:intl/intl.dart";
import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import 'package:fixnum/fixnum.dart' as $fixnum;

class LightChatFriendCircleTile extends StatefulWidget {
  final $fixnum.Int64 id;
  final StreamController animatedListStreamController;

  const LightChatFriendCircleTile({super.key, required this.id, required this.animatedListStreamController});

  @override
  State<StatefulWidget> createState() {
    return _LightChatFriendCircleTitleState();
  }

}

class _LightChatFriendCircleTitleState extends State<LightChatFriendCircleTile> with TickerProviderStateMixin {
  late String _userId;
  late Image _avatar;
  late String _name;
  late String _content;
  late String _time;
  late bool _enableDelete;
  late List<Image> _images;
  late List<Widget> _thumbNailsGridItems;

  late bool _isThumbed;
  late AnimationController _thumbColorController;

  late TextEditingController _commentInputController;
  late FocusNode _commentInputFocusNode;

  late Future _future;

  late StreamController _refreshController;

  Future _loadData() {
    return Future(() async {
      _images = [];
      _thumbNailsGridItems = [];
      var friendCircle = await friendCircleManagerClient.getDetail(GetDetailRequest(id: widget.id));
      _userId = friendCircle.userId;
      _avatar = Image.network("http://$fileManagerAddr/avatar/$_userId", fit: BoxFit.cover);
      var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: _userId));
      _name = info.name;
      var myId = await getMyId(context);
      if (myId == null) {
        return;
      }
      var friendInfo = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: _userId));
      if (friendInfo.isFriend) {
        _name = friendInfo.remarkName;
      }
      _content = friendCircle.content;
      var pubTime = DateTime.fromMillisecondsSinceEpoch(friendCircle.timestamp.toInt());
      var now = DateTime.now();
      var duration = now.difference(pubTime);
      if (duration.inMinutes < 1) {
        _time = "刚刚";
      } else if (duration.inHours < 1) {
        _time = "${duration.inMinutes}分钟前";
      } else if (duration.inDays < 1) {
        _time = "${duration.inHours}小时前";
      } else if (now.year == pubTime.year && now.month == pubTime.month && now.day == pubTime.day+1) {
        _time = "昨天 ${DateFormat("HH:mm").format(pubTime)}";
      } else if (now.year == pubTime.year) {
        _time = "${pubTime.month}月${pubTime.day}日 ${DateFormat("HH:mm").format(pubTime)}";
      } else {
        _time = "${pubTime.year}年${pubTime.month}月${pubTime.day}日 ${DateFormat("HH:mm").format(pubTime)}";
      }
      _enableDelete = myId == _userId ? true : false;
      _isThumbed = friendCircle.thumbUpIds.contains(myId) ? true : false;
      _thumbColorController.value = _isThumbed ? 1 : 0;
      for (var i = 0; i < friendCircle.imageNum; i++) {
        _images.add(Image.network("http://$fileManagerAddr/friendCircle?id=${widget.id.toString()}&index=$i", fit: BoxFit.cover));
      }
      if (_images.length == 1) {
        _thumbNailsGridItems.add(
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: 0,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: 0,
                      image: _images[0],
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox())
              ],
            )
        );
      } else if(_images.length == 4) {
        _thumbNailsGridItems.add(
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: 0,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: 0,
                      image: _images[0],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: 1,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: 1,
                      image: _images[1],
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            )
        );
        _thumbNailsGridItems.add(
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: 2,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: 2,
                      image: _images[2],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: 3,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: 3,
                      image: _images[3],
                    ),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            )
        );
      } else {
        var i = 0;
        while(i < _images.length) {
          final tempi = i;
          var row = Row(children: []);
          for(var j = 0; j < 3; j++) {
            if(tempi+j >= _images.length) {
              row.children.add(
                  const Expanded(flex: 1, child: SizedBox())
              );
            } else {
              row.children.add(
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ViewFriendCircleImagesPage(
                          friendCircleId: widget.id.toString(),
                          images: _images,
                          selectIndex: tempi+j,
                        );
                      }));
                    },
                    child: LightChatFriendCircleThumbnail(
                      friendCircleId: widget.id.toString(),
                      imageIndex: tempi+j,
                      image: _images[tempi+j],
                    ),
                  ),
                ),
              );
            }
          }
          _thumbNailsGridItems.add(row);
          i += 3;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _userId = "0";
    _avatar = Image.network("http://$fileManagerAddr/avatar/$_userId", fit: BoxFit.cover);
    _name = "";
    _content = "";
    _time = "";
    _enableDelete = false;
    _isThumbed = false;
    _images = [];
    _thumbNailsGridItems = [];

    _thumbColorController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _thumbColorController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _commentInputController = TextEditingController();
    _commentInputFocusNode = FocusNode();

    _future = _loadData();

    _refreshController = StreamController.broadcast();
  }

  @override
  Widget build(BuildContext context) {
    var fadeController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FadeTransition(
            opacity: fadeController.drive(Tween(begin: 1, end: 0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: LightChatSmallAvatar(userId: _userId, image: _avatar),
                    )
                ),
                Expanded(
                  flex: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5),
                        child: LightChatNameLabel(userId: _userId, name: _name),
                      ),
                      Text(
                        _content,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                      ),
                      const SizedBox(height: 10),
                      Column(children: _thumbNailsGridItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _time,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            children: [
                              _enableDelete ? IconButton(
                                onPressed: () async {
                                  showLightChatConfirmDialog(
                                      context: context,
                                      content: const Text("删除这条朋友圈？", textAlign: TextAlign.center),
                                      confirmText: "删除",
                                      confirmColor: Colors.red,
                                      onConfirm: () async {
                                        Navigator.of(context).pop();
                                        // 删除这条朋友圈
                                        showLightChatLoadingDialog(context: context, title: "正在删除");
                                        var myId = await getMyId(context);
                                        if (myId == null) {
                                          return;
                                        }
                                        var res = await friendCircleManagerClient.delete(DeleteRequest(
                                          userId: myId,
                                          friendCircleId: widget.id,
                                        ));
                                        Navigator.of(context).pop();
                                        if (!res.succeed) {
                                          Fluttertoast.showToast(
                                            msg: "删除失败",
                                            backgroundColor: Colors.grey[300],
                                            textColor: Colors.black,
                                          );
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: "删除成功",
                                            backgroundColor: Colors.grey[300],
                                            textColor: Colors.black,
                                          );
                                          await fadeController.animateTo(1);
                                          // 向Stream传入这条朋友圈的id, 父节点FriendCirClePage会把这个元素删除
                                          widget.animatedListStreamController.add(widget.id);
                                        }
                                      }
                                  );
                                },
                                icon: const Icon(Icons.delete_forever, color: Colors.grey),
                              ) : const SizedBox(width: 0, height: 0),
                              IconButton(
                                onPressed: () async {
                                  // 点赞或取消点赞
                                  showLightChatLoadingDialog(context: context, title: "正在发送");
                                  var myId = await getMyId(context);
                                  if (myId == null) {
                                    return;
                                  }
                                  var res = await friendCircleManagerClient.thumb(ThumbRequest(
                                    userId: myId,
                                    friendCircleId: widget.id,
                                    type: _isThumbed ? ThumbType.THUMB_DOWN : ThumbType.THUMB_UP
                                  ));
                                  Navigator.of(context).pop();
                                  if (res.succeed) {
                                    if (mounted) {
                                      _refreshController.add(1);
                                    }
                                    Fluttertoast.showToast(
                                      msg: _isThumbed ? "取消点赞成功" : "点赞成功",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                    );
                                    _isThumbed = !_isThumbed;
                                    await _thumbColorController.animateTo(1-_thumbColorController.value);
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: _isThumbed ? "取消点赞失败" : "点赞失败",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                    );
                                  }
                                },
                                icon: Icon(
                                    Icons.thumb_up,
                                    color: ColorTween(
                                        begin: Colors.grey,
                                        end: Colors.blue
                                    ).animate(_thumbColorController).value
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // 添加评论
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
                                                          controller: _commentInputController,
                                                          focusNode: _commentInputFocusNode,
                                                          autofocus: true,
                                                          minLines: 1,
                                                          maxLines: 5,
                                                          maxLength: 120,
                                                          decoration: const InputDecoration(
                                                              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                                              hintText: "评论",
                                                              border: OutlineInputBorder(),
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
                                                            if(_commentInputFocusNode.hasPrimaryFocus) {
                                                              // 失去焦点，收起键盘
                                                              _commentInputFocusNode.unfocus();
                                                            } else {
                                                              // 获取焦点，唤起键盘
                                                              _commentInputFocusNode.requestFocus();
                                                            }
                                                          },
                                                          icon: Icon(
                                                              _commentInputFocusNode.hasPrimaryFocus ? Icons.emoji_emotions_outlined : Icons.keyboard_outlined,
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
                                                                  backgroundColor: _commentInputController.text.isEmpty ?
                                                                  MaterialStateProperty.all(Colors.grey[200]) : MaterialStateProperty.all(Colors.blue)
                                                              ),
                                                              onPressed: _commentInputController.text.isEmpty ? null : () async {
                                                                // 发送评论
                                                                Navigator.of(context).pop();
                                                                showLightChatLoadingDialog(context: context, title: "正在发送");
                                                                var myId = await getMyId(context);
                                                                if (myId == null) {
                                                                  return;
                                                                }
                                                                var comment = Comment(
                                                                  type: CommentType.COMMENT,
                                                                  fromId: myId,
                                                                  content: _commentInputController.text,
                                                                  timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                                                );
                                                                var res = await friendCircleManagerClient.sendComment(SendCommentRequest(
                                                                  friendCircleId: widget.id,
                                                                  comment: comment
                                                                ));
                                                                if (mounted) {
                                                                  _refreshController.add(1);
                                                                }
                                                                Navigator.of(context).pop();
                                                                _commentInputController.text = "";
                                                                Fluttertoast.showToast(
                                                                  msg: res.succeed ? "评论成功" : "评论失败",
                                                                  backgroundColor: Colors.grey[300],
                                                                  textColor: Colors.black,
                                                                );
                                                              },
                                                              child: Text(
                                                                "发送",
                                                                style: TextStyle(
                                                                    color: _commentInputController.text.isEmpty ? Colors.grey : Colors.white
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                  _commentInputFocusNode.hasPrimaryFocus ? const SizedBox() : Container(
                                                    height: 0.4 * MediaQuery.of(context).size.height,
                                                    margin: const EdgeInsets.only(top: 10),
                                                    child: EmojiPicker(
                                                      textEditingController: _commentInputController,
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
                                icon: const Icon(Icons.add_comment_rounded, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      LightChatFriendCircleSheet(
                        friendCircleId: widget.id,
                        refreshController: _refreshController,
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          );
        }
        return Container(
          width: double.infinity,
          height: 0.5 * MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: const LightChatLoadingPage(),
        );
      },
    );
  }

}