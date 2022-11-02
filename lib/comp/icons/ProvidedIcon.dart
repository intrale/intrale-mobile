import 'package:flutter/material.dart';
import 'package:intrale/comp/icons/NotificationCircle.dart';

class ProvidedIcon extends NotificationCircle {

  final Future Function()? onTap;
  final String? notificationCircleText;
  final double notificationCircleRadius;
  final Color notificationCircleBackgroundColor;
  final IconData icon;

  ProvidedIcon({
    required this.icon,
    this.notificationCircleText,
    this.onTap,
    this.notificationCircleRadius = 8.6,
    this.notificationCircleBackgroundColor = Colors.redAccent
  });
  
  @override
  Widget addWidget() {
    return Icon(this.icon);
  }
  
}