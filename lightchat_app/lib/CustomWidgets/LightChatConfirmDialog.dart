import 'package:flutter/material.dart';

showLightChatConfirmDialog({
  required BuildContext context,
  String? title,
  required Widget content,
  String? confirmText,
  String? cancelText,
  Color? confirmColor,
  required void Function()? onConfirm,
  void Function()? onCancel}) {
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      title: title == null ? null : Text(title, textAlign: TextAlign.center),
      content: content,
      actions: [
        Column(
          children: [
            const Divider(height: 0),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: RawMaterialButton(
                      onPressed: onCancel ?? () { Navigator.of(context).pop(); },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cancelText ?? "取消",
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
                      onPressed: onConfirm,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          confirmText ?? "确定",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: confirmColor ?? Colors.blue),
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
}

