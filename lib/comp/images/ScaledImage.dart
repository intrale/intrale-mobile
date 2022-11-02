import 'package:flutter/material.dart';
import 'package:intrale/comp/images/CachedImage.dart';

// ignore: must_be_immutable
class ScaledImage extends StatelessWidget {

  final String host;
  final String path;
  final double height;
  final double width;

  ScaledImage({
    this.host = "https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com", 
    required this.path,
    required this.height, 
    required this.width
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              height: height,
              width: width,
              child: 
                CachedImage(
                  path: path,
                  fit: BoxFit.scaleDown,
                  host: host
                )
              );
  }


  
}