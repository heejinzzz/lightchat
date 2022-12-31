import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/Clients/UserManagerClient.dart';
import 'package:lightchat_app/proto/UserManager.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:url_launcher/url_launcher.dart";
import '../Clients/ChatStream.dart';
import "RegisterPage.dart";
import "HomePages.dart";
import "../CustomWidgets/GithubIcon.dart";
import "../CustomWidgets/LightChatLoadingDialog.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late TextEditingController _plNumberInputController;
  late TextEditingController _plPasswordInputController;
  late TextEditingController _slNumberInputController;
  late TextEditingController _slPasswordInputController;

  late bool _enableSMS;
  late int _resendSeconds;

  late int _tabPageIndex;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _plNumberInputController = TextEditingController();
    _plPasswordInputController = TextEditingController();
    _slNumberInputController = TextEditingController();
    _slNumberInputController.addListener(() { setState(() {}); });
    _slPasswordInputController = TextEditingController();

    _enableSMS = true;
    _resendSeconds = 0;

    _tabPageIndex = 0;
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.1 * MediaQuery.of(context).size.width),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              shadowColor: Colors.black,
              elevation: 15,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: EdgeInsets.symmetric(vertical: 0.02 * MediaQuery.of(context).size.height, horizontal: 0),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                    unselectedLabelColor: Colors.black,
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
                    tabs: const [
                      Text("密码登录"),
                      Text("短信登录")
                    ],
                    controller: _tabController,
                    onTap: (index) {
                      setState(() {
                        _tabPageIndex = index;
                      });
                    },
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (widget, animation) {
                      return CupertinoPageTransition(
                        primaryRouteAnimation: animation,
                        secondaryRouteAnimation: animation.drive(Tween(begin: 1, end: 0)),
                        linearTransition: false,
                        child: ScaleTransition(
                          scale: animation,
                          child: widget,
                        ),
                      );
                    },
                    child: Padding(
                      key: ValueKey(_tabPageIndex),
                      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: _tabPageIndex == 0 ? Column(
                        children: [
                          Column(
                            children: [
                              TextField(
                                controller: _plNumberInputController,
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
                              Container(
                                margin: const EdgeInsets.only(top: 2, bottom: 4),
                                child: TextField(
                                  controller: _plPasswordInputController,
                                  maxLength: 18,
                                  decoration: const InputDecoration(
                                      counterText: "",
                                      prefixIcon: Icon(Icons.lock),
                                      hintText: "输入登录密码"
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
                                  onPressed: () {
                                    if (_plNumberInputController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: "请输入手机号",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }
                                    if (_plPasswordInputController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: "请输入密码",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }

                                    showLightChatLoadingDialog(context: context, title: "正在登录");
                                    // 根据手机号和密码登录
                                    Future(() async {
                                      var response = await userManagerClient.loginWithPassword(loginWithPasswordRequest(
                                        number: _plNumberInputController.text,
                                        password: _plPasswordInputController.text
                                      ));
                                      Navigator.of(context).pop();
                                      if (!response.succeed) {
                                        Fluttertoast.showToast(
                                          msg: "手机号或密码错误",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      var prefs = await SharedPreferences.getInstance();
                                      prefs.setString("ID", response.id);
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
                                    "登录",
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
                                        return const RegisterPage();
                                      }),
                                          (route) => false
                                  );
                                },
                                child: Text(
                                    "注册新账号",
                                    style: TextStyle(
                                        fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                        color: Colors.blue
                                    )
                                )
                              )
                            ],
                          ),
                        ],
                      ) : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              TextField(
                                controller: _slNumberInputController,
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
                              Container(
                                margin: const EdgeInsets.only(top: 2, bottom: 4),
                                child: TextField(
                                  controller: _slPasswordInputController,
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
                                              onPressed: _enableSMS && _slNumberInputController.text.isNotEmpty ? () {
                                                setState(() {
                                                  // 请求发送短信
                                                  Future(() async {
                                                    var response = await userManagerClient.requestSMS(requestSMSRequest(
                                                      number: _slNumberInputController.text,
                                                      type: SMSType.LOGIN,
                                                    ));
                                                    var time = DateTime.now().millisecondsSinceEpoch;
                                                    var prefs = await SharedPreferences.getInstance();
                                                    prefs.setString("LoginCheckCode", "$time-${_slNumberInputController.text}-${response.code}");
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
                                    if (_slNumberInputController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: "请输入手机号",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }
                                    if (_slPasswordInputController.text.isEmpty) {
                                      Fluttertoast.showToast(
                                        msg: "请输入短信验证码",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }

                                    // 检查输入的验证码是否正确
                                    var prefs = await SharedPreferences.getInstance();
                                    var savedCode = prefs.getString("LoginCheckCode");
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
                                    if (splits[1] != _slNumberInputController.text) {
                                      Fluttertoast.showToast(
                                        msg: "验证手机号与登录手机号不一致",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }
                                    if (splits[2] != _slPasswordInputController.text) {
                                      Fluttertoast.showToast(
                                        msg: "验证码错误",
                                        backgroundColor: Colors.grey[300],
                                        textColor: Colors.black,
                                      );
                                      return;
                                    }

                                    showLightChatLoadingDialog(context: context, title: "正在登录");
                                    // 根据手机号和短信验证码登录
                                    Future(() async {
                                      var response = await userManagerClient.loginWithSMS(loginWithSMSRequest(
                                        number: _slNumberInputController.text
                                      ));
                                      Navigator.of(context).pop();
                                      if (!response.succeed) {
                                        Fluttertoast.showToast(
                                          msg: "登录失败，请检查手机号是否正确",
                                          backgroundColor: Colors.grey[300],
                                          textColor: Colors.black,
                                        );
                                        return;
                                      }
                                      var prefs = await SharedPreferences.getInstance();
                                      prefs.setString("ID", response.id);
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
                                    "登录",
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
                                          return const RegisterPage();
                                        }),
                                            (route) => false
                                    );
                                  },
                                  child: Text(
                                      "注册新账号",
                                      style: TextStyle(
                                          fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                          color: Colors.blue
                                      )
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
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