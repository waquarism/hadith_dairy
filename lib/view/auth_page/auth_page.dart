import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/images.dart';
import '../../const/widget_helpers/app_text.dart';
import '../../controller/auth_controller.dart';
import '../home_page/home_page.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/auth-page';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AuthPage(),
    );
  }

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

    void navigate(bool isVerified) {
      if (isVerified) {
        Navigator.pushReplacement(context, Homepage.route());
      } else {
        Get.snackbar(
          'Incorrect OTP',
          'Please enter a valid OTP',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: WillPopScope(
        onWillPop: () async {
          authController.phoneNumber.clear();
          authController.otp.clear();
          return true;
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.bg),
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.headingText(text: "Continue", size: 32),
                AppText.headingText(
                    text: "with phone number", color: Colors.black87),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.blueGrey,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: authController.phoneNumber,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) {
                        return null;  // It hides the counter.
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        label: Text('PHONE NUMBER'),
                        prefixIcon: Icon(Icons.call),
                        prefix: Text("+91 "),
                        prefixStyle: TextStyle(color: Colors.black),
                      ),
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          AuthController.instance.verifyPhoneNumber(
                            authController.phoneNumber.text.trim(),
                          );
                        }
                      },
                    ),
                  ),
                ).paddingSymmetric(vertical: 12),
                Obx(
                  () {
                    return (authController.otpSent.value)
                        ? Container()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40),
                              side: const BorderSide(color: Colors.blueGrey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AuthController.instance.verifyPhoneNumber(
                                  authController.phoneNumber.text.trim(),
                                );
                              }
                            },
                            child: AppText.buttonText(text: 'Next', size: 12),
                          );
                  },
                ),
                Obx(
                  () {
                    return Column(
                      children: [
                        if (authController.otpSent.value) ...[
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: authController.otp,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  label: Text('OTP'),
                                ),
                                onFieldSubmitted: (value) async {
                                  if (formKey.currentState!.validate()) {
                                    bool isVerified = await AuthController
                                        .instance
                                        .verifiyOtp(
                                            authController.otp.text.trim());

                                    navigate(isVerified);
                                  }
                                },
                              ).marginSymmetric(horizontal: 24),
                            ),
                          ).paddingOnly(bottom: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 40),
                              side: const BorderSide(color: Colors.blueGrey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                bool isVerified = await AuthController.instance
                                    .verifiyOtp(authController.otp.text.trim());
                                navigate(isVerified);
                              }
                            },
                            child: AppText.buttonText(
                                text: 'Verify OTP', size: 12),
                          ),
                        ],
                      ],
                    );
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.blueGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    await authController.googleAuthentication();
                    Navigator.pushReplacement(context, Homepage.route());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(Images.googleLogo, height: 30.0),
                      const SizedBox(width: 10),
                      const Text(
                        'Continue in with Google',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingAll(24),
          ).paddingOnly(top: 280),
        ),
      ),
    );
  }
}
