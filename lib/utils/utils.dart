import 'package:actors_viewer/constants/api_constants.dart';
import 'package:actors_viewer/constants/image_size.dart';

class Utils {
  static String getActorImageWidth300Url(String imagePath) {
    return ApiConstants.IMAGES_BASE_URL + ImageSize.width300 + imagePath;
  }

  static String getActorImageWidth500Url(String imagePath) {
    return ApiConstants.IMAGES_BASE_URL + ImageSize.width500 + imagePath;
  }

  static String getActorImageOriginalUrl(String imagePath) {
    return ApiConstants.IMAGES_BASE_URL + ImageSize.original + imagePath;
  }
}
