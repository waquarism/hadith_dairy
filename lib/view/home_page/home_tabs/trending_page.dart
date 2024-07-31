import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/widget_helpers/app_text.dart';
import '../../../controller/news_controller.dart';
import '../../../model/news.dart';
import '../home_page.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    final newsData = newsController.news;

    return Obx(
      () {
        return newsController.news.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.headingText(
                        text: "There is no news", color: Colors.white),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, Homepage.route());
                      },
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              )
            : Center(
                child: SizedBox(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (var data in newsData) ...[
                        NewsCard(newsData: data),
                      ]
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsData});

  final News newsData;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      color: const Color(0xffFFF2C5),
      elevation: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.newsHeadingText(text: "${newsData.title}"),
          SizedBox(
            height: 10,
          ),
          AppText.newsTimeText(text: "Published at: ${newsData.publishedAt}"),
          SizedBox(
            height: 5,
          ),
          AppText.newsAuthorText(text: "Published by: ${newsData.author}"),
          SizedBox(
            height: 10,
          ),
          AppText.newsDescriptionText(
              text: "Published by: ${newsData.description}"),
        ],
      ).paddingAll(24),
    ).marginSymmetric(horizontal: 24, vertical: 10);
  }
}
