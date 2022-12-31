import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingDialog.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:lightchat_app/Pages/LoginPage.dart';
import 'package:lightchat_app/proto/UserManager.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "../CustomWidgets/LightChatAvatar.dart";
import "package:image_picker/image_picker.dart";
import "package:image_cropper/image_cropper.dart";
import "package:fluttertoast/fluttertoast.dart";
import "MyProfilePage.dart";
import "../config.dart";

class ModifyProfilePage extends StatefulWidget {
  const ModifyProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ModifyProfilePageState();
  }

}

class _ModifyProfilePageState extends State<ModifyProfilePage> {
  late Image _avatar;
  late String _name;
  late int _gender;  // 男: 0, 女: 1
  late int _newGender;

  late TextEditingController _nameInputBoxController;

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
      _name = response.name;
      _gender = response.gender.value;
      _newGender = _gender;
      _avatar = Image.network("http://$fileManagerAddr/avatar/$id", fit: BoxFit.cover);
      _nameInputBoxController.text = _name;
    });
  }

  @override
  void initState() {
    super.initState();
    _name = "";
    _gender = -1;
    _newGender = _gender;
    _avatar = Image.network("http://$fileManagerAddr/avatar/0", fit: BoxFit.cover);

    _nameInputBoxController = TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: const Text("修改个人信息"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                RawMaterialButton(
                  constraints: const BoxConstraints(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: Colors.white,
                  elevation: 0,
                  onPressed: () async {
                    // 更换头像
                    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(imageFile != null) {
                      var croppedImage = await ImageCropper().cropImage(
                        sourcePath: imageFile.path,
                        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                        uiSettings: [
                          AndroidUiSettings(
                            toolbarTitle: '选择图片',
                            toolbarColor: Colors.black,
                            toolbarWidgetColor: Colors.white,
                            lockAspectRatio: true,
                            hideBottomControls: true,
                          ),
                          IOSUiSettings(
                            title: '选择图片',
                          ),
                        ],
                      );
                      if (croppedImage != null) {
                        showLightChatLoadingDialog(context: context, title: "正在上传");
                        Future(() async {
                          var prefs = await SharedPreferences.getInstance();
                          var id = prefs.getString("ID");
                          var imageBytes = await croppedImage.readAsBytes();
                          await Dio().post(
                              "http://$fileManagerAddr/uploadAvatar/$id",
                              data: FormData.fromMap({"newAvatar": MultipartFile.fromBytes(imageBytes, filename: "avatar")})
                          );
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                            msg: "修改成功",
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          );
                          setState(() {});
                        }).then((value) {});
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "头像",
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                              fontWeight: Theme.of(context).textTheme.titleMedium?.fontWeight,
                              letterSpacing: 1
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: SizedBox(
                              height: 1.0 / 12.0 * MediaQuery.of(context).size.height,
                              width: 1.0 / 12.0 * MediaQuery.of(context).size.height,
                              child: LightChatBigAvatar(
                                _avatar,
                                enableView: false,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.navigate_next, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(height: 0, thickness: 1),
                RawMaterialButton(
                  constraints: const BoxConstraints(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    // 更换昵称
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text("修改昵称", textAlign: TextAlign.center),
                        content: TextField(
                          autofocus: true,
                          controller: _nameInputBoxController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()
                          ),
                          maxLength: 15,
                        ),
                        actions: [
                          Column(
                            children: [
                              const Divider(height: 0),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            "取消",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(width: 0),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          if(_nameInputBoxController.text.length < 3) {
                                            Fluttertoast.showToast(
                                              msg: "保存失败：昵称长度过短！",
                                              backgroundColor: Colors.white,
                                              textColor: Colors.black,
                                            );
                                          } else {
                                            showLightChatLoadingDialog(context: context, title: "正在保存");
                                            Future(() async {
                                              var prefs = await SharedPreferences.getInstance();
                                              var id = prefs.getString("ID");
                                              var response = await userManagerClient.changeUserName(changeUserNameRequest(
                                                id: id,
                                                newName: _nameInputBoxController.text
                                              ));
                                              Navigator.of(context).pop();
                                              Fluttertoast.showToast(
                                                msg: response.succeed ? "保存成功" : "保存失败",
                                                backgroundColor: Colors.white,
                                                textColor: Colors.black,
                                              );
                                              setState(() {});
                                            }).then((value) {});
                                          }
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            "保存",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Text(
                          "昵称",
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                              fontWeight: Theme.of(context).textTheme.titleMedium?.fontWeight,
                              letterSpacing: 1
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                              child: Hero(
                                tag: "name",
                                child: Text(
                                  _name,
                                  style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              )
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.navigate_next, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(height: 0, thickness: 1),
                RawMaterialButton(
                  constraints: const BoxConstraints(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  fillColor: Colors.white,
                  elevation: 0,
                  onPressed: () {
                    // 更换性别
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text("修改性别", textAlign: TextAlign.center),
                        content: StatefulBuilder(
                          builder: (context, setState) {
                            return Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    title: const Text("男"),
                                    value: 0,
                                    groupValue: _newGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _newGender = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RadioListTile(
                                    title: const Text("女"),
                                    value: 1,
                                    groupValue: _newGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _newGender = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        actions: [
                          Column(
                            children: [
                              const Divider(height: 0),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            "取消",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(width: 0),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          // 修改性别
                                          Navigator.of(context).pop();
                                          showLightChatLoadingDialog(context: context, title: "正在保存");
                                          Future(() async {
                                            var prefs = await SharedPreferences.getInstance();
                                            var id = prefs.getString("ID");
                                            var response = await userManagerClient.changeUserGender(changeUserGenderRequest(
                                                id: id,
                                                newGender: Gender.valueOf(_newGender)
                                            ));
                                            Navigator.of(context).pop();
                                            Fluttertoast.showToast(
                                              msg: response.succeed ? "保存成功" : "保存失败",
                                              backgroundColor: Colors.white,
                                              textColor: Colors.black,
                                            );
                                            setState(() {});
                                          }).then((value) {});
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text(
                                            "保存",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      )
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        child: Text(
                          "性别",
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                              fontWeight: Theme.of(context).textTheme.titleMedium?.fontWeight,
                              letterSpacing: 1
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                            child: _gender == -1 ? const SizedBox() : Hero(
                              tag: "genderIcon",
                              child: _gender == 0 ? maleGenderIcon: femaleGenderIcon,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(Icons.navigate_next, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }
          return const LightChatLoadingPage();
        },
      ),
    );
  }

}