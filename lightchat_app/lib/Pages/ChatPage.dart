import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/Clients/ChatStream.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/Clients/MessageManagerClient.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/UserProfilePage.dart';
import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import "package:flutter_chat_ui/flutter_chat_ui.dart";
import "package:flutter_chat_types/flutter_chat_types.dart" as types;
import 'package:lightchat_app/Pages/ViewVideoPage.dart';
import 'package:lightchat_app/Storage/LightChatMessageReadRecord.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/config.dart';
import "package:intl/intl.dart";
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:lightchat_app/proto/MessageManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import "package:fixnum/fixnum.dart" as $fixnum;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import "package:wechat_assets_picker/wechat_assets_picker.dart";

import 'ViewChatImagespage.dart';

class ChatPage extends StatefulWidget {
  final String sessionId;
  final String? targetMessageId;

  const ChatPage({super.key, required this.sessionId, this.targetMessageId});

  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }

}

class _ChatPageState extends State<ChatPage> {
  late bool _showEmojiPicker;
  late StreamController _emojiCloseController;
  late bool _emojiCloseControllerHasListened;
  late TextEditingController _inputController;
  late FocusNode _inputFocusNode;
  late bool _inputFocusNodeHasListened;
  late StreamSubscription _subscription;
  late GlobalKey<ChatState> _chatKey;

  late String _myId;
  late String _userId;
  late String _titleName;
  late bool _isFriend;
  late bool _isLastPage;
  late List<Image> _chatImages;
  late Map<String, Image> _messageIdTOImage;

  String? _jumpMessageId;

  late bool _downloadBoxHide;
  late String _downloadFileName;
  late double _downloadProcess;
  late bool _downloadSucceed;

  late List<types.Message> _messageTiles;
  late int _messageCount;

  late Future _future;

