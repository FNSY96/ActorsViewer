import 'package:actors_viewer/common_widgets/network_image.dart';
import 'package:actors_viewer/constants/api_constants.dart';
import 'package:actors_viewer/constants/image_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';

class ActorImageViewer extends StatelessWidget {
  String imagePath;

  ActorImageViewer({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onLongPress: () async {
            print("fady");
            await ImageDownloader.downloadImage(
                ApiConstants.IMAGES_BASE_URL + ImageSize.original + imagePath);
          },
          child: getCachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              imageUrl: ApiConstants.IMAGES_BASE_URL +
                  ImageSize.original +
                  imagePath),
        ),
      ),
    );
  }
}
