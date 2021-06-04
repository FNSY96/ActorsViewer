import 'package:actors_viewer/api_repository/popular_actors_data_api_repository.dart';
import 'package:provider/provider.dart';

class ActorDetailsDataProvider{

  getActorDetails(int id) async {
    await PopularActorsDataApiRepository().getActorDetails(id);

  }

  getActorImages(int id) async {
    await PopularActorsDataApiRepository().getActorImages(id);

  }

}