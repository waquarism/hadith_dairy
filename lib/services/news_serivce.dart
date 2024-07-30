import 'dart:convert';
import 'package:hadith_diary/const/keys.dart';
import 'package:http/http.dart' as http;

class NewsSerivce {
  String apiUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=${AppKeys.newsApiKey}';

  fetchNews() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load Hadith');
    }
  }
}
