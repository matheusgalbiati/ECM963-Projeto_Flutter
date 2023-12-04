import 'package:dio/dio.dart';
import 'package:imdb/models/movie_model.dart';
import 'package:imdb/models/person_model.dart';
import 'package:imdb/models/serie_model.dart';

class TMDB {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': '69e9e70c4f3579ad97eb8a387141b685',
      'language': 'pt-BR',
    },
  ));

  TMDB();

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await _dio.get('/trending/movie/day');
    return response.data['results']
        .map<MovieModel>((movie) => MovieModel.fromMap(movie))
        .toList();
  }

  Future<List<SerieModel>> getTrendingSeries() async {
    final response = await _dio.get('/trending/tv/day');
    return response.data['results']
        .map<SerieModel>((serie) => SerieModel.fromMap(serie))
        .toList();
  }

  Future<List<PersonModel>> getTrendingPeople() async {
    final response = await _dio.get('/trending/person/day');
    return response.data['results']
        .map<PersonModel>((serie) => PersonModel.fromMap(serie))
        .toList();
  }

  Future<List<MovieModel>> searchMoviesByText(String text) async {
    final response = await _dio.get('/search/movie?query=$text');
    return response.data['results']
        .map<MovieModel>((movie) => MovieModel.fromMap(movie))
        .toList();
  }

  Future<List<SerieModel>> searchSeriesByText(String text) async {
    final response = await _dio.get('/search/tv?query=$text');
    return response.data['results']
        .map<SerieModel>((serie) => SerieModel.fromMap(serie))
        .toList();
  }

  Future<List<PersonModel>> searchPeopleByText(String text) async {
    final response = await _dio.get('/search/person?query=$text');
    return response.data['results']
        .map<PersonModel>((serie) => PersonModel.fromMap(serie))
        .toList();
  }
}
