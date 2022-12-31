import 'dart:io';

import 'package:flutter/material.dart';

showLightChatLoadingDialog({required BuildContext context, required String title}) async {
  showDialog(context: context, barrierDismissible: false, builder: (context) {
    return LightChatLoadingDialog(title: title);
  });
}

class LightChatLoadingDialog extends StatefulWidget {
  final String title;

  const LightChatLoadingDialog({super.key, required this.title});

  @override
  State<StatefulWidget> createState() {
    return _LightChatLoadingDialogState();
  }

}

class _LightChatLoadingDialogState extends State<LightChatLoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 0.7*MediaQuery.of(context).size.width,
        child: AlertDialog(
            title: Text(widget.title, textAlign: TextAlign.center),
            content: SizedBox(
              height: 0.25*MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1/1,
                        child: Padding(
                          padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.height),
                          child: CircularProgressIndicator(
                            strokeWidth: 0.01 * MediaQuery.of(context).size.height,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }

}