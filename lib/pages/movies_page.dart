import 'package:flutter/material.dart';
import 'package:imdb/entities/movie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:imdb/datasources/tmdb_api.dart';
import 'package:imdb/widgets/movie_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

  bool isInitiated = false;

  List<Movie> movies = [];

  @override
  Widget build(BuildContext context) {

    if (!isInitiated) {
      isInitiated = true;
      TMDB().getTrendingMovies().then((movies) {
        setState(() {
          this.movies = movies;
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Trending Movies',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Filmes mais populares hoje',
          style: TextStyle(
              color: AppColors.primaryYellow,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: MovieCard(movie: movies[index]),
            );
          }),
        )
      ]),
    );
  }
}

