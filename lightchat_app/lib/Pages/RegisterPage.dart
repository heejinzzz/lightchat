import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lightchat_app/proto/UserManager.pb.dart';
import 'package:lightchat_app/proto/UserManager.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:url_launcher/url_launcher.dart";
import '../Clients/ChatStream.dart';
import "../CustomWidgets/GithubIcon.dart";
import "../CustomWidgets/LightChatGenderIcon.dart";
import "HomePages.dart";
import "LoginPage.dart";
import "../CustomWidgets/LightChatLoadingDialog.dart";
import "package:fluttertoast/fluttertoast.dart";
import "../Clients/UserManagerClient.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }

}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _numberInputController;
  late TextEditingController _passwordInputController;
  late TextEditingController _checkCodeInputController;
  late TextEditingController _nameInputController;
  late TextEditingController _idInputController;
  late int _gender;  // 男:0, 女:1

  late bool _enableSMS;
  late int _resendSeconds;

  @override
  void initState() {
    super.initState();
    _numberInputController = TextEditingController();
    _numberInputController.addListener(() { setState(() {}); });
    _passwordInputController = TextEditingController();
    _checkCodeInputController = TextEditingController();
    _nameInputController = TextEditingController();
    _idInputController = TextEditingController();
    _gender = -1;

    _enableSMS = true;
    _resendSeconds = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
          SizedBox(
            width: double.infinity,
            height: 0.32 * MediaQuery.of(context).size.height,
            child: Center(
                child: Hero(
                  tag: "LightChatIcon",
                  child: ClipOval(
                      child: Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height: 0.3 * MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Image.asset("assets/LightChatIcon.png", fit: BoxFit.cover),
                      )
                  ),
                )
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 0.45 * MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1 * MediaQuery.of(context).size.width),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                shadowColor: Colors.black,
                elevation: 15,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "注册新账号",
                          style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            TextField(
                              controller: _numberInputController,
                              maxLength: 20,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  prefixIcon: Icon(Icons.phone_android),
                                  hintText: "输入手机号"
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter(
                                    RegExp(
                                      r'[0-9a-zA-Z\.\,\!\?\@\#\$\%\^\&\*\(\)\-\_\=\+ ]',
                                      caseSensitive: false,
                                    ),
                                    allow: true
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              controller: _passwordInputController,
                              maxLength: 18,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "设置登录密码"
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter(
                                    RegExp(
                                      r'[0-9a-zA-Z\.\,\!\?\@\#\$\%\^\&\*\(\)\-\_\=\+ ]',
                                      caseSensitive: false,
                                    ),
                                    allow: true
                                ),
                              ],
                              obscureText: true,
                            ),
                            TextField(
                              controller: _checkCodeInputController,
                              maxLength: 6,
                              decoration: InputDecoration(
                                  counterText: "",
                                  prefixIcon: const Icon(Icons.key),
                                  hintText: "输入短信验证码",
                                  suffixIcon: SizedBox(
                                      height: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                                        child: ElevatedButton(
                                          onPressed: _enableSMS && _numberInputController.text.isNotEmpty ? () {
                                            setState(() {
                                              // 请求发送短信
                                              Future(() async {
                                                var response = await userManagerClient.requestSMS(requestSMSRequest(
                                                  number: _numberInputController.text,
                                                  type: SMSType.REGISTER,
                                                ));
                                                var time = DateTime.now().millisecondsSinceEpoch;
                                                var prefs = await SharedPreferences.getInstance();
                                                prefs.setString("RegisterCheckCode", "$time-${_numberInputController.text}-${response.code}");
                                              }).then((value) {});
                                              _enableSMS = false;
                                              _resendSeconds = 60;
                                              Future(() async {
                                                while (true) {
                                                  await Future.delayed(const Duration(seconds: 1));
                                                  setState(() {
                                                    _resendSeconds--;
                                                  });
                                                  if (_resendSeconds <= 0) {
                                                    return;
                                                  }
                                                }
                                              }).then((value) { setState(() { _enableSMS = true; }); });
                                            });
                                          } : null,
                                          child: Text(_enableSMS ? "发送" : "${_resendSeconds}s后重发"),
                                        ),
                                      )
                                  )
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter(
                                    RegExp(
                                      r'[0-9]',
                                      caseSensitive: false,
                                    ),
                                    allow: true
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              controller: _nameInputController,
                              maxLength: 15,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "设置昵称"
                              ),
                            ),
                            TextField(
                              controller: _idInputController,
                              maxLength: 12,
                              decoration: InputDecoration(
                                  counterText: "",
                                  prefixIcon: const Icon(Icons.edit_note),
                                  hintText: "设置轻聊号",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      showDialog(context: context, builder: (context) {
                                        return AlertDialog(
                                          title: const Text("轻聊号", textAlign: TextAlign.center),
                                          content: const Text(
                                            "轻聊号由8~12位数字或英文字母组成，是轻聊账号的唯一身份标识，设置之后不可更改。",
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
                                    },
                                    child: const ClipOval(
                                      child: ColoredBox(
                                        color: Colors.grey,
                                        child: Icon(Icons.question_mark, size: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints: const BoxConstraints()
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter(
                                    RegExp(
                                      r'[0-9a-zA-Z]',
                                      caseSensitive: false,
                                    ),
                                    allow: true
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Radio(
                                          value: 0,
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value!;
                                            });
                                          }
                                      ),
                                      const Icon(LightChatGenderIcon.maleGenderIcon, color: Colors.blue)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Radio(
                                          value: 1,
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value!;
                                            });
                                          }
                                      ),
                                      const Icon(LightChatGenderIcon.femaleGenderIcon, color: Colors.pink)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                                        foregroundColor: MaterialStateProperty.all(Colors.white),
                                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12))
                                    ),
                                    onPressed: () async {
                                      if (_numberInputController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: "请输入手机号",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_passwordInputController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: "请输入密码",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_passwordInputController.text.length < 6) {
                                        Fluttertoast.showToast(
                                          msg: "登录密码不能少于6位",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_checkCodeInputController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: "请输入短信验证码",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_nameInputController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: "请输入昵称",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_idInputController.text.isEmpty) {
                                        Fluttertoast.showToast(
                                          msg: "请输入轻聊号",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_idInputController.text.length < 8) {
                                        Fluttertoast.showToast(
                                          msg: "轻聊号不能少于8位",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (_gender != 0 && _gender != 1) {
                                        Fluttertoast.showToast(
                                          msg: "请选择性别",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }

                                      // 检查短信验证码填写是否正确以及手机号是否发生更改
                                      var prefs = await SharedPreferences.getInstance();
                                      var savedCode = prefs.getString("RegisterCheckCode");
                                      if (savedCode == null) {
                                        Fluttertoast.showToast(
                                          msg: "验证码错误",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      var splits = savedCode.split("-");
                                      var time = DateTime.fromMillisecondsSinceEpoch(int.parse(splits[0]));
                                      if (DateTime.now().difference(time).inMinutes >= 5) {
                                        Fluttertoast.showToast(
                                          msg: "验证码已过期",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (splits[1] != _numberInputController.text) {
                                        Fluttertoast.showToast(
                                          msg: "验证手机号与提交手机号不一致",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      if (splits[2] != _checkCodeInputController.text) {
                                        Fluttertoast.showToast(
                                          msg: "验证码错误",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }

                                      showLightChatLoadingDialog(context: context, title: "正在注册");
                                      Future(() async {
                                        var response = await userManagerClient.register(registerRequest(
                                          number: _numberInputController.text,
                                          password: _passwordInputController.text,
                                          name: _nameInputController.text,
                                          id: _idInputController.text,
                                          gender: Gender.valueOf(_gender),
                                        ));
                                        Navigator.of(context).pop();
                                        if (!response.idCheck) {
                                          Fluttertoast.showToast(
                                            msg: "轻聊号已被占用，请重新设置",
                                            backgroundColor: Colors.grey[300],
                                            textColor: Colors.black,
                                          );
                                          return;
                                        }
                                        if (!response.numberCheck) {
                                          Fluttertoast.showToast(
                                            msg: "此手机号已注册账号，请更换手机号",
                                            backgroundColor: Colors.grey[300],
                                            textColor: Colors.black,
                                          );
                                          return;
                                        }
                                        var prefs = await SharedPreferences.getInstance();
                                        prefs.setString("ID", _idInputController.text);
                                        Navigator.of(context).pushAndRemoveUntil(
                                            MaterialPageRoute(builder: (context) {
                                              return const HomePages();
                                            }),
                                                (route) => false
                                        );
                                        // 开始监听
                                        await startListenChatStream();
                                      }).then((value) {});
                                    },
                                    child: Text(
                                      "注册",
                                      style: TextStyle(
                                          letterSpacing: 1.5,
                                          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          CupertinoPageRoute(builder: (context) {
                                            return const LoginPage();
                                          }),
                                              (route) => false
                                      );
                                    },
                                    child: Text(
                                        "返回登录页面",
                                        style: TextStyle(
                                            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                            color: Colors.blue
                                        )
                                    )
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                )
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Hero(
                tag: "ContactMeInformation",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "需要帮助？联系我：",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse("mailto:1273860443@qq.com"));
                        },
                        child: const Icon(Icons.email, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse("https://github.com/heejinzzz"));
                        },
                        child: const Icon(GithubIcon.icon, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }

}