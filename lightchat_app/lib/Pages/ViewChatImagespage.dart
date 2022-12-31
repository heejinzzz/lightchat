import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import "dart:ui" as ui;

import 'ViewImagePage.dart';

class ViewChatImagesPage extends StatefulWidget {
  final List<Image> images;
  final int selectedIndex;

  const ViewChatImagesPage({super.key, required this.images, required this.selectedIndex});

  @override
  State<StatefulWidget> createState() {
    return _ViewChatImagesPageState();
  }

}

class _ViewChatImagesPageState extends State<ViewChatImagesPage> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
    _pageController = PageController(initialPage: widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RawMaterialButton(
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
                    var img = await ViewImagePage.loadImageByImageProvider(widget.images[_currentIndex].image);
                    var imgData = await img.toByteData(format: ui.ImageByteFormat.png);
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
        child: PhotoViewGallery.builder(
          itemCount: widget.images.length,
          pageController: _pageController,
          onPageChanged: (index) {
            _currentIndex = index;
          },
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              minScale: PhotoViewComputedScale.contained,
              imageProvider: widget.images[index].image,
            );
          },
        ),
      ),
    );
  }

}