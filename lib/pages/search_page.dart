import 'package:flutter/material.dart';
import 'package:imdb/datasources/tmdb_api.dart';
import 'package:imdb/entities/movie.dart';
import 'package:imdb/entities/person.dart';
import 'package:imdb/entities/serie.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:imdb/widgets/movie_card.dart';
import 'package:imdb/widgets/person_card.dart';
import 'package:imdb/widgets/serie_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final textController = TextEditingController();

  List<String> searchTypes = ['Filmes', 'Séries', 'Pessoas'];
  String selectedOption = 'Filmes';

  List<Movie> movies = [];
  List<Serie> series = [];
  List<Person> people = [];
  
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      expands: false,
                      cursorColor: AppColors.white,
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Pesquise aqui',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                        onPressed: () async {
                          switch (selectedOption) {
                            case 'Filmes':
                              movies = await TMDB().searchMoviesByText(textController.text);
                              break;
                            case 'Séries':
                              series = await TMDB().searchSeriesByText(textController.text);
                              break;
                            case 'Pessoas':
                              people = await TMDB().searchPeopleByText(textController.text);
                              break;
                            default:
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppColors.white,
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Row(
                children: [
                  ...searchTypes
                      .map(
                        (searchType) => Row(
                          children: [
                            Radio(
                              value: searchType,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value.toString();
                                });
                              },
                            ),
                            Text(
                              searchType,
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            Expanded(
          child: ListView.builder(
            itemCount: 
              selectedOption == 'Filmes' ? movies.length : 
              selectedOption == 'Séries' ? series.length : 
              people.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: selectedOption == 'Filmes' ?  MovieCard(movie: movies[index]) :
              selectedOption == 'Séries' ? SerieCard(serie: series[index]) :
              PersonCard(person: people[index]),
            );
          }),
        )
          ],
        );
  }
}