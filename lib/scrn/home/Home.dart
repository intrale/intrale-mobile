import 'package:flutter/material.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/model/Product.dart';

import 'package:intrale/scrn/home/ImageSlider.dart';
import 'package:intrale/scrn/home/ItemGrid.dart';
import 'package:intrale/styles/PaddingStyles.dart';
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

  static const int pageSize = 8;
  ScrollController _controller = ScrollController(initialScrollOffset:  1);
  int pageCount = 0;
  bool listenerBlocked = false;
  

  HomeState() : super() {
    readProductsServices = ReadProductsService();
  }

  @override
  initState() {
    super.initState();
    _controller.addListener(() {executeListener();});
    
  }

  executeListener() {
  if (!listenerBlocked) {
        listenerBlocked = true;
        readProductsServices?.post(request: ReadProductsRequest()).then((value) => {
          setState(() {
            if (value.products != null) {
              
              int startIndex = pageCount * pageSize;
              int endIndex = startIndex + pageSize;

              if (endIndex>value.products!.length){
                endIndex = value.products!.length;
              }

              if (startIndex > value.products!.length){
                pageCount = 0;
                listenerBlocked = false;
                gridItemArray.removeRange(0, pageSize);
                executeListener();
              } else {
                gridItemArray.addAll(value.products!.sublist(startIndex, endIndex));
                debugPrint("gridItemArray.length:" + gridItemArray.length.toString() +  ", pageCount:" + pageCount.toString() +", startIndex:" +startIndex.toString() + ", finalIndex:" + endIndex.toString());
                pageCount++;
                listenerBlocked = false;
              }
            }
          })
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQueryData();

    var grid = /*SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
              child: TranslatedText(textKey: 'recomended', style: TextStyles.DASHBOARD_GRID_TITLE)
            ),*/

            /// To set GridView item
            GridView.count(
                controller: _controller,
                shrinkWrap: false,
                //padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, 
                    vertical: (MediaQuery.of(context).size.height / 5.5) + 10),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 17.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.6),
                crossAxisCount: 2,
                primary: false,
                children: List.generate(
                  gridItemArray.length,
                  (index) => ItemGrid(gridItemArray[index]),
                ))


          /*],
        ),
      ),
    )*/;

    return Scaffold(
      /// Use Stack to costume a appbar
      body: //grid
      Stack(
        children: <Widget>[ 
          ImageSlider(), 
          Container(
            //controller: _controller,
            child: grid /*Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: mediaQueryData.padding.top + 40)),

                /// Call var imageSlider
                ImageSlider(),

                grid,
              ],
            ),*/
          ),

        ],
      ),
    );
  }
}
