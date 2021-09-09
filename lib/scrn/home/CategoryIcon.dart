import 'package:flutter/material.dart';
import 'package:intrale/scrn/home/CategoryIconValue.dart';
import 'package:intrale/scrn/home/MenuDetail.dart';

class CategoryIcon extends StatefulWidget {
  @override
  CategoryIconState createState() => new CategoryIconState();
}

/// Detail Product for Recomended Grid in home screen
class CategoryIconState extends State<CategoryIcon> {
  @override
  Widget build(BuildContext context) {
    /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
    var onClickMenuIcon = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new menuDetail(),
          transitionDuration: Duration(milliseconds: 750),

          /// Set animation with opacity
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.0),
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
            child: Text(
              'menu',
              style: TextStyle(
                  fontSize: 13.5,
                  fontFamily: "Sans",
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),

          /// Get class CategoryIconValue
          CategoryIconValue(
            tap1: onClickMenuIcon,
            icon1: "assets/icon/camera.png",
            title1: 'camera',
            tap2: onClickMenuIcon,
            icon2: "assets/icon/food.png",
            title2: 'food',
            tap3: onClickMenuIcon,
            icon3: "assets/icon/handphone.png",
            title3: 'handphone',
            tap4: onClickMenuIcon,
            icon4: "assets/icon/game.png",
            title4: 'gamming',
          ),
          Padding(padding: EdgeInsets.only(top: 23.0)),
          CategoryIconValue(
            icon1: "assets/icon/fashion.png",
            tap1: onClickMenuIcon,
            title1: 'fashion',
            icon2: "assets/icon/health.png",
            tap2: onClickMenuIcon,
            title2: 'healthCare',
            icon3: "assets/icon/pc.png",
            tap3: onClickMenuIcon,
            title3: 'computer',
            icon4: "assets/icon/mesin.png",
            tap4: onClickMenuIcon,
            title4: 'equipment',
          ),
          Padding(padding: EdgeInsets.only(top: 23.0)),
          CategoryIconValue(
            icon1: "assets/icon/otomotif.png",
            tap1: onClickMenuIcon,
            title1: 'otomotif',
            icon2: "assets/icon/sport.png",
            tap2: onClickMenuIcon,
            title2: 'sport',
            icon3: "assets/icon/ticket.png",
            tap3: onClickMenuIcon,
            title3: 'ticketCinema',
            icon4: "assets/icon/book.png",
            tap4: onClickMenuIcon,
            title4: 'books',
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0))
        ],
      ),
    );
  }
}
