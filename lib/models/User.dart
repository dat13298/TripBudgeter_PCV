import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_budgeter_2410/models/e_gender.dart';

class User {
  String? id;
  final String email;
  final String name;
  final String phoneNumber;
  final String passwordHash;
  final Gender gender;
  final DateTime DoB;

  User(
      {this.id,
      required this.email,
      required this.name,
      required this.phoneNumber,
      required this.passwordHash,
      required this.gender,
      required this.DoB});

  static User fromMap(Map<String, dynamic> map, String documentId) {
    Gender? gender = getGenderFromString(map['gender']);
    return User(
        id: documentId,
        email: map['email'],
        name: map['name'],
        phoneNumber: map['phone_number'],
        passwordHash: map['password'],
        gender: gender!,
        DoB: DateTime.fromMillisecondsSinceEpoch(map['DoB']));
  }

  Map<String, dynamic> toMap() {
    Timestamp timestamp = Timestamp.fromDate(DoB);
    return {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'password': passwordHash,
      'gender': gender.toStringGender(),
      'DoB': timestamp
    };
  }
}
