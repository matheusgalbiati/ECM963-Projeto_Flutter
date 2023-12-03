enum Gender {
  male,
  female,
  other,
}

extension GenderExtension on Gender {

  int get toMap {
    switch(this){
      case Gender.female:
        return 1;
      case Gender.male:
        return 2;
      default:
        return 0;
    }
  }

  static Gender fromMap(int genderId){
    switch(genderId){
      case 1:
        return Gender.female;
      case 2:
        return Gender.male;
      default:
        return Gender.other;
    }
  }

}

