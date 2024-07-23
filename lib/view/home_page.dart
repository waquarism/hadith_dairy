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

    void navigate() {
      Navigator.push(context, AuthPage.route());
    }

    return Scaffold(
      backgroundColor: Color(0xff111111),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Icon(Icons.hd,color: Color(0xffffffff),size: 54,),
            Icon(Icons.explore,color: Color(0xffffffff),size: 54,)
            
          ],
          ).marginSymmetric(vertical: 44,horizontal: 24),
        ],
      ),
    );
  }
}
