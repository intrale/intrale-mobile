import 'package:flutter/material.dart';
import 'package:intrale/comp/icons/NotificationCircle.dart';

class LocalImageIcon extends NotificationCircle {

  final Future Function()? onTap;
  final String? notificationCircleText;
  final String localPath;
  final double height;
  final double notificationCircleRadius;
  final Color notificationCircleBackgroundColor;

  LocalImageIcon({
    this.notificationCircleText,
    required this.localPath,
    this.onTap,
    this.height = 24.0,
    this.notificationCircleRadius = 8.6,
    this.notificationCircleBackgroundColor = Colors.redAccent
  });
  
  @override
  Widget addWidget() {
    return Image.asset(
                  localPath,
                  height: height,
                );
  }
  
}