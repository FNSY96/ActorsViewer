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
        body: Container(
          child: Text(id.toString()),
        ));
  }
}
