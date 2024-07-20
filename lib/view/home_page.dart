import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/controller/auth_controller.dart';
import 'package:hadith_diary/view/auth_page.dart';

class Homepage extends StatelessWidget {
  static const String routeName = '/home-page';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Homepage(),
    );
  }

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    void navigate(){
      Navigator.push(context, AuthPage.route());
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HomePage'),
          ElevatedButton(
            onPressed: () async {
              await authController.logout();
              navigate();
            },
            child: const Text('Log out'),
          )
        ],
      ),
    );
  }
}
