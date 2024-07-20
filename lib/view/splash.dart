import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repositories/auth_repository.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/splash';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const Splash(),
    );
  }

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthRepository());
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
