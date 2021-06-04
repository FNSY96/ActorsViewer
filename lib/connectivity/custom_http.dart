import 'package:actors_viewer/constants/api_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CustomHttp {
  static Future<String> get({Map<String, dynamic> params, String path = ''}) async {
    try {
      if (params == null) params = Map();

      String requestPath = path + '?api_key=' + ApiConstants.API_KEY;

      Uri uri = Uri(
          scheme: 'https',
          host: ApiConstants.MOVIE_DATABASE_URL,
          path: requestPath,
          queryParameters: params);
      print(uri);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        // Should not refresh token
        return response.body;
      }
    } catch (error) {
      return error.toString();
    }
  }
}
