import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/icons/LocalImageIcon.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:provider/provider.dart';

class AppbarGradient extends StatefulWidget {
  @override
  _AppbarGradientState createState() => _AppbarGradientState();
}

class _AppbarGradientState extends State<AppbarGradient> {
  String CountNotice = "4";

  /// Build Appbar in layout home
  @override
  Widget build(BuildContext context) {
    /// Create responsive height and padding
    final MediaQueryData media = MediaQuery.of(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    /// Create component in appbar
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: 40.0 + statusBarHeight,
      decoration: BoxDecoration(

          /// gradient in appbar
          gradient: LinearGradient(
              colors: [
                const Color(0xFFA3BDED),
                const Color(0xFF6991C7),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          /// if user click shape white in appbar navigate to search layout
          InkWell(
            /// Create shape background white in appbar (background treva shop text)
            child: Container(
              margin: EdgeInsets.only(left: media.padding.left + 15),
              height: 37.0,
              width: 222.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /**/
                  PaddingStyles.ONLY_LEFT_17,
                  Image.asset(
                    "assets/img/Logo.png",
                    height: 22.0,
                  ),
                  PaddingStyles.ONLY_LEFT_17,
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text(
                      FlutterI18n.translate(context, "businessName"),
                      style: TextStyle(
                          fontFamily: "Popins",
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.0,
                          fontSize: 16.4),
                    ),
                  ),
                  /**/
                ],
              ),
            ),
          ),

          /// Icon chat (if user click navigate to chat layout)
          LocalImageIcon(
            localPath: "assets/img/chat.png", 
            onTap: () {
                AppState appState = Provider.of<AppState>(context, listen: false);
                appState.forwardToChat();
                return Future(() {});
              }), 

          /// Icon notification (if user click navigate to notification layout)
          LocalImageIcon(
            localPath: "assets/img/notifications-button.png", 
            onTap: () {
              AppState appState = Provider.of<AppState>(context, listen: false);
              appState.forwardToNotifications();
              return Future(() {});
            },
            notificationCircleText: CountNotice),
        ],
      ),
    );
  }
}
