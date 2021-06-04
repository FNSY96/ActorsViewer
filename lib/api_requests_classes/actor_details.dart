import 'dart:convert';

class ActorDetails {
  bool isAdult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  String deathday;
  int gender;
  int id;
  int imbdId;
  String knownFor;
  String placeOfBirth;
  double popularity;
  String profilePath;
  String name;

  ActorDetails(
      {this.isAdult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.deathday,
      this.gender,
      this.id,
      this.imbdId,
      this.knownFor,
      this.placeOfBirth,
      this.popularity,
      this.profilePath,
      this.name});

  factory ActorDetails.fromJson(String encodedJson) {
    Map<String, dynamic> json = jsonDecode(encodedJson);
    return ActorDetails(
        isAdult: json['adult'],
        alsoKnownAs: json['also_known_as'],
        biography: json['biography'],
        deathday: json['deathday'],
        gender: json['gender'],
        id: json['id'],
        imbdId: json['imdb_id'],
        knownFor: json['known_for_department'],
        name: json['name'],
        placeOfBirth: json['place_of_birth'],
        popularity: json['popularity'],
        profilePath: json['profile_path']);
  }
}
