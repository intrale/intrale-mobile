import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';
import 'package:intrale/model/Product.dart';

class DetailProductImageSlider extends StatelessWidget {
  Product gridItem;
  DetailProductImageSlider(this.gridItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Hero(
        tag: "hero-grid-${gridItem.id}",
        child: Material(
          child: new Carousel(
            dotColor: Colors.black26,
            dotIncreaseSize: 1.7,
            dotBgColor: Colors.transparent,
            autoplay: false,
            boxFit: BoxFit.cover,
            images: [
              CachedNetworkImageProvider(
                  'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/products/${gridItem.id}/main.jpg'),
              CachedNetworkImageProvider(
                  'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/products/${gridItem.id}/second.jpg'),
              CachedNetworkImageProvider(
                  'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/products/${gridItem.id}/third.jpg'),
              /*AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),
              AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),
              AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),*/
            ],
          ),
        ),
      ),
    );
  }
}
