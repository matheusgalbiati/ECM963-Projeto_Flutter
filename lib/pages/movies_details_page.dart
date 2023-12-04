import 'package:flutter/material.dart';
import 'package:imdb/entities/movie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibir a imagem do filme
              Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.backdropPath}',
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
              const SizedBox(height: 16.0),
              // Exibir informações do filme
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Lançamento: ${dateFormat.format(movie.releaseDate)}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Descrição: ${movie.overview}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Classificação Adulta: ${movie.isAdult ? 'Sim' : 'Não'}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Popularidade: ${movie.popularity}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Nota Média: ${movie.voteAverage}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Contagem de Votos: ${movie.voteCount}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}