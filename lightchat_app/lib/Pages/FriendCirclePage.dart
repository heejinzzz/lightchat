import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import "package:image_picker/image_picker.dart";
import 'package:lightchat_app/Clients/FriendCircleManager.dart';
import 'package:lightchat_app/Clients/FriendManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/proto/FriendCircleManager.pb.dart';
import 'package:lightchat_app/proto/FriendManager.pb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Clients/UserManagerClient.dart';
import '../config.dart';
import '../proto/UserManager.pb.dart';
import 'UserProfilePage.dart';
import "NewFriendCirclePage.dart";
import "../CustomWidgets/LightChatAvatar.dart";
import "../CustomWidgets/LightChatFriendCircleTile.dart";
import "../CustomWidgets/LightChatFriendCircleCover.dart";
import 'package:fixnum/fixnum.dart' as $fixnum;

class FriendCirclePage extends StatefulWidget {
  final double H;
  final double W;
  final String userId;
  final bool broadcast;

  const FriendCirclePage({super.key, required this.H, required this.W, required this.userId, this.broadcast = false});

  @override
  State<StatefulWidget> createState() {
    return _FriendCirclePageState();
  }

}

class _FriendCirclePageState extends State<FriendCirclePage> with SingleTickerProviderStateMixin {
  late String _myId;

  late String _name;
  late Image _avatar;
  late Rx<Image> _cover;
  late Color _appBarColor;
  late double _avatarPos;
  late double _namePos;
  
  late AnimationController _coverController;
  late double downY;
  late double _currentOffset;

  late int _animatedListItemCount;
  late List<$fixnum.Int64> _friendCircleTileIdList;
  late ScrollController _listViewController;
  late StreamController _animatedListStreamController;
  late bool _animatedListStreamControllerHasListened;
  late GlobalKey<AnimatedListState> _animatedListKey;

  late StreamController _friendCircleRefreshController;
  late bool _refreshControllerHasListened;

  late Future _future;

  Future _loadData() {
    return Future(() async {
      var myId = await getMyId(context);
      if (myId == null) {
        return;
      }
      _myId = myId;
      var id = widget.userId;
      if (widget.broadcast) {
        id = myId;
      }
      final response = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: id));
      _name = response.name;
      if (!widget.broadcast) {
        final friendResponse = await friendManagerClient.checkFriend(checkFriendRequest(id: myId, targetId: id));
        if (friendResponse.isFriend) {
          _name = friendResponse.remarkName;
        }
      }
      _avatar = Image.network("http://$fileManagerAddr/avatar/$id", fit: BoxFit.cover);
      _cover = Image.network("http://$fileManagerAddr/friendCircleCover/$id", fit: BoxFit.cover).obs;

      var res = await friendCircleManagerClient.getFriendCircles(GetFriendCirclesRequest(
        broadcast: widget.broadcast,
        userId: id,
      ));
      _friendCircleTileIdList = res.ids;
      _animatedListItemCount = 2+_friendCircleTileIdList.length*2;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _myId = "";
    _name = "";
    _avatar = Image.network("http://$fileManagerAddr/avatar/0", fit: BoxFit.cover);
    _cover = Image.network("http://$fileManagerAddr/friendCircleCover/0", fit: BoxFit.cover).obs;
    _appBarColor = Colors.transparent;
    _avatarPos = 0.3*widget.H;
    _namePos = 0.65*widget.H;

    _coverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this
    );
    _coverController.value = 0;
    downY = 0;
    _currentOffset = 0;

    _friendCircleTileIdList = [];
    _animatedListItemCount = 2;

    _listViewController = ScrollController();

    _animatedListKey = GlobalKey();
    _animatedListStreamController = StreamController();
    _animatedListStreamControllerHasListened = false;

    _friendCircleRefreshController = StreamController();
    _refreshControllerHasListened = false;

