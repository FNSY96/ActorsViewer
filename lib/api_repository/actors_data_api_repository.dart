import 'package:actors_viewer/api_requests_classes/actor_details.dart';
import 'package:actors_viewer/connectivity/custom_http.dart';

class ActorsDataApiRepository {

  Future<ActorDetails> getActorsDetails(int id) async {
    String path = '/person/' + id.toString();
    String encodedJson = await CustomHttp.get(path: path);
    return ActorDetails.fromJson(encodedJson);
  }
}