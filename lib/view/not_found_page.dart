import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  static const String routeName = '/page-not-found';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const NotFoundPage(),
    );
  }

  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Unable to load the screen.'),
      ),
    );
  }
}
