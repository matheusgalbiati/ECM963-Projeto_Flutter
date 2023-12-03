import 'package:imdb/helpers/gender_enum.dart';

class Person {

  final int id;
  final String name;
  final String? profilePath;
  final bool isAdult;
  final double popularity;
  final Gender gender;

  Person({
    required this.id, 
    required this.name, 
    this.profilePath, 
    required this.isAdult, 
    required this.popularity, 
    required this.gender});

}