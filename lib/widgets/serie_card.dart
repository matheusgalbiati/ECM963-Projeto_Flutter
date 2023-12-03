import 'package:flutter/material.dart';
import 'package:imdb/entities/serie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:intl/intl.dart';

class SerieCard extends StatelessWidget {

  final Serie serie;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  SerieCard({
    super.key,
    required this.serie,
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
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${serie.backdropPath}'),
                  fit: BoxFit.cover
                )
              ),
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
                      serie.title,
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
                          serie.voteAverage.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Text(
                          '| ${serie.voteCount} votos',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                    Text(
                          serie.releaseDate == null ? 'Lançamento: Não informado' :
                          'Lançamento: ${dateFormat.format(serie.releaseDate!)}',
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
