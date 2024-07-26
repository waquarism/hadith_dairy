import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _firestore = FirebaseFirestore.instance;

  Future<void> createUser(User user) async {
    final DocumentReference documentReference =
        _firestore.collection('users').doc(user.id);
    final DocumentSnapshot snapshot = await documentReference.get();

    if (!snapshot.exists) {
      await documentReference.set(user.toJson()).then(
        (value) {
          Get.snackbar(
            'Success',
            'User has been created successfully',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      ).catchError(
        (e, stacktrace) {
          Get.snackbar(
            'error',
            'something went wrong. Try again.',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      );
    }
    return;
  }
}
