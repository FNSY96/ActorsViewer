import 'package:actors_viewer/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class CustomHttp {
  static Future<String> get(
      {Map<String, dynamic> params, String path = ''}) async {
    try {
      if (params == null) params = {'api_key': ApiConstants.API_KEY};

      String requestPath = ApiConstants.API_VERSION + path;

      Uri uri = Uri(
          scheme: 'https',
          host: ApiConstants.MOVIE_DATABASE_URL,
          path: requestPath,
          queryParameters: params);
      print("URL: $uri");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        print("RESPONSE: ${response.body}");
        return response.body;
      }
    } catch (error) {
      return error.toString();
    }
  }
}
