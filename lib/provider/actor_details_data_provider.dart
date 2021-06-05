import 'package:actors_viewer/api_repository/actor_details_api_repository.dart';
import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:rxdart/rxdart.dart';

class ActorDetailsDataProvider {
  BehaviorSubject<ActorDetails> _actorDetailsBehaviorSubject =
      BehaviorSubject();

  Stream<ActorDetails> get actorDetailsStream =>
      _actorDetailsBehaviorSubject.stream;

  BehaviorSubject<List<ActorImage>> _actorImagesBehaviorSubject =
      BehaviorSubject();

  Stream<List<ActorImage>> get actorImagesStream =>
      _actorImagesBehaviorSubject.stream;

  getActorDetails(int id) async {
    ActorDetailsApiRepository().getActorDetails(id).then((response) {
      _actorDetailsBehaviorSubject.add(response);
    }).catchError((error) {
      print("ERROR: ${error.toString()}");
      _actorDetailsBehaviorSubject.addError(error);
    });
  }

  getActorImages(int id) async {
    ActorDetailsApiRepository().getActorImages(id).then((response) {
      _actorImagesBehaviorSubject.add(response);
    }).catchError((error) {
      _actorImagesBehaviorSubject.addError(error);
    });
  }
}
