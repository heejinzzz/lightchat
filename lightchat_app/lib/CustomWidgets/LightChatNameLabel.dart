import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "../Pages/UserProfilePage.dart";

class LightChatNameLabel extends StatefulWidget {
  final String userId;
  final String name;
  final double? fontSize;

  const LightChatNameLabel({super.key, required this.userId, required this.name, this.fontSize});

  @override
  State<StatefulWidget> createState() {
    return _LightChatNameLabelState();
  }

}

class _LightChatNameLabelState extends State<LightChatNameLabel> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.grey,
      constraints: const BoxConstraints(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return UserProfilePage(userId: widget.userId);
        }));
      },
      child: Text(
        widget.name,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: widget.fontSize ?? Theme.of(context).textTheme.titleMedium?.fontSize,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }

}