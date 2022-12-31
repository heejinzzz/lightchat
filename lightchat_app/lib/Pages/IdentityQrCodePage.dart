import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:barcode_widget/barcode_widget.dart";
import 'package:image_gallery_saver/image_gallery_saver.dart';
import "../CustomWidgets/LightChatAvatar.dart";
import "dart:ui" as ui;

class IdentityQrCodePage extends StatefulWidget {
  final String id;
  final String name;
  final Image avatar;

  const IdentityQrCodePage({super.key, required this.id, required this.name, required this.avatar});

  @override
  State<StatefulWidget> createState() {
    return _IdentityQrCodePageState();
  }

}

class _IdentityQrCodePageState extends State<IdentityQrCodePage> {
  late Widget _qrImage;
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _qrImage = BarcodeWidget(
      barcode: Barcode.qrCode(),
      data: "LightChatQrCode-${widget.id}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("身份二维码"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      style: ListTileStyle.list,
                      title: const Text("保存到手机", textAlign: TextAlign.center),
                      onTap: () async {
                        var renderObject = _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
                        var img = await renderObject.toImage(pixelRatio: 2.0);
                        var imgData = await img.toByteData(format: ui.ImageByteFormat.png);
                        var imgBytes = imgData?.buffer.asUint8List();
                        final result = await ImageGallerySaver.saveImage(
                            imgBytes!
                        );
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          msg: result["isSuccess"] ? "已保存到手机" : "图片保存失败",
                          backgroundColor: Colors.grey[300],
                          textColor: Colors.black,
                        );
                      },
                    ),
                    Container(color: Colors.grey[300], height: 7),
                    ListTile(
                      style: ListTileStyle.list,
                      title: const Text("取消", textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
            },
            icon: const Icon(Icons.more_horiz),
          )
        ],
      ),
      body: RepaintBoundary(
        key: _globalKey,
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                            aspectRatio: 1/1,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: LightChatBigAvatar(widget.avatar, enableView: false),
                            )
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Hero(
                          tag: "name",
                          child: Text(widget.name, style: Theme.of(context).textTheme.titleLarge),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: _qrImage,
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text("扫一扫，加好友", style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.grey,
                    letterSpacing: 1,
                  )),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

}
