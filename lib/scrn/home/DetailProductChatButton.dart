import 'package:flutter/material.dart';
import 'package:intrale/scrn/home/ChatItem.dart';
import 'package:intrale/util/tools.dart';

class DetailProductChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        redirectTo(context, chatItem());
      },
      child: Container(
        height: 40.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: Colors.white12.withOpacity(0.1),
            border: Border.all(color: Colors.black12)),
        child: Center(
          child: Image.asset("assets/icon/message.png", height: 20.0),
        ),
      ),
    );
  }
}
