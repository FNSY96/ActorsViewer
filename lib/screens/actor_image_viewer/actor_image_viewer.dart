import 'package:actors_viewer/compound_widgets/network_image.dart';
import 'package:actors_viewer/constants/application_messages.dart';
import 'package:actors_viewer/utils/utils.dart';
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
                  title: new Text(ApplicationMessages.savingQuestion),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text(ApplicationMessages.save),
                      onPressed: () async {
                        try {
                          await ImageDownloader.downloadImage(
                              Utils.getActorImageOriginalUrl(imagePath));
                          Fluttertoast.showToast(
                              msg: ApplicationMessages.imageSavedSuccessfully);
                        } catch (e) {
                          Fluttertoast.showToast(
                              msg: ApplicationMessages.somethingWrongHappened);
                        }
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                    new FlatButton(
                      child: new Text(ApplicationMessages.close),
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
              imageUrl: Utils.getActorImageOriginalUrl(imagePath)),
        ),
      ),
    );
  }
}
