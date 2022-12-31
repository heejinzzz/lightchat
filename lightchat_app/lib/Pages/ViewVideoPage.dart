import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightchat_app/CustomWidgets/LightChatLoadingPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class ViewVideoPage extends StatefulWidget {
  final String videoUrl;
  final String videoFileName;

  const ViewVideoPage({super.key, required this.videoUrl, required this.videoFileName});

  @override
  State<StatefulWidget> createState() {
    return _ViewVideoPageState();
  }

}

class _ViewVideoPageState extends State<ViewVideoPage> {
  late String _fileName;
  late String _fileUrl;
  
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  Future _loadData() {
    return Future(() async {
      // 从FileManager或本地加载视频
      var prefs = await SharedPreferences.getInstance();
      var filePath = prefs.getString("FileSave:$_fileUrl");
      if (filePath != null) {
        _videoPlayerController = VideoPlayerController.file(File(filePath));
      } else {
        _videoPlayerController = VideoPlayerController.network(_fileUrl);
      }
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        optionsBuilder: (context, defaultOptions) async {
          await showModalBottomSheet(context: context, backgroundColor: Colors.white, builder: (sheetContext) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("保存到手机", textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    // 将视频保存到手机
                    if (_videoPlayerController.dataSourceType == DataSourceType.file) {
                      Fluttertoast.showToast(
                        msg: "视频已保存在手机中",
                        backgroundColor: Colors.grey[300],
                        textColor: Colors.black,
                      );
                      return;
                    }
                    double processValue = 0;
                    bool downloading = false;
                    showDialog(context: context, barrierDismissible: false, builder: (context) {
                      return AlertDialog(
                        title: const Text("正在保存", textAlign: TextAlign.center),
                        content: StatefulBuilder(builder: (context, childSetState) {
                          if (!downloading) {
                            downloading = true;
                            Future(() async {
                              downloading = true;
                              var dir = await getExternalStorageDirectory();
                              dir ??= await getApplicationDocumentsDirectory();
                              await Dio().download(_fileUrl, "${dir.path}/$_fileName", onReceiveProgress: (received, total) {
                                childSetState(() {
                                  processValue = received / total;
                                });
                              });
                              // 记录文件保存路径
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setString("FileSave:$_fileUrl", "${dir!.path}/$_fileName").then((value) {});
                              });
                              return "${dir.path}/$_fileName";
                            }).then((fileSavePath) {
                              Navigator.of(context).pop();
                              Fluttertoast.showToast(
                                msg: "视频已保存到：$fileSavePath",
                                backgroundColor: Colors.grey[300],
                                textColor: Colors.black,
                              );
                            });
                          }
                          return LinearProgressIndicator(value: processValue);
                        }),
                      );
                    });
                  },
                ),
                const Divider(height: 0),
                ListTile(
                  title: const Text("调整播放速度", textAlign: TextAlign.center),
                  onTap: () {
                    defaultOptions[0].onTap!();
                  },
                ),
                Container(color: Colors.grey[300], height: 7),
                ListTile(
                  title: const Text("取消", textAlign: TextAlign.center),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
        }
      );
    });
  }
  
  @override
  void initState() {
    super.initState();

    _fileName = widget.videoFileName;
    _fileUrl = widget.videoUrl;

    _videoPlayerController = VideoPlayerController.network(_fileUrl);
    _chewieController = ChewieController(videoPlayerController: _videoPlayerController);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Chewie(controller: _chewieController),
            );
          }
          return const LightChatLoadingPage();
        },
      )
    );
  }

}