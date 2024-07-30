import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith_diary/const/widget_helpers/app_text.dart';
import 'package:hadith_diary/controller/news_controller.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    return ListView.builder(
      itemCount: newsController.news.length,
      itemBuilder: (BuildContext context, int index){
        var news = newsController.news[index]; 
      return ListTile(
        title: AppText.headingText(text: news.title ?? "Empty Title",color: Colors.white),
        subtitle: AppText.headingText(text: news.author ?? "Unknown Source", color: Colors.white70),
        trailing: AppText.headingText(text: news.publishedAt ?? "00:00",color: Colors.amber),
        
      ).paddingAll(24);
    });
  }
}


// SizedBox(
//       width: double.infinity,
//       height: 400,
//       child: const Card(
//         semanticContainer: true,
//         color: Color(0xffFFF2C5),
//         elevation: 12,
//         child: Column(
//           children: [
            
//           ],
//         ),
//       ).marginSymmetric(horizontal: 20, vertical: 20),
//     );