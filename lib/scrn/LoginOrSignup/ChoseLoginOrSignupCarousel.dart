import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/src/carousel_pro.dart';

class ChoseLoginOrSignupCarousel extends Container{

  ChoseLoginOrSignupCarousel():super(color: Colors.white,
            child: new Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationDuration: Duration(milliseconds: 300),
              dotSize: 0.0,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: false,
              overlayShadow: false,
              images: [
                AssetImage('assets/img/girl.png'),
                AssetImage("assets/img/SliderLogin2.png"),
                AssetImage('assets/img/SliderLogin3.png'),
                AssetImage("assets/img/SliderLogin4.png"),
              ],
            ));
}