import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/model/Product.dart';

//import 'package:intrale/model/HomeGridItemRecomended.dart';
import 'package:intrale/scrn/home/AppbarGradient.dart';
import 'package:intrale/scrn/home/ImageSlider.dart';
import 'package:intrale/scrn/home/ItemGrid.dart';
import 'package:intrale/util/services/products/read/ReadProductsRequest.dart';
import 'package:intrale/util/services/products/read/ReadProductsService.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  bool isStarted = false;
  late ReadProductsService readProductsServices;
  List<Product> gridItemArray = [];

  HomeState() : super() {
    readProductsServices = ReadProductsService();
  }

  @override
  initState() {
    super.initState();
    readProductsServices.post(request: ReadProductsRequest()).then((value) => {
          setState(() {
            if (value.products != null) {
              gridItemArray = value.products!;
              /*value.products?.forEach((element) {
                gridItemArray.add(GridItem(
                    id: element.id ?? '',
                    img: "assets/imgItem/fashion1.jpg",
                    title: element.name ?? '',
                    price: element.price?.unitPrice?.toString() ?? '',
                    itemSale: "932 Sale", 
                    rattingValue: "4.8",
                    description: element.description ?? ''));
              });*/
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQueryData();

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
                FlutterI18n.translate(context, 'recomended'),
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
