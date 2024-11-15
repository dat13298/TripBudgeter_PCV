import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trip_budgeter_2410/models/User.dart';

class UserService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    final userMap = user.toMap();
    final snapshot = await _userCollection.get();
    if (snapshot.docs.isEmpty) {

      await _userCollection.add({
        'user': [userMap]
      });
    }
  }

  // Future<User> authenticate(String email, String password) async {
  //
  // }
}
