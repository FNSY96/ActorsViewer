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
  String profilePath;
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
      this.profilePath,
      this.name});

  factory ActorDetails.fromJson(String encodedJson) {
    Map<String, dynamic> json = jsonDecode(encodedJson);
    return ActorDetails(
      id: json['id'],
      name: json['name'],
      isAdult: json['adult'],
      biography: json['biography'],
      birthday: json['birthday'],
      deathday: json['deathday'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      placeOfBirth: json['place_of_birth'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
    );
  }
}
