import "package:flutter/material.dart";
import "package:scroll_to_index/scroll_to_index.dart";

class LightChatSideNavigator extends StatefulWidget {
  final List<String> labels;
  final Map<String, int> labelIndexes;
  final AutoScrollController listViewController;

  const LightChatSideNavigator({super.key, required this.labels, required this.labelIndexes, required this.listViewController});

  @override
  State<StatefulWidget> createState() {
    return _LightChatSideNavigator();
  }

}

class _LightChatSideNavigator extends State<LightChatSideNavigator> {
  @override
  Widget build(BuildContext context) {
    List<Widget> labelButtons = [GestureDetector(
      onTap: () {
        widget.listViewController.scrollToIndex(0, preferPosition: AutoScrollPosition.begin);
      },
      child: const Padding(
        padding: EdgeInsets.only(bottom: 1),
        child: Icon(Icons.vertical_align_top, color: Colors.black, size: 10),
      )
    )];
    labelButtons.addAll(
      widget.labels.map((label) {
        return GestureDetector(
          onTap: widget.labelIndexes.containsKey(label) ? () {
            widget.listViewController.scrollToIndex(widget.labelIndexes[label]!, preferPosition: AutoScrollPosition.begin);
          } : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black
              ),
            ),
          ),
        );
      })
    );

    return Column(
      children: labelButtons,
    );
  }

}