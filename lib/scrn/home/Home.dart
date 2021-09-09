import 'package:flutter/material.dart';
import 'package:intrale/comp/countdown_timer/countDownTimer.dart';

import 'package:intrale/model/HomeGridItemRecomended.dart';
import 'package:intrale/scrn/home/AppbarGradient.dart';
import 'package:intrale/scrn/home/CategoryDetail.dart';
//import 'package:intrale/scrn/home/CategoryIconValue.dart';
import 'package:intrale/scrn/home/CategoryItemValue.dart';
import 'package:intrale/scrn/home/FlashSaleItem.dart';
import 'package:intrale/scrn/home/ImageSlider.dart';
import 'package:intrale/scrn/home/ItemGrid.dart';
//import 'package:intrale/scrn/home/MenuDetail.dart';
import 'package:intrale/util/services/products/read/ReadProductsRequest.dart';
import 'package:intrale/util/services/products/read/ReadProductsService.dart';

class Menu extends StatefulWidget {
  @override
  MenuState createState() => MenuState();
}

/// Component all widget in home
class MenuState extends State<Menu> with TickerProviderStateMixin {
  /// Declare class GridItem from HomeGridItemReoomended.dart in folder ListItem
  GridItem gridItem;

  bool isStarted = false;

  ReadProductsService readProductsServices = new ReadProductsService();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double size = mediaQueryData.size.height;

    /*  /// Navigation to MenuDetail.dart if user Click icon in category Menu like a example camera
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
    };*/

    /// Navigation to promoDetail.dart if user Click icon in Week Promotion
    var onClickWeekPromotion = () {
      /*Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new promoDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));*/
    };

