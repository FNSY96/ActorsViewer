import 'package:actors_viewer/api_requests_classes/popular_actor.dart';
import 'package:actors_viewer/constants/routes.dart';
import 'package:actors_viewer/provider/popular_actors_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularActorsListingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopularActorsListingState();
  }
}

class PopularActorsListingState extends State<PopularActorsListingWidget> {
  ScrollController _scrollController = new ScrollController();
  PopularActorsDataProvider provider;
  int _page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    provider = Provider.of<PopularActorsDataProvider>(context, listen: false);
    provider.resetStreams();
    provider.getPopularActors(_page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.setLoadingState(LoadMoreStatus.LOADING);
        provider.getPopularActors(++_page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: Consumer<PopularActorsDataProvider>(
        builder: (context, dateModel, child) {
          if (dateModel.popularActorsDetails != null &&
              dateModel.popularActorsDetails.length > 0) {
            return _listView(dateModel);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _listView(PopularActorsDataProvider dataProvider) {
    return ListView.separated(
      itemCount: dataProvider.popularActorsDetails.length,
      controller: _scrollController,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if ((index == dataProvider.popularActorsDetails.length - 1) &&
            dataProvider.popularActorsDetails.length <
                dataProvider.totalResults) {
          return Center(child: CircularProgressIndicator());
        }

        return _buildRow(dataProvider.popularActorsDetails[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildRow(PopularActor details) {
    return GestureDetector(
      // child: ListTile(title: new Text(details.name)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Text(
          details.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.ACTOR_DETAILS, arguments: {'id': details.id});
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
