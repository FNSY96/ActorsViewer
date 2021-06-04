import 'package:actors_viewer/api_repository/actors_data_api_repository.dart';
import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:rxdart/rxdart.dart';

class ActorsViewingController {
  BehaviorSubject<ActorDetails> _actorDetailsController = BehaviorSubject();

  Stream<ActorDetails> get actorDetailsStream => _actorDetailsController.stream;

  getActor(int id) {
    ActorsDataApiRepository().getActorsDetails(id).then((response) {
      print(response);
      _actorDetailsController.add(response);
    }).catchError((error) {
    });
  }
}
