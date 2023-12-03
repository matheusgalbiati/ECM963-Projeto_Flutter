// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:imdb/entities/movie.dart';

class MovieModel extends Movie {

  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.isAdult,
    required super.releaseDate,
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
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {

    DateTime date;
    try{
      date = DateTime.parse(map['release_date']);
    } catch (e) {
      date = DateTime.now();
    }

    return MovieModel(
      id: map['id'] as int,
      title: map['title'] as String,
      overview: map['overview'] as String,
      isAdult: map['adult'] as bool,
      releaseDate: date,
      posterPath: map['poster_path'] ?? "",
      backdropPath: map['backdrop_path'] ?? "",
      popularity: map['popularity'] as double,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(id: $id, title: $title, overview: $overview, isAdult: $isAdult, releaseDate: $releaseDate, posterPath: $posterPath, backdropPath: $backdropPath, popularity: $popularity, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

}
