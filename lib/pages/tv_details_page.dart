import 'package:flutter/material.dart';
import 'package:imdb/entities/serie.dart';
import 'package:imdb/shared/app_colors.dart';

class SerieDetailsPage extends StatelessWidget {
  final Serie serie;

  const SerieDetailsPage({Key? key, required this.serie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Série'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibir a imagem da série
              Image.network(
                'https://image.tmdb.org/t/p/w500/${serie.backdropPath}',
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
              const SizedBox(height: 16.0),
              // Exibir informações da série
              Text(
                serie.title,
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Lançamento: ${serie.releaseDate}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Descrição: ${serie.overview}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Classificação Adulta: ${serie.isAdult ? 'Sim' : 'Não'}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Popularidade: ${serie.popularity}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Nota Média: ${serie.voteAverage}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Contagem de Votos: ${serie.voteCount}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
