import 'package:get/get.dart';

import '../model/news.dart';
import '../repositories/news_repository.dart';

class NewsController extends GetxController {
  static NewsController get instance => Get.find();

  final newsRepo = Get.put(NewsRepository());

  RxList<News> news = <News>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    super.onReady();
    await fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true); // Set loading to true
      final response = await newsRepo.fetchNews();
      final articles = response["articles"] ?? [];
      news.clear();
      for (var data in articles) {
        news.add(News.fromJson(data));
      }
    } catch (e) {
      print("Error fetching news: $e");
    } finally {
      isLoading(false); // Set loading to false
    }
  }

  void showNews() {
    print("~~~~~~~~~~~~>  $news");
  }
}
