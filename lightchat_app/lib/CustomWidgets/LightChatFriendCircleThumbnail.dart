import "package:flutter/material.dart";

class LightChatFriendCircleThumbnail extends StatefulWidget {
  final String friendCircleId;
  final int imageIndex;
  final Image image;

  const LightChatFriendCircleThumbnail({super.key, required this.friendCircleId, required this.imageIndex, required this.image});

  @override
  State<StatefulWidget> createState() {
    return _LightChatFriendCircleThumbnail();
  }

}

class _LightChatFriendCircleThumbnail extends State<LightChatFriendCircleThumbnail> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/1,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Hero(
          tag: "ViewFriendCircleImage-${widget.friendCircleId}-${widget.imageIndex}",
          child: widget.image,
        ),
      ),
    );
  }

}