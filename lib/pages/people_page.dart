import 'package:flutter/material.dart';
import 'package:imdb/entities/person.dart';
import 'package:imdb/pages/person_details_page.dart';
import 'package:imdb/shared/app_colors.dart';
import 'package:imdb/datasources/tmdb_api.dart';
import 'package:imdb/widgets/person_card.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  bool isInitiated = false;

  List<Person> people = [];

  @override
  Widget build(BuildContext context) {
    if (!isInitiated) {
      isInitiated = true;
      TMDB().getTrendingPeople().then((people) {
        setState(() {
          this.people = people;
        });
      });
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Trending People',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Pessoas mais populares hoje',
          style: TextStyle(
              color: AppColors.primaryRed,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonDetailsPage(person: people[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: PersonCard(person: people[index]),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
