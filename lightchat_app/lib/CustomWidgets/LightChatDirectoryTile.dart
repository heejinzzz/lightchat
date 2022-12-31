import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "LightChatAvatar.dart";
import "../Pages/UserProfilePage.dart";

class LightChatDirectoryTile extends StatefulWidget {
  final String id;
  final Image avatar;
  final String name;
  final StreamController refreshController;

  const LightChatDirectoryTile({super.key, required this.id, required this.name, required this.avatar, required this.refreshController});

  @override
  State<StatefulWidget> createState() {
    return _LightChatDirectoryTileState();
  }

}

class _LightChatDirectoryTileState extends State<LightChatDirectoryTile> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
          return UserProfilePage(userId: widget.id, refreshController: widget.refreshController);
        }));
      },
      child: Container(
        color: Colors.white,
        height: 1.0 / 14.0 * MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Container(
              width: 1.0 / 12.0 * MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: SizedBox(
                width: 1.0 / 20.0 * MediaQuery.of(context).size.height,
                height: 1.0 / 20.0 * MediaQuery.of(context).size.height,
                child: LightChatSmallAvatar(
                  userId: widget.id,
                  image: widget.avatar,
                  enableJump: false,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Divider(height: 0, thickness: 0.5)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}