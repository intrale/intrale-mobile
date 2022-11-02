import 'package:flutter/material.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/model/Product.dart';

import 'package:intrale/scrn/home/ImageSlider.dart';
import 'package:intrale/scrn/home/ItemGrid.dart';
import 'package:intrale/styles/TextStyles.dart';
import 'package:intrale/util/services/products/read/ReadProductsRequest.dart';
import 'package:intrale/util/services/products/read/ReadProductsService.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  bool isStarted = false;
  ReadProductsService? readProductsServices;
  List<Product> gridItemArray = [];

  HomeState() : super() {
    readProductsServices = ReadProductsService();
  }

  @override
  initState() {
    super.initState();
    readProductsServices?.post(request: ReadProductsRequest()).then((value) => {
          setState(() {
            if (value.products != null) {
              gridItemArray = value.products!;
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQueryData();

    var grid = SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TranslatedText(textKey: 'recomended', style: TextStyles.DASHBOARD_GRID_TITLE)
            ),

            /// To set GridView item
            GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 17.0,
                childAspectRatio: 0.89, //0.545,
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
                        top: mediaQueryData.padding.top + 40)),

                /// Call var imageSlider
                ImageSlider(),

                grid,
              ],
            ),
          ),

        ],
      ),
    );
  }
}
