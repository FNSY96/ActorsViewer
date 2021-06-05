import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:actors_viewer/compound_widgets/long_text_viewer.dart';
import 'package:actors_viewer/compound_widgets/network_image.dart';
import 'package:actors_viewer/compound_widgets/profile_picture.dart';
import 'package:actors_viewer/constants/routes.dart';
import 'package:actors_viewer/provider/actor_details_data_provider.dart';
import 'package:actors_viewer/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActorDetailsScreen extends StatelessWidget {
  int id;
  ActorDetailsDataProvider provider;

  ActorDetailsScreen({this.id}) {
    provider = ActorDetailsDataProvider();
    provider.getActorDetails(id);
    provider.getActorImages(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [_getActorDetails(), _getActorImages()],
          ),
        ));
  }

  _getActorDetails() {
    return StreamBuilder(
      stream: provider.actorDetailsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ActorDetails details = snapshot.data;
          return Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: getProfilePicture(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      profileImagePath: details.profileImagePath),
                ),
              ),
              Text(
                details.name,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    if (details.birthday.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.cake),
                      ),
                    if (details.birthday.isNotEmpty)
                      Expanded(child: Text(details.birthday)),
                    if (details.birthday.isNotEmpty) Spacer(),
                    if (details.placeOfBirth.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(Icons.pin_drop_outlined),
                      ),
                    if (details.placeOfBirth.isNotEmpty)
                      Expanded(child: Text(details.placeOfBirth))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LongTextViewerWidget(
                text: details.biography,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _getActorImages() {
    return StreamBuilder(
        stream: provider.actorImagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(snapshot.data.length, (index) {
                ActorImage actorImage = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.ACTOR_IMAGE_VIEWER,
                        arguments: {"imagePath": actorImage.imagePath});
                  },
                  child: Container(
                    child: getCachedNetworkImage(
                        imageUrl: Utils.getActorImageOriginalUrl(
                            actorImage.imagePath)),
                  ),
                );
              }),
            );
          } else {
            return Container();
          }
        });
  }
}
