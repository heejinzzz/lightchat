import "package:flutter/material.dart";

class LightChatFriendCircleCover extends StatefulWidget {
  final Widget image;
  final String name;
  final Image avatar;
  final AnimationController animationController;
  final ScrollController listViewController;

  const LightChatFriendCircleCover({
    super.key,
    required this.image,
    required this.name,
    required this.avatar,
    required this.animationController,
    required this.listViewController,
  });

  @override
  State<StatefulWidget> createState() {
    return _LightChatFriendCircleCoverState();
  }

}

class _LightChatFriendCircleCoverState extends State<LightChatFriendCircleCover> {

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        if(widget.animationController.value == 0) {
          widget.listViewController.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.linear);
        }
        widget.animationController.animateTo(1-widget.animationController.value);
      },
      child: SizeTransition(
        sizeFactor: widget.animationController.drive(Tween(begin: 0.45, end: 1)),
        child: SizedBox(
          width: double.infinity,
          height: 0.8 * H,
          child: widget.image,
        ),
      ),
    );
  }

}