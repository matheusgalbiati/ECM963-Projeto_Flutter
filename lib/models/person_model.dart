import 'dart:convert';
import 'package:imdb/entities/person.dart';
import 'package:imdb/helpers/gender_enum.dart';

class PersonModel extends Person {

  PersonModel({
    required super.id, 
    required super.name, 
    super.profilePath, 
    required super.isAdult, 
    required super.popularity, 
    required super.gender});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profilePath': profilePath,
      'isAdult': isAdult,
      'popularity': popularity,
      'gender': gender.toMap,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      profilePath: map['profile_path'],
      isAdult: map['adult'] as bool,
      popularity: map['popularity'] as double,
      gender: GenderExtension.fromMap(map['gender'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) => PersonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(id: $id, name: $name, profilePath: $profilePath, isAdult: $isAdult, popularity: $popularity, gender: $gender)';
  }

  @override
  bool operator ==(covariant PersonModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.profilePath == profilePath &&
      other.isAdult == isAdult &&
      other.popularity == popularity &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      profilePath.hashCode ^
      isAdult.hashCode ^
      popularity.hashCode ^
      gender.hashCode;
  }
}
