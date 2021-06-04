import 'package:actors_viewer/screens/actors_viewing_controller.dart';
import 'package:flutter/material.dart';

class ActorsListingWidget extends StatelessWidget {
  ActorsViewingController controller = ActorsViewingController();
  ActorsListingWidget() {
    controller.getActor(2);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}