  Future _checkIsFriend() {
    return Future(() async {
      var myId = await getMyId(context);
      if (myId == null) {
        return;
      }
      _myId = myId;
      final pieces = widget.sessionId.split("-");
      _userId = pieces[0] == myId ? pieces[1] : pieces[0];
      var res = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: _userId));
      _isFriend = res.isFriend;
      if (!res.isFriend) {
        var info = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: _userId));
        _titleName = info.name;
      } else {
        _titleName = res.remarkName;
      }
    });
  }

  Future _loadData() {
    return Future(() async {
      final res = await messageManagerClient.getMessages(GetMessagesRequest(
        sessionId: widget.sessionId,
        type: widget.targetMessageId == null ? GetRequestType.CHAT : GetRequestType.HISTORY,
        targetMessageId: _jumpMessageId,
        isStartPage: widget.targetMessageId == null ? true : false,
      ));
      _isLastPage = res.isLastPage;
      _messageTiles = res.messages.map<types.Message>((message) {
        if (message.type == MessageType.TEXT) {
          return types.TextMessage(
            author: types.User(id: message.userId),
            createdAt: message.timestamp.toInt(),
            id: message.messageId,
            text: message.content,
          );
        } else if (message.type == MessageType.IMAGE) {
          final image = Image.network("http://$fileManagerAddr/file/${message.messageId}", fit: BoxFit.cover);
          _chatImages.insert(0, image);
          _messageIdTOImage[message.messageId] = image;
          return types.ImageMessage(
            author: types.User(id: message.userId),
            createdAt: message.timestamp.toInt(),
            id: message.messageId,
            name: message.content,
            size: message.size.toInt(),
            uri: "http://$fileManagerAddr/file/${message.messageId}",
          );
        } else if (message.type == MessageType.VIDEO) {
          return types.VideoMessage(
            author: types.User(id: message.userId),
            createdAt: message.timestamp.toInt(),
            id: message.messageId,
            name: message.content,
            size: message.size.toInt(),
            uri: "http://$fileManagerAddr/file/${message.messageId}",
          );
        } else {
          return types.FileMessage(
            author: types.User(id: message.userId),
            createdAt: message.timestamp.toInt(),
            id: message.messageId,
            name: message.content,
            size: message.size.toInt(),
            uri: "http://$fileManagerAddr/file/${message.messageId}",
          );
        }
      }).toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    _myId = "";
    _userId = "";
    _titleName = "";
    _isFriend = true;
    _isLastPage = true;
    _chatImages = [];
    _messageIdTOImage = {};
    _messageTiles = [];

    _downloadBoxHide = true;
    _downloadFileName = "";
    _downloadProcess = 0;
    _downloadSucceed = false;

    if (widget.targetMessageId == null) {
      _jumpMessageId = null;
    } else {
      final pieces = widget.targetMessageId!.split("-");
      if (pieces[2] == "0") {
        _jumpMessageId = widget.targetMessageId;
      } else {
        final countId = int.parse(pieces[2])-1;
        _jumpMessageId = "${pieces[0]}-${pieces[1]}-${countId.toString()}";
      }
    }

    _showEmojiPicker = false;
    _emojiCloseController = StreamController();
    _emojiCloseControllerHasListened = false;
    _inputController = TextEditingController();
    _inputFocusNode = FocusNode();
    _inputFocusNodeHasListened = false;
    _chatKey = GlobalKey();
    _subscription = chatStreamController.stream.listen((message) async {
      if (mounted && message.messageId.startsWith(widget.sessionId)) {
        if (message.type != MessageType.TEXT) {
          final client = HttpClient();
          await Future(() async {
            while (true) {
              try {
                final req = await client.openUrl("GET", Uri.parse("http://$fileManagerAddr/file/${message.messageId}"));
                final res = await req.close();
                await res.first;
                client.close(force: true);
                return;
              } catch (e) {}
            }
          });
        }
        setState(() {
          if (message.type == MessageType.TEXT) {
            _messageTiles.insert(0, types.TextMessage(
              author: types.User(id: message.userId),
              createdAt: message.timestamp.toInt(),
              id: message.messageId,
              text: message.content,
            ));
          } else if (message.type == MessageType.IMAGE) {
            final image = Image.network("http://$fileManagerAddr/file/${message.messageId}", fit: BoxFit.cover);
            _chatImages.add(image);
            _messageIdTOImage[message.messageId] = image;
            _messageTiles.insert(0, types.ImageMessage(
              author: types.User(id: message.userId),
              createdAt: message.timestamp.toInt(),
              id: message.messageId,
              name: message.content,
              size: message.size.toInt(),
              uri: "http://$fileManagerAddr/file/${message.messageId}",
            ));
          } else if (message.type == MessageType.VIDEO) {
            _messageTiles.insert(0, types.VideoMessage(
              author: types.User(id: message.userId),
              createdAt: message.timestamp.toInt(),
              id: message.messageId,
              name: message.content,
              size: message.size.toInt(),
              uri: "http://$fileManagerAddr/file/${message.messageId}",
            ));
          } else {
            _messageTiles.insert(0, types.FileMessage(
              author: types.User(id: message.userId),
              createdAt: message.timestamp.toInt(),
              id: message.messageId,
              name: message.content,
              size: message.size.toInt(),
              uri: "http://$fileManagerAddr/file/${message.messageId}",
            ));
          }
        });
        await updateMessageReadRecord(message.messageId);
        checkUnreadController.add(1);
      }
    });

    _messageCount = 1;

    _future = Future(() async {
      await _checkIsFriend();
      await _loadData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text(_titleName),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return UserProfilePage(userId: _userId);
                    })).then((value) async {
                      // 从用户信息页面返回，要检查双方是否还是联系人
                      await _checkIsFriend();
                      if (mounted) {
                        setState(() {});
                      }
                    });
                  },
                  icon: const Icon(Icons.person, color: Colors.white),
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTapDown: (detail) {
                          _inputFocusNode.unfocus();
                          _emojiCloseController.add(1);
                        },
                        onHorizontalDragDown: (detail) {
                          _inputFocusNode.unfocus();
                          _emojiCloseController.add(1);
                        },
                        // 聊天窗口
                        child: Chat(
                          key: _chatKey,
                          disableImageGallery: true,
                          isLastPage: _isLastPage,
                          theme: const DefaultChatTheme(
                            backgroundColor: Color.fromRGBO(237, 237, 237, 1),
                            primaryColor: Colors.blue,
                            messageBorderRadius: 8,
                            messageInsetsHorizontal: 10,
                            messageInsetsVertical: 9,
                            receivedMessageDocumentIconColor: Colors.blue
                          ),
                          l10n: const ChatL10nZhCN(unreadMessagesLabel: "聊天记录"),
                          customBottomWidget: const SizedBox(width: 0, height: 0),
                          messages: _messageTiles,
                          onSendPressed: (message) {},
                          user: types.User(id: _myId),
                          scrollToUnreadOptions: widget.targetMessageId == null ? const ScrollToUnreadOptions() : ScrollToUnreadOptions(
                            lastReadMessageId: _jumpMessageId,
                            scrollOnOpen: true,
                          ),
                          // 自定义时间头格式
                          customDateHeaderText: (datetime) {
                            final DateFormat timeFormat = DateFormat("HH:mm");
                            var now = DateTime.now();
                            final timeText = timeFormat.format(datetime);
                            if (datetime.year == now.year && datetime.month == now.month && datetime.day == now.day) {
                              return timeText;
                            } else if (datetime.year == now.year && datetime.month == now.month && datetime.day == now.day-1) {
                              return "昨天 $timeText";
                            } else if (datetime.year == now.year && datetime.month == now.month && now.day-datetime.day < 7 && now.weekday > datetime.weekday) {
                              const temp = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];
                              return "${temp[datetime.weekday-1]} $timeText";
                            } else if (datetime.year == now.year) {
                              return "${datetime.month}月${datetime.day}日 $timeText";
                            } else {
                              return "${datetime.year}年${datetime.month}月${datetime.day}日 $timeText";
                            }
                          },
                          onEndReachedThreshold: 0.8,
                          // 滑动到底部回调函数，继续加载历史消息
                          onEndReached: () {
                            return Future(() async {
                              final res = await messageManagerClient.getMessages(GetMessagesRequest(
                                  sessionId: widget.sessionId,
                                  type: GetRequestType.CHAT,
                                  isStartPage: false,
                                  lastMessageId: _messageTiles[_messageTiles.length-1].id
                              ));
                              if (mounted) {
                                setState(() {
                                  _isLastPage = res.isLastPage;
                                  _messageTiles.addAll(res.messages.map<types.Message>((message) {
                                    if (message.type == MessageType.TEXT) {
                                      return types.TextMessage(
                                        author: types.User(id: message.userId),
                                        createdAt: message.timestamp.toInt(),
                                        id: message.messageId,
                                        text: message.content,
                                      );
                                    } else if (message.type == MessageType.IMAGE) {
                                      final image = Image.network("http://$fileManagerAddr/file/${message.messageId}", fit: BoxFit.cover);
                                      _chatImages.insert(0, image);
                                      _messageIdTOImage[message.messageId] = image;
                                      return types.ImageMessage(
                                        author: types.User(id: message.userId),
                                        createdAt: message.timestamp.toInt(),
                                        id: message.messageId,
                                        name: message.content,
                                        size: message.size.toInt(),
                                        uri: "http://$fileManagerAddr/file/${message.messageId}",
                                      );
                                    } else if (message.type == MessageType.VIDEO) {
                                      return types.VideoMessage(
                                        author: types.User(id: message.userId),
                                        createdAt: message.timestamp.toInt(),
                                        id: message.messageId,
                                        name: message.content,
                                        size: message.size.toInt(),
                                        uri: "http://$fileManagerAddr/file/${message.messageId}",
                                      );
                                    } else {
                                      return types.FileMessage(
                                        author: types.User(id: message.userId),
                                        createdAt: message.timestamp.toInt(),
                                        id: message.messageId,
                                        name: message.content,
                                        size: message.size.toInt(),
                                        uri: "http://$fileManagerAddr/file/${message.messageId}",
                                      );
                                    }
                                  }));
                                });
                              }
                            });
                          },
                          // 点击头像回调函数
                          onAvatarTap: (user) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return UserProfilePage(userId: user.id);
                            })).then((value) async {
                              // 从用户信息页面返回，要检查双方是否还是联系人
                              await _checkIsFriend();
                              if (mounted) {
                                setState(() {});
                              }
                            });
                          },
                          // 点击消息气泡回调函数
                          onMessageTap: (context, message) async {
                            // 若消息正在发送，则不允许点击
                            if (message.showStatus == true) {
                              return;
                            }
                            // 图片消息，点击查看图片
                            if (message is types.ImageMessage) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return ViewChatImagesPage(
                                    images: _chatImages,
                                    selectedIndex: _chatImages.indexOf(_messageIdTOImage[message.id]!)
                                );
                              }));
                            }
                            // 视频消息，点击观看视频
                            else if (message is types.VideoMessage) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return ViewVideoPage(
                                  videoUrl: message.uri,
                                  videoFileName: message.name,
                                );
                              }));
                            }
                            // 文件消息，点击下载文件或打开文件
                            else if (message is types.FileMessage) {
                              final prefs = await SharedPreferences.getInstance();
                              final filePath = prefs.getString("FileSave:${message.id}");
                              if (filePath != null) {
                                OpenFilex.open(filePath);
                                return;
                              }
                              if (!_downloadBoxHide) {
                                Fluttertoast.showToast(
                                  msg: "请先等待文件 $_downloadFileName 下载完毕",
                                  backgroundColor: Colors.grey[300],
                                  textColor: Colors.black,
                                );
                                return;
                              }
                              if (mounted) {
                                setState(() {
                                  _downloadFileName = message.name;
                                  _downloadProcess = 0;
                                  _downloadSucceed = false;
                                });
                                setState(() {
                                  _downloadBoxHide = false;
                                });
                              }
                              var dir = await getExternalStorageDirectory();
                              dir ??= await getApplicationDocumentsDirectory();
                              final savePath = "${dir.path}/${message.name}";
                              await Dio().download(
                                message.uri,
                                savePath,
                                onReceiveProgress: (received, total) {
                                  if (mounted) {
                                    setState(() {
                                      _downloadProcess = received / total;
                                    });
                                  }
                                }
                              );
                              if (mounted) {
                                setState(() {
                                  _downloadSucceed = true;
                                });
                              }
                              await prefs.setString("FileSave:${message.id}", savePath);
                              await Future.delayed(const Duration(milliseconds: 300));
                              if (mounted) {
                                setState(() {
                                  _downloadBoxHide = true;
                                });
                              }
                              await Future.delayed(const Duration(milliseconds: 300));
                              final filepath = prefs.getString("FileSave:${message.id}");
                              if (mounted && filepath != null) {
                                OpenFilex.open(filepath);
                              }
                            }
                          },
                          // 自定义视频消息气泡
                          videoMessageBuilder: (videoMessage, {required int messageWidth}) {
                            final String sizeText;
                            if (videoMessage.size < 1024) {
                              sizeText = "${_formatNum(videoMessage.size, 2)}B";
                            } else if (videoMessage.size < 1024*1024) {
                              sizeText = "${_formatNum(videoMessage.size/1024, 2)}KB";
                            } else if (videoMessage.size < 1024*1024*1024) {
                              sizeText = "${_formatNum(videoMessage.size/(1024*1024), 2)}MB";
                            } else if (videoMessage.size < 1024*1024*1024*1024) {
                              sizeText = "${_formatNum(videoMessage.size/(1024*1024*1024), 2)}GB";
                            } else {
                              sizeText = "${_formatNum(videoMessage.size/(1024*1024*1024*1024), 2)}TB";
                            }
                            final thumbnailUrl = videoMessage.showStatus == true ? videoMessage.uri : "http://$fileManagerAddr/videoThumbnail/${videoMessage.uri.substring(videoMessage.uri.lastIndexOf("/")+1)}";
                            return Container(
                                color: Colors.black,
                                width: 0.6 * MediaQuery.of(context).size.width,
                                height: 0.38 * MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: 0.6 * MediaQuery.of(context).size.width,
                                      height: 0.38 * MediaQuery.of(context).size.width,
                                      child: videoMessage.showStatus == true ? Image.file(File(thumbnailUrl), fit: BoxFit.cover) : Image.network(thumbnailUrl, fit: BoxFit.cover),
                                    ),
                                    Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 0.12 * MediaQuery.of(context).size.width)),
                                    Positioned(
                                      bottom: 5,
                                      right: 10,
                                      child: Text(
                                        sizeText,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            );
                          },
                        ),
                      ),
                      // download box
                      Positioned(
                        top: 15,
                        right: 0,
                        child: AnimatedContainer(
                          width: 0.27*MediaQuery.of(context).size.width,
                          curve: Curves.bounceOut,
                          color: const Color.fromRGBO(255, 255, 255, 0.9),
                          duration: const Duration(milliseconds: 500),
                          transform: Matrix4.translationValues(_downloadBoxHide ? 0.27*MediaQuery.of(context).size.width : 0, 0, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(_downloadFileName, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 0.27*MediaQuery.of(context).size.width,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  switchInCurve: Curves.easeOut,
                                  switchOutCurve: Curves.easeIn,
                                  child: _downloadSucceed ?
                                  Icon(Icons.download_done_outlined, color: Colors.green, size: 0.13*MediaQuery.of(context).size.width) :
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(Icons.download, color: Colors.blue, size: 0.08*MediaQuery.of(context).size.width),
                                      SizedBox(
                                        width: 0.13*MediaQuery.of(context).size.width,
                                        height: 0.13*MediaQuery.of(context).size.width,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 0.015*MediaQuery.of(context).size.width,
                                          value: _downloadProcess,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  )
                ),
                // 聊天输入框
                StatefulBuilder(builder: (context, childSetState) {
                  if (!_inputFocusNodeHasListened) {
                    _inputFocusNodeHasListened = true;
                    _inputFocusNode.addListener(() {
                      if (_inputFocusNode.hasPrimaryFocus) {
                        if (mounted) {
                          childSetState(() {
                            _showEmojiPicker = false;
                          });
                        }
                      }
                    });
                  }

                  if (!_emojiCloseControllerHasListened) {
                    _emojiCloseControllerHasListened = true;
                    _emojiCloseController.stream.listen((event) {
                      if (_showEmojiPicker && mounted) {
                        childSetState(() {
                          _showEmojiPicker = false;
                        });
                      }
                    });
                  }

                  return Container(
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 10, 12, 2),
                                child: TextField(
                                  readOnly: !_isFriend,
                                  enabled: _isFriend,
                                  controller: _inputController,
                                  focusNode: _inputFocusNode,
                                  minLines: 1,
                                  maxLines: 5,
                                  maxLength: 800,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Colors.white,
                                      counterText: "",
                                      hintText: _isFriend ? "" : "你们已不是联系人，无法发送新消息"
                                  ),
                                  onChanged: (text) {
                                    if (mounted) {
                                      childSetState(() {});
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child:  ElevatedButton(
                                onPressed: _isFriend == false || _inputController.text.isEmpty ? null : () async {
                                  // 发送消息
                                  final message = types.TextMessage(
                                      author: types.User(id: _myId),
                                      id: _messageCount.toString(),
                                      createdAt: DateTime.now().millisecondsSinceEpoch,
                                      text: _inputController.text,
                                      status: types.Status.sending,
                                      showStatus: true
                                  );
                                  _messageCount++;
                                  setState(() {
                                    _messageTiles.insert(0, message);
                                    _inputController.text = "";
                                  });
                                  final messageTile = MessageTile(
                                    messageId: "${widget.sessionId}-0",
                                    userId: _myId,
                                    type: MessageType.TEXT,
                                    content: message.text,
                                    size: $fixnum.Int64(0),
                                    timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                  );
                                  var res = await messageManagerClient.sendMessage(messageTile);
                                  await updateMessageReadRecord(res.messageId);
                                  if (mounted) {
                                    setState(() {
                                      final newMessage = types.TextMessage(
                                        author: message.author,
                                        id: res.messageId,
                                        createdAt: message.createdAt,
                                        text: message.text,
                                      );
                                      _messageTiles[_messageTiles.indexOf(message)] = newMessage;
                                    });
                                  }
                                },
                                child: const Icon(Icons.send),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: _isFriend ? () {
                                // 添加表情
                                _inputFocusNode.unfocus();
                                childSetState(() {
                                  _showEmojiPicker = !_showEmojiPicker;
                                });
                              } : null,
                              icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: _isFriend ? () async {
                                // 发送图片
                                final imageAssets = await AssetPicker.pickAssets(
                                  context,
                                  pickerConfig: const AssetPickerConfig(
                                    themeColor: Colors.blue,
                                    maxAssets: 99,
                                    requestType: RequestType.image,
                                    textDelegate: CustomTextDelegate(),
                                  )
                                );
                                if (imageAssets == null) {
                                  return;
                                }
                                for (var asset in imageAssets) {
                                  final file = await asset.originFile;
                                  if (file == null) {
                                    return;
                                  }
                                  final stat = await file.stat();
                                  final message = types.ImageMessage(
                                    author: types.User(id: _myId),
                                    id: _messageCount.toString(),
                                    createdAt: DateTime.now().millisecondsSinceEpoch,
                                    uri: file.path,
                                    name: file.uri.pathSegments.last,
                                    size: stat.size.toInt(),
                                    status: types.Status.sending,
                                    showStatus: true
                                  );
                                  _messageCount++;
                                  setState(() {
                                    final image = Image.file(File(file.path), fit: BoxFit.cover);
                                    _chatImages.add(image);
                                    _messageIdTOImage[message.id] = image;
                                    _messageTiles.insert(0, message);
                                  });
                                  Future(() async {
                                    final messageTile = MessageTile(
                                        messageId: "${widget.sessionId}-0",
                                        userId: _myId,
                                        type: MessageType.IMAGE,
                                        content: message.name,
                                        size: $fixnum.Int64(message.size.toInt()),
                                        timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                    );
                                    var res = await messageManagerClient.sendMessage(messageTile);
                                    await updateMessageReadRecord(res.messageId);
                                    var multipartFile = await MultipartFile.fromFile(file.path, filename: "image");
                                    await Dio().post(
                                      "http://$fileManagerAddr/uploadFile",
                                      data: FormData.fromMap({
                                        "messageId": res.messageId,
                                        "file": multipartFile
                                      })
                                    );
                                    if (mounted) {
                                      setState(() {
                                        final image = Image.network("http://$fileManagerAddr/file/${res.messageId}", fit: BoxFit.cover);
                                        _chatImages[_chatImages.indexOf(_messageIdTOImage[message.id]!)] = image;
                                        _messageIdTOImage[res.messageId] = image;
                                        final newMessage = types.ImageMessage(
                                          author: message.author,
                                          id: res.messageId,
                                          createdAt: message.createdAt,
                                          uri: "http://$fileManagerAddr/file/${res.messageId}",
                                          name: message.name,
                                          size: message.size,
                                        );
                                        _messageTiles[_messageTiles.indexOf(message)] = newMessage;
                                      });
                                    }
                                  }).then((value) {});
                                }
                              } : null,
                              icon: const Icon(Icons.image_outlined, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: _isFriend ? () async {
                                // 发送视频
                                final videoAssets = await AssetPicker.pickAssets(
                                  context,
                                  pickerConfig: const AssetPickerConfig(
                                    themeColor: Colors.blue,
                                    maxAssets: 1,
                                    requestType: RequestType.video,
                                    textDelegate: CustomTextDelegate(),
                                  )
                                );
                                if (videoAssets == null || videoAssets.isEmpty) {
                                  return;
                                }
                                final asset = videoAssets[0];
                                final file = await asset.originFile;
                                if (file == null) {
                                  return;
                                }
                                final stat = await file.stat();
                                final path = await getTemporaryDirectory();
                                final thumbnailFilename = await VideoThumbnail.thumbnailFile(
                                  video: file.path,
                                  thumbnailPath: path.path
                                );
                                if (thumbnailFilename == null) {
                                  return;
                                }
                                final message = types.VideoMessage(
                                    author: types.User(id: _myId),
                                    id: _messageCount.toString(),
                                    createdAt: DateTime.now().millisecondsSinceEpoch,
                                    uri: thumbnailFilename,
                                    name: file.uri.pathSegments.last,
                                    size: stat.size.toInt(),
                                    status: types.Status.sending,
                                    showStatus: true
                                );
                                _messageCount++;
                                setState(() {
                                  _messageTiles.insert(0, message);
                                });
                                final messageTile = MessageTile(
                                  messageId: "${widget.sessionId}-0",
                                  userId: _myId,
                                  type: MessageType.VIDEO,
                                  content: message.name,
                                  size: $fixnum.Int64(message.size.toInt()),
                                  timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                );
                                var res = await messageManagerClient.sendMessage(messageTile);
                                await updateMessageReadRecord(res.messageId);
                                final thumbnailMultipartFile = await MultipartFile.fromFile(thumbnailFilename, filename: "thumbnail");
                                await Dio().post(
                                  "http://$fileManagerAddr/uploadVideoThumbnail",
                                  data: FormData.fromMap({
                                    "messageId": res.messageId,
                                    "thumbnail": thumbnailMultipartFile,
                                  })
                                );
                                final videoMultipartFile = await MultipartFile.fromFile(file.path, filename: "video");
                                await Dio().post(
                                  "http://$fileManagerAddr/uploadFile",
                                  data: FormData.fromMap({
                                    "messageId": res.messageId,
                                    "file": videoMultipartFile,
                                  })
                                );
                                if (mounted) {
                                  setState(() {
                                    final newMessage = types.VideoMessage(
                                      author: message.author,
                                      id: res.messageId,
                                      createdAt: message.createdAt,
                                      uri: "http://$fileManagerAddr/file/${res.messageId}",
                                      name: message.name,
                                      size: message.size,
                                    );
                                    _messageTiles[_messageTiles.indexOf(message)] = newMessage;
                                  });
                                }
                              } : null,
                              icon: const Icon(Icons.video_call_outlined, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: _isFriend ? () async {
                                // 发送文件
                                final pickResult = await FilePicker.platform.pickFiles();
                                if (pickResult == null) {
                                  return;
                                }
                                final file = File(pickResult.files.single.path!);
                                final stat = await file.stat();
                                final message = types.FileMessage(
                                  author: types.User(id: _myId),
                                  id: _messageCount.toString(),
                                  createdAt: DateTime.now().millisecondsSinceEpoch,
                                  uri: file.path,
                                  name: file.uri.pathSegments.last,
                                  size: stat.size.toInt(),
                                  status: types.Status.sending,
                                  showStatus: true
                                );
                                _messageCount++;
                                setState(() {
                                  _messageTiles.insert(0, message);
                                });
                                final messageTile = MessageTile(
                                  messageId: "${widget.sessionId}-0",
                                  userId: _myId,
                                  type: MessageType.FILE,
                                  content: message.name,
                                  size: $fixnum.Int64(message.size.toInt()),
                                  timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch)
                                );
                                final res = await messageManagerClient.sendMessage(messageTile);
                                await updateMessageReadRecord(res.messageId);
                                final prefs = await SharedPreferences.getInstance();
                                await prefs.setString("FileSave:${res.messageId}", file.path);
                                final multipartFile = await MultipartFile.fromFile(file.path, filename: "file");
                                await Dio().post(
                                  "http://$fileManagerAddr/uploadFile",
                                  data: FormData.fromMap({
                                    "messageId": res.messageId,
                                    "file": multipartFile,
                                  })
                                );
                                if (mounted) {
                                  setState(() {
                                    final newMessage = types.FileMessage(
                                      author: message.author,
                                      id: res.messageId,
                                      createdAt: message.createdAt,
                                      uri: "http://$fileManagerAddr/file/${res.messageId}",
                                      name: message.name,
                                      size: message.size,
                                    );
                                    _messageTiles[_messageTiles.indexOf(message)] = newMessage;
                                  });
                                }
                              } : null,
                              icon: const Icon(Icons.file_open_outlined, color: Colors.black),
                            )
                          ],
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          margin: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                          padding: const EdgeInsets.all(10),
                          height: _showEmojiPicker ? 0.4 * MediaQuery.of(context).size.height : 0,
                          color: const Color(0xFFEBEFF2),
                          child: EmojiPicker(
                            textEditingController: _inputController,
                            onEmojiSelected: (category, emoji) {
                              if (mounted) {
                                childSetState(() {});
                              }
                            },
                            onBackspacePressed: () {
                              if (mounted) {
                                childSetState(() {});
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          );
        }
        return const Scaffold(
          backgroundColor: Colors.white,
          body: LightChatLoadingPage(),
        );
      },
    );
  }

  String _formatNum(dynamic nums, int position) {
    final double num;
    if (nums is double) {
      num = nums;
    } else {
      num = double.parse(nums.toString());
    }
    if ((num.toString().length -
        num.toString().lastIndexOf(".") -
        1) <
        position) {
      return(num.toStringAsFixed(position)
          .substring(0,
          num.toString().lastIndexOf(".") + position + 1)
          .toString());
    } else {
      return(num.toString()
          .substring(0,
          num.toString().lastIndexOf(".") + position + 1)
          .toString());
    }
  }

}

class CustomTextDelegate extends AssetPickerTextDelegate {
  const CustomTextDelegate();

  @override
  String get confirm => "发送";
}