import 'package:flutter/material.dart';
import 'package:imdb/entities/person.dart';
import 'package:imdb/shared/app_colors.dart';

class PersonCard extends StatelessWidget {

  final Person person;

  const PersonCard({
    super.key,
    required this.person,
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
                image: person.profilePath != null ? 
                DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${person.profilePath}'),
                  fit: BoxFit.cover
                ) : null
              ),
              child: person.profilePath == null ?
              Icon(
                Icons.person,
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
                      person.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 10,),
                        Text(
                          'Popularidade: ${person.popularity}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal
                          ),
                        )
                      ],
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
