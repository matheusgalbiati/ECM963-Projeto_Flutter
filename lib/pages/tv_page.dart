import 'package:flutter/material.dart';
import 'package:imdb/entities/serie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:imdb/datasources/tmdb_api.dart';
import 'package:imdb/widgets/serie_card.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> {

  bool isInitiated = false;

  List<Serie> series = [];

  @override
  Widget build(BuildContext context) {

    if (!isInitiated) {
      isInitiated = true;
      TMDB().getTrendingSeries().then((series) {
        setState(() {
          this.series = series;
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Trending Series',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Séries mais populares hoje',
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
            itemCount: series.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SerieCard(serie: series[index]),
            );
          }),
        )
      ]),
    );
  }
}

