import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/model/user.dart';
import 'package:hadith_diary/repositories/user_repository.dart';

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
    if (isVerified) {
      UserRepository.instance.createUser(
        User(
          phoneNumber: "+91${phoneNumber.text.trim()}",
        ),
      );
    }
    return isVerified;
  }

  Future<void> logout() async {
    await AuthRepository.instance.logout();
  }
}
