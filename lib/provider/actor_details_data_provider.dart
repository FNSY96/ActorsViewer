import 'package:actors_viewer/api_repository/actor_details_api_repository.dart';

class ActorDetailsDataProvider {
  getActorDetails(int id) async {
    await ActorDetailsApiRepository().getActorDetails(id);
  }

  getActorImages(int id) async {
    await ActorDetailsApiRepository().getActorImages(id);
  }
}
