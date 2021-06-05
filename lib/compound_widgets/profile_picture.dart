import 'package:actors_viewer/constants/api_constants.dart';
import 'package:actors_viewer/constants/image_resources.dart';
import 'package:actors_viewer/constants/image_size.dart';
import 'package:flutter/material.dart';

import 'network_image.dart';

Widget getProfilePicture(
    {double width, double height, String profileImagePath}) {
  return ClipOval(
    child: profileImagePath != ''
        ? getCachedNetworkImage(
            width: width,
            height: height,
            imageUrl: ApiConstants.IMAGES_BASE_URL +
                ImageSize.width300 +
                profileImagePath)
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
