import 'package:flutter/cupertino.dart';
import 'package:trip_budgeter_2410/models/e_gender.dart';


class UserInfoProvider extends ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _phone = '';
  late Gender _gender;
  late DateTime _DoB;
  String _password = '';

  String get getFullName => _fullName;

  void setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  String get getEmail => _email;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  String get getPhone => _phone;

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  Gender get getGender => _gender;

  void setGender(Gender value) {
    _gender = value;
    notifyListeners();
  }

  DateTime get getDateOfBirth => _DoB;

  void setDoB(DateTime value) {
    _DoB = value;
    notifyListeners();
  }

  String get getPassword => _password;

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}