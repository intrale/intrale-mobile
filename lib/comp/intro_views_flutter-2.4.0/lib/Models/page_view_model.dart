import 'package:flutter/material.dart';

//view model for pages

const DEFAULT_WIDGET = Text('data');
const DEFAULT_TEXT_STYLE = TextStyle();

class PageViewModel {
  /// Page BackGround Color
  final Color pageColor;

  ///icon image path
  String iconImageAssetPath;

  /// iconColor
  final Color iconColor;

  /// color for background of progress bubbles
  ///
  /// @Default `const Color(0x88FFFFFF)`
  final Color bubbleBackgroundColor;

  /// widget for the title
  ///
  /// _typicaly a Text Widget_
  ///
  /// @Default Textstyle `color: Colors.white , fontSize: 50.0`
  final Widget title;

  /// widget for the body
  ///
  /// _typicaly a Text Widget_
  ///
  /// @Default Textstyle `color: Colors.white, fontSize: 24.0`
  final Widget body;

  /// set default TextStyle for both title and body
  TextStyle textStyle;

  /// Image Widget
  ///
  /// _typicaly a Image Widget_
  final Widget mainImage;

  /// bubble inner Widget
  ///
  /// _typicaly a Image Widget_
  ///
  /// gets overriden by [iconImageAssetPath]
  Widget bubble;

  PageViewModel(
      {required this.pageColor,
      this.iconImageAssetPath = '',
      this.bubbleBackgroundColor = const Color(0x88FFFFFF),
      required this.iconColor,
      required this.title,
      required this.body,
      required this.mainImage,
      this.bubble = DEFAULT_WIDGET,
      this.textStyle = DEFAULT_TEXT_STYLE});

  TextStyle get titleTextStyle {
    return TextStyle(color: Colors.white, fontSize: 50.0).merge(this.textStyle);
  }

  TextStyle get bodyTextStyle {
    return TextStyle(color: Colors.white, fontSize: 24.0).merge(this.textStyle);
  }
}
