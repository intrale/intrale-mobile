import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';
import 'package:intrale/comp/images/CachedImage.dart';

class ImageSlider extends StatefulWidget {
  @override
  ImageSliderState createState() => new ImageSliderState();
}

/// Detail Product for Recomended Grid in home screen
class ImageSliderState extends State<ImageSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 121.0,
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
          CachedImage(path:'/dev/files/get/INTRALE/banners/banner1.jpg', fit: BoxFit.fitWidth),
          CachedImage(path:'/dev/files/get/INTRALE/banners/banner2.jpg', fit: BoxFit.fitWidth),
          CachedImage(path:'/dev/files/get/INTRALE/banners/banner3.jpg', fit: BoxFit.fitWidth),
          CachedImage(path:'/dev/files/get/INTRALE/banners/banner4.jpg', fit: BoxFit.fitWidth),
          CachedImage(path:'/dev/files/get/INTRALE/banners/banner5.jpg', fit: BoxFit.fitWidth),
        ],
      ),
    );
  }
}
