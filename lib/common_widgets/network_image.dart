import 'package:actors_viewer/constants/image_resources.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CachedNetworkImage getCachedNetworkImage({double width = 100, double height = 100, @required String imageUrl}) {
  return CachedNetworkImage(
    fit: BoxFit.cover,
    width: width,
    height: height,
    imageUrl: imageUrl,
    placeholder: (context, url) =>
    new CircularProgressIndicator(),
    errorWidget: (context, url, error) =>
        Image.asset(ImageResources.personPlaceHolder),
  );
}