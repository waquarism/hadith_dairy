import 'package:flutter/material.dart';

import '../view/not_found_page.dart';
import 'route.dart';

Route<dynamic>? routeMiddleware(RouteSettings route) {
  if (!routes.containsKey(route.name)) {
    return NotFoundPage.route();
  }
  return routes[route.name]!();
}
