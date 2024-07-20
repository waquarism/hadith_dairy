import 'package:flutter/material.dart';
import 'package:hadith_diary/view/splash.dart';

import '../view/auth_page.dart';
import '../view/home_page.dart';
import '../view/not_found_page.dart';

final Map<String, Route<dynamic> Function()> routes = {
  Splash.routeName: Splash.route,
  AuthPage.routeName: AuthPage.route,
  Homepage.routeName: Homepage.route,
  NotFoundPage.routeName: NotFoundPage.route,
};

