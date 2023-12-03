import 'package:flutter/material.dart';
import 'package:imdb/entities/movie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  MovieCard({
    super.key,
    required this.movie,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
                  colors: [
                    AppColors.white.withOpacity(.2),
                    AppColors.white.withOpacity(.05),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: 
                  movie.backdropPath.isNotEmpty ? DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.backdropPath}'),
                  fit: BoxFit.cover
                )  : null
              ),
              child: movie.backdropPath.isEmpty ? Icon(
                Icons.movie,
                color: AppColors.white,
                size: 50,
              ) : null
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primaryYellow,
                        size: 15,),
                        const SizedBox(width: 5,),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          '| ${movie.voteCount} votos',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                    Text(
                          'Lançamento: ${dateFormat.format(movie.releaseDate)}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
