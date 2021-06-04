import 'package:actors_viewer/screens/ActorsViewingController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'actors_listing_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: ActorsListingWidget(),
    );
  }
}
