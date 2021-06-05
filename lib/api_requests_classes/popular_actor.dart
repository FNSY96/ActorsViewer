import 'dart:convert';

class DataModel {
  int totalPages;
  int totalResults;
  List<PopularActor> data;

  DataModel({
    this.totalPages,
    this.totalResults,
    this.data,
  });

  factory DataModel.fromJson(String encodedJson) {
    Map<String, dynamic> json = jsonDecode(encodedJson);
    return DataModel(
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      data: popularActorsFromJson(json['results']),
    );
  }
}

List<PopularActor> popularActorsFromJson(List<dynamic> results) {
  return List<PopularActor>.from(
      results.map((x) => PopularActor.fromJson(x)));
}

class PopularActor {
  String profileImagePath;
  bool isAdult;
  int id;
  List<KnownFor> knownFor;
  String name;
  double popularity;

  PopularActor(
      {this.profileImagePath,
      this.isAdult,
      this.id,
      this.knownFor,
      this.name,
      this.popularity});

  factory PopularActor.fromJson(Map<String, dynamic> json) {
    return PopularActor(
        profileImagePath: json['profile_path'] ?? '',
        isAdult: json['adult'],
        id: json['id'],
        knownFor: knownForFromJson(json['known_for']),
        name: json['name'] ?? '',
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
