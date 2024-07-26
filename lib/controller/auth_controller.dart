import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/user.dart';
import '../repositories/auth_repository.dart';
import '../repositories/user_repository.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final userRepo = Get.put(UserRepository());

  final phoneNumber = TextEditingController();
  final otp = TextEditingController();

  Rx<bool> otpSent = false.obs;

  void verifyPhoneNumber(String phoneNumber) {
    AuthRepository.instance.verifyPhoneNumber(phoneNumber);
    otpSent.value = true;
  }

  Future<bool> verifiyOtp(String otp) async {
    final user = await AuthRepository.instance.verfiyOtp(otp);
    if (user != null) {
      final User userData = User(
        id: user.uid,
        phoneNumber: "+91${phoneNumber.text.trim()}",
      );
      userRepo.createUser(userData);
      return true;
    }
    return false;
  }

  googleAuthentication() async {
    final user = await AuthRepository.instance.googleAuthentication();
    final User userData = User(
      id: user?.uid,
      phoneNumber: user?.phoneNumber,
      name: user?.displayName,
      email: user?.email,
    );
    userRepo.createUser(userData);
  }

  Future<void> logout() async {
    await AuthRepository.instance.logout();
  }
}
