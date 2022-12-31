import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'FriendCirclePage.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiscoveryPageState();
  }

}

class _DiscoveryPageState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ColoredBox(
            color: Colors.grey[300]!,
            child: ListView(
              children: [
                RawMaterialButton(
                  fillColor: Colors.white,
                  splashColor: Colors.grey,
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                      return FriendCirclePage(
                        H: MediaQuery.of(context).size.height,
                        W: MediaQuery.of(context).size.width,
                        userId: "",
                        broadcast: true,
                      );
                    }));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.camera, color: Colors.orange),
                    title: Text("朋友圈"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                const SizedBox(height: 10),
                RawMaterialButton(
                  fillColor: Colors.white,
                  splashColor: Colors.grey,
                  elevation: 0,
                  onPressed: () {
                    _showNotImplementDialog(context, "轻聊阅读", const Icon(Icons.menu_book, color: Colors.blue));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.menu_book, color: Colors.blue),
                    title: Text("阅读"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                const Divider(height: 0),
                RawMaterialButton(
                  fillColor: Colors.white,
                  splashColor: Colors.grey,
                  elevation: 0,
                  onPressed: () {
                    _showNotImplementDialog(context, "轻聊音乐", const Icon(Icons.music_note, color: Colors.green));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.music_note, color: Colors.green),
                    title: Text("音乐"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
                const Divider(height: 0),
                RawMaterialButton(
                  fillColor: Colors.white,
                  splashColor: Colors.grey,
                  elevation: 0,
                  onPressed: () {
                    _showNotImplementDialog(context, "轻聊影院", const Icon(Icons.movie, color: Colors.purple));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.movie, color: Colors.purple),
                    title: Text("影院"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _showNotImplementDialog(context, String title, Icon icon) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        icon: icon,
        title: Text(title, overflow: TextOverflow.ellipsis),
        content: const Text(
          "模块尚未开放，请关注 LightChat-轻聊 后续更新！",
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
        actions: [
          Column(
            children: [
              const Divider(height: 0),
              RawMaterialButton(
                splashColor: Colors.grey,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: const [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          "知道了",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                )
              )
            ],
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
      );
    });
  }

}