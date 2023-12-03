class Serie {

  final int id;
  final String title;
  final String overview;
  final bool isAdult;
  final DateTime? releaseDate;
  final String posterPath;
  final String backdropPath;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  Serie({
    required this.id,
    required this.title,
    required this.overview,
    required this.isAdult,
    this.releaseDate,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

}