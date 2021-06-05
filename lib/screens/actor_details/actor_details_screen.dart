import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:actors_viewer/common_widgets/long_text_viewer.dart';
import 'package:actors_viewer/common_widgets/network_image.dart';
import 'package:actors_viewer/constants/api_constants.dart';
import 'package:actors_viewer/constants/image_size.dart';
import 'package:actors_viewer/constants/routes.dart';
import 'package:actors_viewer/provider/actor_details_data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActorDetailsScreen extends StatefulWidget {
  int id;

  ActorDetailsScreen({this.id});

  @override
  State<StatefulWidget> createState() {
    return ActorDetailsState(id: id);
  }
}

class ActorDetailsState extends State<ActorDetailsScreen> {
  int id;
  ActorDetailsDataProvider provider;

  ActorDetailsState({this.id}) {
    provider = ActorDetailsDataProvider();
    provider.getActorDetails(id);
    provider.getActorImages(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: provider.actorDetailsStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ActorDetails details = snapshot.data;
                    return Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: ClipOval(
                              child: getCachedNetworkImage(
                                  width: 250,
                                  height: 250,
                                  imageUrl: ApiConstants.IMAGES_BASE_URL +
                                      ImageSize.original +
                                      details.profileImagePath),
                            ),
                          ),
                        ),
                        Text(
                          details.name,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              Icon(Icons.cake),
                              Text(details.birthday),
                              Spacer(),
                              Icon(Icons.pin_drop_outlined),
                              Text(details.placeOfBirth)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LongTextViewerWidget(
                          text: details.biography,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
              ),
              SizedBox(
                height: 1000,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: StreamBuilder(
                      stream: provider.actorImagesStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.count(
                            crossAxisCount: 3,
                            children:
                                List.generate(snapshot.data.length, (index) {
                              ActorImage actorImage = snapshot.data[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Routes.ACTOR_IMAGE_VIEWER,
                                      arguments: {
                                        "imagePath": actorImage.imagePath
                                      });
                                },
                                child: Container(
                                  child: getCachedNetworkImage(
                                      imageUrl: ApiConstants.IMAGES_BASE_URL +
                                          ImageSize.original +
                                          actorImage.imagePath),
                                ),
                              );
                            }),
                          );
                        } else {
                          return Container();
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