    /// Navigation to categoryDetail.dart if user Click icon in Category
    var onClickCategory = () {
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new categoryDetail(),
          transitionDuration: Duration(milliseconds: 750),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          }));
    };

    /// Declare device Size
    var deviceSize = MediaQuery.of(context).size;

    /// ImageSlider in header
    /*var imageSlider = Container(
      height: 182.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/baner1.png"),
          AssetImage("assets/img/baner12.png"),
          AssetImage("assets/img/baner2.png"),
          AssetImage("assets/img/baner3.png"),
          AssetImage("assets/img/baner4.png"),
        ],
      ),
    );*/

    /// CategoryIcon Component
    /*var categoryIcon = Container(
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
    );*/

    /// ListView a WeekPromotion Component
    /*var PromoHorizontalList = Container(
      color: Colors.white,
      height: 230.0,
      padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: 15.0, bottom: 3.0, right: 20.0),
              child: Text(
                'weekPromotion',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Sans",
                    fontWeight: FontWeight.w700),
              )),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 20.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount1.png")),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount3.png")),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount2.png")),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount4.png")),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount5.png")),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                InkWell(
                    onTap: onClickWeekPromotion,
                    child: Image.asset("assets/imgPromo/Discount6.png")),
              ],
            ),
          ),
        ],
      ),
    );*/

    /// FlashSale component
    /*var FlashSell = Container(
      height: 390.0,
      decoration: BoxDecoration(
        /// To set Gradient in flashSale background
        gradient: LinearGradient(colors: [
          Color(0xFF7F7FD5).withOpacity(0.8),
          Color(0xFF86A8E7),
          Color(0xFF91EAE4)
        ]),
      ),

      /// To set FlashSale Scrolling horizontal
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: mediaQueryData.padding.left + 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/img/flashsaleicon.png",
                    height: deviceSize.height * 0.087,
                  ),
                  Text(
                    'flash',
                    style: TextStyle(
                      fontFamily: "Popins",
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'sale',
                    style: TextStyle(
                      fontFamily: "Sans",
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: mediaQueryData.padding.top + 30),
                  ),
                  Text(
                    'endSaleIn',
                    style: TextStyle(
                      fontFamily: "Sans",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                  ),
                  CountDownTimer(
                      secondsRemaining: 86400,
                      whenTimeExpires: () {
                        setState(() {
                          //hasTimerStopped = true;
                        });
                      },
                      countDownTimerStyle: TextStyle(
                        fontFamily: "Sans",
                        fontSize: 19.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 40.0)),

          /// Get a component flashSaleItem class
          flashSaleItem(
            image: "assets/imgItem/mackbook.jpg",
            title: 'fTitle1',
            normalprice: "\$ 2,020",
            discountprice: "\$ 1,300",
            ratingvalue: "(56)",
            place: 'fPlace1',
            stock: 'fAvailable1',
            colorLine: 0xFFFFA500,
            widthLine: 50.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          flashSaleItem(
            image: "assets/imgItem/flashsale2.jpg",
            title: 'fTitle2',
            normalprice: "\$ 14",
            discountprice: "\$ 10",
            ratingvalue: "(16)",
            place: 'fPlace2',
            stock: 'fAvailable2',
            colorLine: 0xFF52B640,
            widthLine: 100.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          flashSaleItem(
            image: "assets/imgItem/flashsale3.jpg",
            title: 'fTitle3',
            normalprice: "\$ 1,000",
            discountprice: "\$ 950",
            ratingvalue: "(20)",
            place: 'fPlace3',
            stock: 'fAvailable3',
            colorLine: 0xFF52B640,
            widthLine: 90.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          flashSaleItem(
            image: "assets/imgItem/flashsale4.jpg",
            title: 'fTitle4',
            normalprice: "\$ 25",
            discountprice: "\$ 20",
            ratingvalue: "(22)",
            place: 'fPlace4',
            stock: 'fAvailable4',
            colorLine: 0xFFFFA500,
            widthLine: 30.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          flashSaleItem(
            image: "assets/imgItem/flashsale5.jpg",
            title: 'fTitle5',
            normalprice: "\$ 50",
            discountprice: "\$ 30",
            ratingvalue: "(10)",
            place: 'fPlace5',
            stock: 'fAvailable5',
            colorLine: 0xFF52B640,
            widthLine: 100.0,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
        ],
      ),
    );*/

    /// Category Component in bottom of flash sale
    /*var categoryImageBottom = Container(
      height: 310.0,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Text(
              'category',
              style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Sans"),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        CategoryItemValue(
                          image: "assets/imgItem/category2.png",
                          title: 'fashionMan',
                          tap: onClickCategory,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        CategoryItemValue(
                          image: "assets/imgItem/category1.png",
                          title: 'fashionGirl',
                          tap: onClickCategory,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category3.png",
                        title: 'smartphone',
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category4.png",
                        title: 'computer',
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category5.png",
                        title: 'sport',
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category6.png",
                        title: 'fashionKids',
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 15.0)),
                      CategoryItemValue(
                        image: "assets/imgItem/category7.png",
                        title: 'health',
                        tap: onClickCategory,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      CategoryItemValue(
                        image: "assets/imgItem/category8.png",
                        title: 'makeup',
                        tap: onClickCategory,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );*/

    ///  Grid item in bottom of Category
    gridItemArray = new List<GridItem>();
    readProductsServices.post(new ReadProductsRequest()).then((value) => {
          value.products.forEach((element) {
            gridItemArray.add(GridItem(
                id: element.id,
                img: "assets/imgItem/fashion1.jpg",
                title: element.name,
                price: element.price.unitPrice.toString(),
                itemSale: "932 Sale",
                rattingValue: "4.8",
                description: element.description));
          })
        });

    var Grid = SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              child: Text(
                'recomended',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.0,
                ),
              ),
            ),

            /// To set GridView item
            GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 17.0,
                childAspectRatio: 0.545,
                crossAxisCount: 2,
                primary: false,
                children: List.generate(
                  gridItemArray.length,
                  (index) => ItemGrid(gridItemArray[index]),
                ))
          ],
        ),
      ),
    );

    return Scaffold(
      /// Use Stack to costume a appbar
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: mediaQueryData.padding.top + 58.5)),

                /// Call var imageSlider
                new ImageSlider(),

                /// Call var categoryIcon
                /*categoryIcon,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  */
                /// Call var PromoHorizontalList
                //PromoHorizontalList,

                /// Call var a FlashSell, i am sorry Typo :v
                /*FlashSell,
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  categoryImageBottom,
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                  ),
                  */
                /// Call a Grid variable, this is item list in Recomended item
                Grid,
              ],
            ),
          ),

          /// Get a class AppbarGradient
          /// This is a Appbar in home activity
          AppbarGradient(),
        ],
      ),
    );
  }
}
