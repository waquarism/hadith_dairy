import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import 'home_page.dart';

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
        Navigator.push(context, Homepage.route());
      } else {
        Get.snackbar('Incorrect OTP', 'Please enter a valid OTP');
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: authController.phoneNumber,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                label: Text('PHONE NUMBER'),
                prefixIcon: Icon(Icons.vpn_lock_sharp),
              ),
            ),
            Obx(
              () {
                return (authController.otpSent.value)
                    ? Container()
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AuthController.instance.verifyPhoneNumber(
                              authController.phoneNumber.text.trim(),
                            );
                          }
                        },
                        child: const Text("Next"),
                      );
              },
            ),
            Obx(
              () {
                return Column(
                  children: [
                    if (authController.otpSent.value) ...[
                      TextFormField(
                        controller: authController.otp,
                        decoration: const InputDecoration(
                          label: Text('OTP'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            bool isVerified =
                                await AuthController.instance.verifiyOtp(
                              authController.otp.text.trim(),
                              authController.phoneNumber.text.trim(),
                            );

                            navigate(isVerified);
                          }
                        },
                        child: const Text("Verify OTP"),
                      ),
                    ]
                  ],
                );
              },
            ),
          ],
        ).paddingAll(24),
      ),
    );
  }
}
