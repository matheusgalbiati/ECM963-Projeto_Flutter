import 'package:flutter/material.dart';
import 'package:imdb/entities/person.dart';
import 'package:imdb/helpers/gender_enum.dart';
import 'package:imdb/shared/app_colors.dart';

class PersonDetailsPage extends StatelessWidget {
  final Person person;

  const PersonDetailsPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Pessoa'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibir a imagem da pessoa
              Image.network(
                'https://image.tmdb.org/t/p/w500/${person.profilePath}',
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
              const SizedBox(height: 16.0),
              // Exibir informações da pessoa
              Text(
                person.name,
                style: TextStyle(
                  fontSize: 24.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                'Classificação Adulta: ${person.isAdult ? 'Sim' : 'Não'}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Popularidade: ${person.popularity}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Gênero: ${_getGenderText(person.gender)}',
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

  String _getGenderText(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Masculino';
      case Gender.female:
        return 'Feminino';
      case Gender.other:
        return 'Outro';
      default:
        return 'Desconhecido';
    }
  }
}
