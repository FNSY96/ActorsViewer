import 'package:actors_viewer/api_repository/popular_actors_data_api_repository.dart';
import 'package:actors_viewer/api_requests_classes/popular_actor_details.dart';
import 'package:rxdart/rxdart.dart';

class ActorsViewingController {
  BehaviorSubject<List<PopularActorDetails>> _actorDetailsController = BehaviorSubject();

  Stream<List<PopularActorDetails>> get actorDetailsStream => _actorDetailsController.stream;

  getActor(int id) {
    PopularActorsDataApiRepository().getActorsDetails(id).then((response) {
      print(response);
      _actorDetailsController.add(response);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
