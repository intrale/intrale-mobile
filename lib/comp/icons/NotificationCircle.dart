import 'package:flutter/material.dart';
import 'package:intrale/comp/texts/IntraleText.dart';
import 'package:intrale/styles/TextStyles.dart';

abstract class NotificationCircle extends StatelessWidget {

  final Future Function()? onTap;
  final String? notificationCircleText;
  final double notificationCircleRadius;
  final Color notificationCircleBackgroundColor;

  NotificationCircle({
    this.notificationCircleText,
    this.onTap,
    this.notificationCircleRadius = 8.6,
    this.notificationCircleBackgroundColor = Colors.redAccent
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(addWidget());
    if(this.notificationCircleText != null){
        children.add(CircleAvatar(
                  radius: notificationCircleRadius,
                  backgroundColor: notificationCircleBackgroundColor,
                  child: IntraleText( 
                    text: notificationCircleText!,
                    style: TextStyles.APPBAR_CIRCLE_AVATAR,
                  ),
                ));
    }

    return InkWell(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional(-3.0, -3.0),
              children: children,
            ),
          );
  }

  Widget addWidget();
  
}