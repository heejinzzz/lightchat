import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import "package:photo_view/photo_view_gallery.dart";
import "package:image_gallery_saver/image_gallery_saver.dart";
import "package:fluttertoast/fluttertoast.dart";
import "dart:ui" as ui;
import "ViewImagePage.dart";

class ViewFriendCircleImagesPage extends StatefulWidget {
  final String friendCircleId;
  final List<Image> images;
  final int selectIndex;

  const ViewFriendCircleImagesPage({super.key, required this.friendCircleId, required this.images, required this.selectIndex});

  @override
  State<StatefulWidget> createState() {
    return _ViewFriendCircleImagesPageState();
  }

}

class _ViewFriendCircleImagesPageState extends State<ViewFriendCircleImagesPage> {
  late int _nums;
  late List<Image> _images;
  late int _selectIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _images = widget.images;
    _nums = _images.length;
    _selectIndex = widget.selectIndex;
    _pageController = PageController(initialPage: _selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
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
                  var img = await ViewImagePage.loadImageByImageProvider(_images[_selectIndex].image);
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
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: _nums,
            pageController: _pageController,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                minScale: PhotoViewComputedScale.contained,
                imageProvider: _images[index].image,
                heroAttributes: PhotoViewHeroAttributes(tag: "ViewFriendCircleImage-${widget.friendCircleId}-$index"),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
          ),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: PageViewNavigator(pageCount: _nums, selectIndex: _selectIndex),
              )
          )
        ],
      ),
    );
  }

}

class PageViewNavigator extends StatefulWidget {
  final int pageCount;
  final int selectIndex;

  const PageViewNavigator({super.key, required this.pageCount, required this.selectIndex});

  @override
  State<StatefulWidget> createState() {
    return _PageViewNavigatorState();
  }

}

class _PageViewNavigatorState extends State<PageViewNavigator> {
  late int _pageCount;
  late int _lastSelectIndex;
  final List<Icon> _icons = [];

  @override
  void initState() {
    super.initState();
    _pageCount = widget.pageCount;
    _lastSelectIndex = widget.selectIndex;
    for(var i = 0; i < _pageCount; i++) {
      _icons.add(Icon(Icons.circle, color: Colors.grey[700], size: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    _icons[_lastSelectIndex] = Icon(Icons.circle, color: Colors.grey[700], size: 10);
    _icons[widget.selectIndex] = const Icon(Icons.circle, color: Colors.white, size: 10);
    _lastSelectIndex = widget.selectIndex;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _icons.map((icon) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: icon,
        );
      }).toList(),
    );
  }

}