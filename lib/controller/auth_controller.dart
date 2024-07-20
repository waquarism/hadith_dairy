import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final otp = TextEditingController();

  Rx<bool> otpSent = false.obs;

  void verifyPhoneNumber(String phoneNumber) {
    AuthRepository.instance.verifyPhoneNumber(phoneNumber);
    otpSent.value = true;
  }

  Future<bool> verifiyOtp(String otp) async {
    var isVerified = await AuthRepository.instance.verfiyOtp(otp);
    return isVerified;
  }

  Future<void> logout() async {
    await AuthRepository.instance.logout();
  }
}
