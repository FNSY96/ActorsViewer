import 'dart:convert';

List<PopularActorDetails> popularActorsDetailsFromJson(String encodedJson) {
  List<dynamic> results = jsonDecode(encodedJson)['results'];
  return List<PopularActorDetails>.from(
      results.map((x) => PopularActorDetails.fromJson(x)));
}

class PopularActorDetails {
  String profilePath;
  bool isAdult;
  int id;
  List<KnownFor> knownFor;
  String name;
  double popularity;

  PopularActorDetails(
      {this.profilePath,
      this.isAdult,
      this.id,
      this.knownFor,
      this.name,
      this.popularity});

  factory PopularActorDetails.fromJson(Map<String, dynamic> json) {
    return PopularActorDetails(
        profilePath: json['profile_path'],
        isAdult: json['adult'],
        id: json['id'],
        knownFor: knownForFromJson(json['known_for']),
        name: json['name'],
        popularity: json['popularity']);
  }
}

List<KnownFor> knownForFromJson(List<dynamic> knownFor) {
  return List<KnownFor>.from(knownFor.map((x) => KnownFor.fromJson(x)));
}

class KnownFor {
  String posterPath;
  double popularity;
  String title;
  String overview;
  String mediaType;

  KnownFor(
      {this.posterPath,
      this.popularity,
      this.title,
      this.overview,
      this.mediaType});

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        title: json['title'] ?? json['name'],
        overview: json['overview'],
        mediaType: json['media_type']);
  }
}
