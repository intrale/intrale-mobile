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
              AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),
              AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),
              AssetImage("assets/imgItem/fashion1.jpg" /*gridItem.img*/),
            ],
          ),
        ),
      ),
    );
  }
}
