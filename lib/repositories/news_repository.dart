import 'package:get/get.dart';

import '../services/news_serivce.dart';

class NewsRepository extends GetxController {
  static NewsRepository get instance => Get.find();

  final _hadithService = NewsSerivce();

  fetchNews() async {
    final response = await _hadithService.fetchNews();
    return response;
  }
}
