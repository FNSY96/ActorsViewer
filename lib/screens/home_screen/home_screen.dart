import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'popular_actors_listing_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: PopularActorsListingWidget(),
    );
  }
}
