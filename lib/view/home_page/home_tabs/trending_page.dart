import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/const/widget_helpers/app_text.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: const Card(
        semanticContainer: true,
        color: Color(0xffFFF2C5),
        elevation: 12,
        child: Column(
          children: [
            
          ],
        ),
      ).marginSymmetric(horizontal: 20, vertical: 20),
    );
  }
}
