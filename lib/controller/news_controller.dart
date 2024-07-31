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
    await fetchNews();
  }

  fetchNews() {
    news = newsRepo.news;
  }
}
