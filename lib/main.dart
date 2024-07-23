import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/repositories/user_repository.dart';

import 'firebase_options.dart';
import 'repositories/auth_repository.dart';
import 'route/middleware.dart';
import 'view/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  ).then((value) {
    Get.put(AuthRepository());
    Get.put(UserRepository());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: routeMiddleware,
      transitionDuration: const Duration(milliseconds: 600),
      initialRoute: Splash.routeName,
    );
  }
}
