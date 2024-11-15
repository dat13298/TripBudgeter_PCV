enum Gender { male, female}

Gender? getGenderFromString(String genderString) {
  try {
    return Gender.values.firstWhere((e) => e.toString().split('.').last == genderString);
  } catch (e) {
    return null;
  }
}
extension GenderExtension on Gender {
  String toStringGender() {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
    }
  }
}