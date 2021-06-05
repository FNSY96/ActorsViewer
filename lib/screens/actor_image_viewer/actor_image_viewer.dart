import 'package:actors_viewer/compound_widgets/network_image.dart';
import 'package:actors_viewer/constants/api_constants.dart';
import 'package:actors_viewer/constants/image_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: new Text("Do you want to save this image to your local storage?"),
                  // content: new Text("Alert Dialog body"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("Save"),
                      onPressed: () async {
                        try {
                          await ImageDownloader.downloadImage(
                              ApiConstants.IMAGES_BASE_URL +
                                  ImageSize.original +
                                  imagePath);
                          Fluttertoast.showToast(msg: "Image Saved Successfully");

                        } catch (e) {
                          Fluttertoast.showToast(msg: "Something Wrong Happened!");
                        }
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
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
