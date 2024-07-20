import 'package:get/get.dart';

import '../model/user.dart';

class UserController extends GetxController {
  final Rx<User> _userModel = User().obs;

  User get user => _userModel.value;

  set user(User value) => _userModel.value = value;

  void clear() {
    _userModel.value = User();
  }
}
