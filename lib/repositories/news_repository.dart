import 'package:get/get.dart';

import '../model/news.dart';
import '../services/news_serivce.dart';

class NewsRepository extends GetxController {
  static NewsRepository get instance => Get.find();

  final _newsService = NewsSerivce();

  RxList<News> news = <News>[].obs;

  @override
  void onReady() async {
    await fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final response = await _newsService.fetchNews();
      final articles = response["articles"] ?? [];
      news.clear();
      for (var data in articles) {
        news.add(News.fromJson(data));
      }
    } catch (e) {
      print("Error fetching news: $e");
    }

  }
}
