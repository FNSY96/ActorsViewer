import 'package:actors_viewer/constants/image_resources.dart';
import 'package:actors_viewer/utils/utils.dart';
import 'package:flutter/material.dart';

import 'network_image.dart';

Widget getProfilePicture(
    {double width, double height, String profileImagePath}) {
  return ClipOval(
    child: profileImagePath != ''
        ? getCachedNetworkImage(
            width: width,
            height: height,
            imageUrl: Utils.getActorImageWidth300Url(profileImagePath))
        : Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageResources.personPlaceHolder))),
          ),
  );
}
