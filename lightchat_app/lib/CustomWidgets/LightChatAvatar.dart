import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "../Pages/ViewImagePage.dart";
import "../Pages/UserProfilePage.dart";

class LightChatSmallAvatar extends StatefulWidget {
  final String userId;
  final Image image;
  final bool enableJump;

  const LightChatSmallAvatar({super.key, required this.userId, required this.image, this.enableJump = true});

  @override
  State<StatefulWidget> createState() {
    return _LightChatSmallAvatarState();
  }

}

class _LightChatSmallAvatarState extends State<LightChatSmallAvatar> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: widget.enableJump ? () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return UserProfilePage(userId: widget.userId);
        }));
      } : null,
      child: AspectRatio(
        aspectRatio: 1/1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: widget.image,
        ),
      )
    );
  }

}

class LightChatBigAvatar extends StatefulWidget {
  final Image image;
  final bool enableView;

  const LightChatBigAvatar(this.image, {super.key, this.enableView = true});

  @override
  State<StatefulWidget> createState() {
    return _LightChatBigAvatarState();
  }

}

class _LightChatBigAvatarState extends State<LightChatBigAvatar> {
  late Image _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: widget.enableView ? () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              body: ViewImagePage(_image, heroTag: "ViewImage-avatar"),
            );
          }));
        } : null,
        child: Hero(
          tag: "ViewImage-avatar",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: _image,
          ),
        )
    );
  }

}