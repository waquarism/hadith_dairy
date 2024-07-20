import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _firestore = FirebaseFirestore.instance;

  createUser(User user) async {
    await _firestore.collection('users').add(user.toJson()).then(
      (value) {
        Get.snackbar('Success', 'User has been created successfully');
      },
    ).catchError((e, stacktrace) {
      Get.snackbar('error', 'something went wrong. Try again.');
      log(e.toString());
    });
  }
}
