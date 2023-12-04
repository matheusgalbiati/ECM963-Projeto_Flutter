import 'dart:convert';

import 'package:imdb/entities/serie.dart';

class SerieModel extends Serie {

  SerieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.isAdult,
    super.releaseDate,
    required super.posterPath,
    required super.backdropPath,
    required super.popularity,
    required super.voteAverage,
    required super.voteCount,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'isAdult': isAdult,
      'releaseDate': releaseDate?.millisecondsSinceEpoch,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory SerieModel.fromMap(Map<String, dynamic> map) {
    return SerieModel(
      id: map['id'] as int,
      title: map['name'] as String,
      overview: map['overview'] as String,
      isAdult: map['adult'] as bool,
      releaseDate: DateTime.tryParse(map['first_air_date'] as String),
      posterPath: map['poster_path'] as String? ?? "",
      backdropPath: map['backdrop_path'] as String? ?? "",
      popularity: map['popularity'] as double,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SerieModel.fromJson(String source) => SerieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, isAdult: $isAdult, releaseDate: $releaseDate, posterPath: $posterPath, backdropPath: $backdropPath, popularity: $popularity, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

}
