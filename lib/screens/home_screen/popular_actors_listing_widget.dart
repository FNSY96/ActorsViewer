import 'package:actors_viewer/screens/actors_viewing_controller.dart';
import 'package:flutter/material.dart';

class PopularActorsListingWidget extends StatelessWidget {
  ActorsViewingController controller = ActorsViewingController();
  PopularActorsListingWidget() {
    controller.getActor(2);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: ,
        itemBuilder: (context, index) {

    });
  }
}