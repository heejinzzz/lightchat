import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:lightchat_app/Clients/ChatStream.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Clients/UserManagerClient.dart';
import "../CustomWidgets/LightChatAvatar.dart";
import "../CustomWidgets/LightChatGenderIcon.dart";
import '../config.dart';
import '../proto/UserManager.pb.dart';
import "IdentityQrCodePage.dart";
import "ModifyProfilePage.dart";
import "LoginPage.dart";

const maleGenderIcon = Icon(LightChatGenderIcon.maleGenderIcon, color: Colors.blue);
const femaleGenderIcon = Icon(LightChatGenderIcon.femaleGenderIcon, color: Colors.pinkAccent);

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyProfilePageState();
  }

}

class _MyProfilePageState extends State<MyProfilePage> {
  late String _id;
  late String _name;
  late Icon _genderIcon;
  late Image _avatar;

  Future _loadData() {
    return Future(() async {
      var prefs = await SharedPreferences.getInstance();
      var id = prefs.getString("ID");
      if (id == null) {
        prefs.getKeys().forEach((key) async {
          await prefs.remove(key);
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }),
                (route) => false
        );
        return;
      }
      var response = await userManagerClient.getUserInfoById(getUserInfoByIdRequest(id: id));
      _id = id;
      _name = response.name;
      _genderIcon = response.gender == Gender.MALE ? maleGenderIcon : femaleGenderIcon;
      _avatar = Image.network("http://$fileManagerAddr/avatar/$id", fit: BoxFit.cover);
    });
  }

  @override
  void initState() {
    super.initState();
    _id = "";
    _name = "";
    _genderIcon = maleGenderIcon;
    _avatar = Image.network("http://$fileManagerAddr/avatar/0", fit: BoxFit.cover);
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Expanded(
                child: ColoredBox(
                  color: Colors.grey[300]!,
                  child: ListView(
                    children: [
                      ColoredBox(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: AspectRatio(
                                    aspectRatio: 1/1,
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      child: LightChatBigAvatar(_avatar),
                                    )
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                        alignment: Alignment.centerLeft,
                                        child: Hero(
                                          tag: "name",
                                          child: Text(_name, style: Theme.of(context).textTheme.titleLarge),
                                        )
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                        alignment: Alignment.centerLeft,
                                        child: Text("轻聊号：$_id", style: Theme.of(context).textTheme.bodySmall)
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Hero(
                                    tag: "genderIcon",
                                    child: _genderIcon,
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      const SizedBox(height: 15),
                      RawMaterialButton(
                        fillColor: Colors.white,
                        splashColor: Colors.grey,
                        elevation: 0,
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                            return IdentityQrCodePage(
                              id: _id,
                              name: _name,
                              avatar: _avatar,
                            );
                          }));
                        },
                        child: const ListTile(
                          leading: Icon(Icons.qr_code, color: Colors.blue),
                          title: Text("身份二维码"),
                          trailing: Icon(Icons.navigate_next),
                        ),
                      ),
                      const Divider(height: 0),
                      RawMaterialButton(
                        fillColor: Colors.white,
                        splashColor: Colors.grey,
                        elevation: 0,
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                            return const ModifyProfilePage();
                          })).then((value) {
                            setState(() {});
                          });
                        },
                        child: const ListTile(
                          leading: Icon(Icons.edit_note, color: Colors.orange),
                          title: Text("修改个人信息"),
                          trailing: Icon(Icons.navigate_next),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RawMaterialButton(
                        fillColor: Colors.white,
                        splashColor: Colors.grey,
                        elevation: 0,
                        onPressed: () {
                          // TODO: 用户设置
                        },
                        child: const ListTile(
                          leading: Icon(Icons.settings, color: Colors.green),
                          title: Text("设置"),
                          trailing: Icon(Icons.navigate_next),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RawMaterialButton(
                        fillColor: Colors.white,
                        splashColor: Colors.grey,
                        elevation: 0,
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  style: ListTileStyle.list,
                                  title: const Text("退出登录", textAlign: TextAlign.center, style: TextStyle(color: Colors.red)),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    showLightChatLoadingDialog(context: context, title: "正在退出");
                                    Future(() async {
                                      await stopListenChatStream();
                                      var prefs = await SharedPreferences.getInstance();
                                      prefs.getKeys().forEach((key) async {
                                        await prefs.remove(key);
                                      });
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(builder: (context) {
                                            return const LoginPage();
                                          }),
                                              (route) => false
                                      );
                                    }).then((value) {});
                                  },
                                ),
                                const Divider(height: 0),
                                ListTile(
                                  style: ListTileStyle.list,
                                  title: const Text("关闭轻聊", textAlign: TextAlign.center),
                                  onTap: () {
                                    SystemNavigator.pop(animated: true);
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
                        child: const ListTile(
                          leading: Icon(Icons.logout, color: Colors.red),
                          title: Text("退出"),
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
        return const LightChatLoadingPage();
      },
    );
  }

}