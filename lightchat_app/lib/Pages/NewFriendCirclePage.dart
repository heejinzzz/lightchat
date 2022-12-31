import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lightchat_app/Clients/FriendCircleManager.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/Storage/LightChatUserId.dart';
import 'package:lightchat_app/config.dart';
import 'package:lightchat_app/proto/FriendCircleManager.pbgrpc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import "package:photo_view/photo_view_gallery.dart";
import 'package:fixnum/fixnum.dart' as $fixnum;
import "package:fluttertoast/fluttertoast.dart";
import "package:dio/dio.dart" as dio;

class NewFriendCirclePage extends StatefulWidget {
  const NewFriendCirclePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewFriendCirclePage();
  }

}

class _NewFriendCirclePage extends State<NewFriendCirclePage> {
  late TextEditingController _inputController;
  late FocusNode _inputFocusNode;
  late List<AssetEntity> _selectedAssets;
  late int _currentViewImageIndex;
  late PageController _viewImagePageController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _inputController.addListener(() { setState(() {}); });
    _inputFocusNode = FocusNode();

    _selectedAssets = [];

    _currentViewImageIndex = 0;
    _viewImagePageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> gridItems = [];
    for (var i = 0; i < _selectedAssets.length; i++) {
      gridItems.add(
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _currentViewImageIndex = i;
                    _viewImagePageController = PageController(initialPage: i);
                  });
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return StatefulBuilder(builder: (context, childSetState) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.black,
                          centerTitle: true,
                          title: Text(
                              "${_currentViewImageIndex+1} / ${_selectedAssets.length}",
                              style: const TextStyle(color: Colors.white)
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectedAssets.removeAt(_currentViewImageIndex);
                                });
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.delete, color: Colors.white),
                            )
                          ],
                        ),
                        body: PhotoViewGallery(
                          pageController: _viewImagePageController,
                          pageOptions: _selectedAssets.map((imageAsset) {
                            return PhotoViewGalleryPageOptions(
                              imageProvider: AssetEntityImageProvider(imageAsset),
                              minScale: PhotoViewComputedScale.contained,
                            );
                          }).toList(),
                          onPageChanged: (index) {
                            childSetState(() {
                              _currentViewImageIndex = index;
                            });
                          },
                        ),
                      );
                    });
                  }));
                },
                child: Image(image: AssetEntityImageProvider(_selectedAssets[i]), fit: BoxFit.cover),
              )
          )
      );
    }
    if (gridItems.length < 9) {
      gridItems.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: GestureDetector(
              onTap: () async {
                var assets = await AssetPicker.pickAssets(
                  context,
                  pickerConfig: AssetPickerConfig(
                    themeColor: Colors.blue,
                    maxAssets: 9,
                    requestType: RequestType.image,
                    selectedAssets: _selectedAssets
                  ),
                );
                if (assets != null) {
                  setState(() {
                    _selectedAssets = assets;
                  });
                }
              },
              child: Image.asset("assets/AddImageButton.png", fit: BoxFit.cover),
            ),
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("发布朋友圈"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: (_inputController.text.isEmpty && _selectedAssets.isEmpty) ? ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                  foregroundColor: MaterialStateProperty.all(Colors.grey[600])
              ),
              child: const Text("发布"),
            ) : ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.blue)
              ),
              onPressed: () {
                // 发布朋友圈
                showLightChatLoadingDialog(context: context, title: "正在发布");
                Future(() async {
                  var myId = await getMyId(context);
                  if (myId == null) {
                    return;
                  }
                  var friendCircle = FriendCircle(
                    userId: myId,
                    content: _inputController.text,
                    imageNum: _selectedAssets.length,
                    timestamp: $fixnum.Int64(DateTime.now().millisecondsSinceEpoch),
                  );
                  var res = await friendCircleManagerClient.publish(friendCircle);
                  if (!res.succeed) {
                    Navigator.of(context).pop();
                    Fluttertoast.showToast(
                      msg: "发布失败",
                      backgroundColor: Colors.grey[300],
                      textColor: Colors.black,
                    );
                    return;
                  }
                  for (var i = 0; i < _selectedAssets.length; i++) {
                    var imageFile = await _selectedAssets[i].originFile;
                    if (imageFile == null) {
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                        msg: "发布失败",
                        backgroundColor: Colors.grey[300],
                        textColor: Colors.black,
                      );
                      return;
                    }
                    var multipartFile = await dio.MultipartFile.fromFile(imageFile.path, filename: "image");
                    await dio.Dio().post(
                      "http://$fileManagerAddr/uploadFriendCircle",
                      data: dio.FormData.fromMap({
                        "id": res.id.toString(),
                        "index": i,
                        "image": multipartFile,
                      })
                    );
                  }
                  Navigator.of(context).pop();
                  Navigator.of(context).pop("refresh");
                  Fluttertoast.showToast(
                    msg: "发布成功",
                    backgroundColor: Colors.grey[300],
                    textColor: Colors.black,
                  );
                }).then((value) {});
              },
              child: const Text("发布"),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          TextField(
            controller: _inputController,
            focusNode: _inputFocusNode,
            minLines: 6,
            maxLines: 40,
            maxLength: 800,
            decoration: const InputDecoration(
              counterText: "",
              hintText: "分享新鲜事...",
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none
            )
          ),
          ColoredBox(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    _inputFocusNode.unfocus();
                    showModalBottomSheet(context: context, builder: (childContext) {
                      return Container(
                        margin: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
                        padding: const EdgeInsets.all(10),
                        height: 0.4 * MediaQuery.of(context).size.height,
                        color: const Color(0xFFEBEFF2),
                        child: EmojiPicker(
                          textEditingController: _inputController,
                          onEmojiSelected: (category, emoji) {
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          onBackspacePressed: () {
                            if (mounted) {
                              setState(() {});
                            }
                          },
                        ),
                      );
                    });
                  },
                  icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: 1/1,
              children: gridItems
            ),
          )
        ],
      ),
    );
  }

}