import "package:flutter/material.dart";

class LightChatTextDivider extends StatefulWidget {
  final String text;

  const LightChatTextDivider(this.text, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _LightChatTextDividerState();
  }

}

class _LightChatTextDividerState extends State<LightChatTextDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.grey[300],
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(widget.text, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }

}