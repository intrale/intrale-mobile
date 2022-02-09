import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';

class ImageSlider extends StatefulWidget {
  @override
  ImageSliderState createState() => new ImageSliderState();
}

/// Detail Product for Recomended Grid in home screen
class ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          CachedNetworkImageProvider(
              'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/banners/banner1.jpg'),
          CachedNetworkImageProvider(
              'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/banners/banner2.jpg'),
          CachedNetworkImageProvider(
              'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/banners/banner3.jpg'),
          CachedNetworkImageProvider(
              'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/banners/banner4.jpg'),
          CachedNetworkImageProvider(
              'https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/files/get/INTRALE/banners/banner5.jpg'),

          /*AssetImage("assets/img/baner1.png"),
          AssetImage("assets/img/baner12.png"),
          AssetImage("assets/img/baner2.png"),
          AssetImage("assets/img/baner3.png"),
          AssetImage("assets/img/baner4.png"),*/
        ],
      ),
    );
  }
}
