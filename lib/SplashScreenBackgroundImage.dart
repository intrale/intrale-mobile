import 'package:flutter/material.dart';

//TODO: La imagen deberia ser cargada dinamicamente
class SplashScreenBackgroundImage extends BoxDecoration {

  SplashScreenBackgroundImage():super(
                                  image: DecorationImage(
                                            image: AssetImage('assets/img/man.png'), 
                                            fit: BoxFit.cover)){}
}