import 'package:actors_viewer/api_requests_classes/popular_actor.dart';
import 'package:actors_viewer/connectivity/custom_http.dart';
import 'package:actors_viewer/constants/api_constants.dart';

// https://api.themoviedb.org/3/person/popular?api_key=dc4d03981be01e72d96d348ff03bf807&language=en-US&page=1
class PopularActorsDataApiRepository {
  Future<DataModel> getPopularActors(int page) async {
    String path = '/person/popular';
    String encodedJson = await CustomHttp.get(path: path, params: {
      'api_key': ApiConstants.API_KEY,
      'language': 'en-US',
      'page': page.toString()
    });

    return DataModel.fromJson(encodedJson);
  }
}
