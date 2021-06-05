import 'dart:convert';

class ActorDetails {
  bool isAdult;
  String biography;
  String birthday;
  String deathday;
  int gender;
  int id;
  String knownForDepartment;
  String placeOfBirth;
  double popularity;
  String profileImagePath;
  String name;

  ActorDetails(
      {this.isAdult,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.placeOfBirth,
      this.popularity,
      this.profileImagePath,
      this.name});

  factory ActorDetails.fromJson(String encodedJson) {
    Map<String, dynamic> json = jsonDecode(encodedJson);
    return ActorDetails(
      id: json['id'],
      name: json['name'] ?? '',
      isAdult: json['adult'],
      biography: json['biography'] ?? '',
      birthday: json['birthday'] ?? '',
      deathday: json['deathday'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      placeOfBirth: json['place_of_birth'] ?? '',
      popularity: json['popularity'],
      profileImagePath: json['profile_path'],
    );
  }
}

List<ActorImage> actorImagesFromJson(String encodedJson) {
  Map<String, dynamic> json = jsonDecode(encodedJson);
  List<dynamic> profiles = json['profiles'];
  return List<ActorImage>.from(profiles.map((x) => ActorImage.fromJson(x)));
}

class ActorImage {
  double aspectRatio;
  String imagePath;
  int width;
  int height;

  ActorImage({this.aspectRatio, this.imagePath, this.width, this.height});

  factory ActorImage.fromJson(Map<String, dynamic> json) {
    return ActorImage(
        aspectRatio: json['aspect_ratio'],
        imagePath: json['file_path'] ?? '',
        width: json['width'],
        height: json['height']);
  }
}
