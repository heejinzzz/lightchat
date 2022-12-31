import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightChatLoadingPage extends StatelessWidget {
  const LightChatLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0.4*MediaQuery.of(context).size.width),
      child: const AspectRatio(
        aspectRatio: 1/1,
        child: CircularProgressIndicator(
          strokeWidth: 15,
        ),
      ),
    );
  }

}