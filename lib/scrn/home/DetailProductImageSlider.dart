import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';
import 'package:intrale/comp/images/ScaledImage.dart';
import 'package:intrale/model/Product.dart';

class DetailProductImageSlider extends StatelessWidget {
  Product? gridItem;
  DetailProductImageSlider(this.gridItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Hero(
        tag: "hero-grid-${gridItem?.id}",
        child: Material(
          child: new Carousel(
            dotColor: Colors.black26,
            dotIncreaseSize: 1.7,
            dotBgColor: Colors.transparent,
            autoplay: false,
            boxFit: BoxFit.cover,
            images: [
              ScaledImage( height: 128, width: 128, path: 
                  '/dev/files/get/INTRALE/products/${gridItem?.id}/main.jpg'),
              ScaledImage( height: 128, width: 128, path: 
                  '/dev/files/get/INTRALE/products/${gridItem?.id}/second.jpg'),
              ScaledImage( height: 128, width: 128, path: 
                  '/dev/files/get/INTRALE/products/${gridItem?.id}/third.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
