import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends CachedNetworkImage {
  final String host;
  final String path;
  final BoxFit fit;

  CachedImage({
    this.host = "https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com", 
    required this.path,
    this.fit = BoxFit.none
    }) :super(placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              imageUrl:
                  host + path,
              errorWidget: (context, url,
                      error) =>
                  const Icon(
                      Icons.question_answer),
              fit: fit
              );
  
}