import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:fluttertoast/fluttertoast.dart";
import "package:image_gallery_saver/image_gallery_saver.dart";
import "dart:ui" as ui;
import "package:photo_view/photo_view.dart";

class ViewImagePage extends StatefulWidget {
  final Image image;
  final String? heroTag;

  const ViewImagePage(this.image, {super.key, this.heroTag = null});

  @override
  State<StatefulWidget> createState() {
    return _ViewImagePageState();
  }

  // ImageProvider 转 ui.Image
  static Future<ui.Image> loadImageByImageProvider(ImageProvider provider) async {
    Completer<ui.Image> completer = Completer<ui.Image>();  // 完成的回调
    late ImageStreamListener listener;
    ImageStream stream = provider.resolve(ImageConfiguration.empty);  // 获取图片流
    listener = ImageStreamListener((imageInfo, synchronousCall) {
      // 监听
      final ui.Image image = imageInfo.image;
      completer.complete(image);  // 完成
      stream.removeListener(listener);  // 移除监听
    });
    stream.addListener(listener);  // 添加监听
    return completer.future;  // 返回
  }

}

class _ViewImagePageState extends State<ViewImagePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              onLongPress: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        style: ListTileStyle.list,
                        title: const Text("保存到手机", textAlign: TextAlign.center),
                        onTap: () async {
                          Navigator.of(context).pop();
                          var uiImage = await ViewImagePage.loadImageByImageProvider(widget.image.image);
                          var imgData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
                          var imgBytes = imgData?.buffer.asUint8List();
                          final result = await ImageGallerySaver.saveImage(
                              imgBytes!
                          );
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
              child: ColoredBox(
                color: Colors.black,
                child: Center(
                  child: widget.heroTag == null ? PhotoView(
                    minScale: PhotoViewComputedScale.contained,
                    imageProvider: widget.image.image,
                  ) : Hero(
                    tag: widget.heroTag!,
                    child: PhotoView(
                      minScale: PhotoViewComputedScale.contained,
                      imageProvider: widget.image.image,
                    )
                  ),
                ),
              )
          ),
        )
      ],
    );
  }
}