import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:actors_viewer/connectivity/custom_http.dart';
import 'package:actors_viewer/constants/api_constants.dart';

class ActorDetailsApiRepository {
  Future<ActorDetails> getActorDetails(int id) async {
    String path = '/person/$id';
    String encodedJson = await CustomHttp.get(path: path, params: {
      'api_key': ApiConstants.API_KEY,
      'language': 'en-US',
    });

    return ActorDetails.fromJson(encodedJson);
  }

  Future<List<ActorImage>> getActorImages(int id) async {
    String path = '/person/$id/images';
    String encodedJson = await CustomHttp.get(path: path, params: {
      'api_key': ApiConstants.API_KEY,
      'language': 'en-US',
    });

    return actorImagesFromJson(encodedJson);
  }
}