    _future = _loadData();
  }
  
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Listener(
            onPointerDown: (event) {
              downY = event.position.dy;
            },
            onPointerUp: (event) {
              if(event.position.dy < downY) {
                _coverController.animateTo(0);
              }
            },
            child: Stack(
              children: [
                // ListView
                Scaffold(
                  body: RefreshIndicator(
                    displacement: 0.1*MediaQuery.of(context).size.height,
                    onRefresh: () {
                      return Future(() async {
                        await _loadData();
                        _friendCircleRefreshController.add(1);
                      });
                    },
                    child: StatefulBuilder(builder: (context, childSetState) {
                      if (!_animatedListStreamControllerHasListened) {
                        _animatedListStreamController.stream.listen((id) {
                          childSetState(() {
                            _animatedListItemCount -= _animatedListItemCount == 4 ? 1 : 2;
                            _friendCircleTileIdList.remove(id);
                            _animatedListKey = GlobalKey();
                            _currentOffset = _listViewController.offset;
                          });
                          Future(
                                  () {
                                while (!_listViewController.hasClients) {}
                                return;
                              }
                          ).then((value) {
                            _listViewController.jumpTo(_currentOffset);
                          });
                        });
                        _animatedListStreamControllerHasListened = true;
                      }

                      if (!_refreshControllerHasListened) {
                        _friendCircleRefreshController.stream.listen((event) async {
                          await _loadData();
                          if (mounted) {
                            childSetState(() {
                              _animatedListKey = GlobalKey();
                              _currentOffset = 0;
                              Future(
                                      () {
                                    while (!_listViewController.hasClients) {}
                                    return;
                                  }
                              ).then((value) {
                                _listViewController.jumpTo(_currentOffset);
                              });
                            });
                          }
                        });
                        _refreshControllerHasListened = true;
                      }

                      _coverController.addListener(() {
                        childSetState(() {});
                      });

                      return AnimatedList(
                        key: _animatedListKey,
                        shrinkWrap: true,
                        physics: _coverController.value == 0 ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
                        controller: _listViewController,
                        initialItemCount: _animatedListItemCount,
                        itemBuilder: (context, index, animation) {
                          if (index == 0) {
                            return LightChatFriendCircleCover(
                              image: Obx(() {
                                return _cover.value;
                              }),
                              name: _name,
                              avatar: _avatar,
                              animationController: _coverController,
                              listViewController: _listViewController,
                            );
                          } else if (index == 1) {
                            return SizedBox(height: 0.08*MediaQuery.of(context).size.height);
                          } else if (index == _animatedListItemCount-1) {
                            return Container(
                              height: 0.1 * MediaQuery.of(context).size.height,
                              color: Colors.transparent,
                            );
                          } else if (index % 2 == 1) {
                            return const Divider(height: 0);
                          } else if ((index-2)~/2 >= _friendCircleTileIdList.length) {
                            return const SizedBox(height: 0);
                          } else {
                            return LightChatFriendCircleTile(
                              id: _friendCircleTileIdList[(index-2)~/2],
                              animatedListStreamController: _animatedListStreamController,
                            );
                          }
                        },
                      );
                    })
                  )
                ),
                // Avatar
                StatefulBuilder(
                  builder: (context, childSetState) {
                    _coverController.addListener(() {
                      childSetState(() {});
                    });

                    _listViewController.addListener(() {
                      if (mounted) {
                        childSetState(() {
                          var H = MediaQuery.of(context).size.height;
                          _appBarColor = ColorTween(begin: Colors.transparent, end: Colors.blue).transform(
                              _listViewController.offset < 0.18*H ? 0 : (min(0.14*H, _listViewController.offset-0.18*H))/(0.14*H)
                          )!;
                          _avatarPos = 0.3*widget.H - _listViewController.offset;
                          _namePos = 0.65*widget.H + _listViewController.offset;
                        });
                      }
                    });

                    return Positioned(
                        top: _avatarPos,
                        right: 0.05*W,
                        child: FadeTransition(
                          opacity: _coverController.drive(Tween(begin: 1, end: -2)),
                          child: SizedBox(
                            height: 0.1*H,
                            width: 0.1*H,
                            child: LightChatSmallAvatar(
                              userId: widget.broadcast ? _myId : widget.userId,
                              image: _avatar,
                              enableJump: _coverController.value == 0 ? true : false
                            ),
                          ),
                        )
                    );
                  },
                ),
                // Name
                StatefulBuilder(builder: (context, childSetState) {
                  _coverController.addListener(() {
                    childSetState(() {});
                  });

                  _listViewController.addListener(() {
                    if (mounted) {
                      childSetState(() {});
                    }
                  });

                  return Positioned(
                    bottom: _namePos,
                    right: 0.075*W + 0.1*H,
                    child: FadeTransition(
                        opacity: _coverController.drive(Tween(begin: 1, end: -2)),
                        child: GestureDetector(
                          onTap: _coverController.value == 0 ? () {
                            Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                              return UserProfilePage(userId: widget.broadcast ? _myId : widget.userId);
                            }));
                          } : null,
                          child: Text(
                            _name,
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                            ),
                          ),
                        )
                    ),
                  );
                }),
                // ChangeCoverButton
                (widget.broadcast || _myId == widget.userId) ? StatefulBuilder(builder: (context, childSetState) {
                  _coverController.addListener(() {
                    childSetState(() {});
                  });

                  return Positioned(
                    bottom: 0.215*H,
                    right: 0.05*W,
                    child: FadeTransition(
                      opacity: _coverController.drive(Tween(begin: -4, end: 1)),
                      child: RawMaterialButton(
                        constraints: const BoxConstraints(),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: _coverController.value == 0 ? null : () async {
                          // 更换封面
                          var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                          if(imageFile != null) {
                            var croppedImage = await ImageCropper().cropImage(
                              sourcePath: imageFile.path,
                              aspectRatio: const CropAspectRatio(ratioX: 2, ratioY: 3),
                              uiSettings: [
                                AndroidUiSettings(
                                  toolbarTitle: '选择图片',
                                  toolbarColor: Colors.black,
                                  toolbarWidgetColor: Colors.white,
                                  lockAspectRatio: true,
                                  hideBottomControls: true,
                                ),
                                IOSUiSettings(
                                  title: '选择图片',
                                ),
                              ],
                            );
                            if (croppedImage != null) {
                              showLightChatLoadingDialog(context: context, title: "正在上传");
                              Future(() async {
                                var prefs = await SharedPreferences.getInstance();
                                var id = prefs.getString("ID");
                                var imageBytes = await croppedImage.readAsBytes();
                                await dio.Dio().post(
                                    "http://$fileManagerAddr/uploadFriendCircleCover/$id",
                                    data: dio.FormData.fromMap({"newCover": dio.MultipartFile.fromBytes(imageBytes, filename: "cover")})
                                );
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(
                                  msg: "修改成功",
                                  backgroundColor: Colors.grey[300],
                                  textColor: Colors.black,
                                );
                                _cover.value = Image.memory(imageBytes, fit: BoxFit.cover);
                              }).then((value) {});
                            }
                          }
                        },
                        child: Column(
                          children: [
                            const Icon(Icons.image_outlined, color: Colors.white),
                            Text("换封面", style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                }) : const SizedBox(width: 0, height: 0),
                // AppBar
                StatefulBuilder(builder: (context, childSetState) {
                  _coverController.addListener(() {
                    childSetState(() {});
                  });

                  _listViewController.addListener(() {
                    if (mounted) {
                      childSetState(() {});
                    }
                  });

                  return Positioned(
                      top: 0,
                      child: SlideTransition(
                        position: _coverController.drive(Tween(begin: const Offset(0, 0), end: const Offset(0, -1))),
                        child: SizedBox(
                          width: W,
                          child: AppBar(
                            centerTitle: true,
                            title: const Text("朋友圈"),
                            actions: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                                    return const NewFriendCirclePage();
                                  })).then((value) {
                                    // 根据添加朋友圈页面返回的数据决定是否要刷新朋友圈列表
                                    if (value == "refresh") {
                                      _friendCircleRefreshController.add(1);
                                    }
                                  });
                                },
                                icon: const Icon(Icons.add),
                              )
                            ],
                            foregroundColor: Colors.white,
                            backgroundColor: _appBarColor,
                            elevation: 0,
                          ),
                        ),
                      )
                  );
                }),
              ],
            )
          );
        }
        return const LightChatLoadingPage();
      },
    );
  }

}