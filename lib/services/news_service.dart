import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_article_model.dart';

class NewsService {
  static const String apiKey = '5050a9d8b3a144c7852d3e0c01bff74c';
  static const String apiUrl = 'https://newsapi.org/v2/top-headlines?country=hu';

  static Future<List<NewsArticleModel>> fetchNews({String query = ''}) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$query&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> body = jsonResponse['articles'];
      List<NewsArticleModel> articles = body.map((article) => NewsArticleModel.fromJson(article)).toList();

      print("NewsArticleModel Adatok:");
      print(articles);

      return articles;
    } else {
      throw Exception('Nem sikerült betölteni');
    }
  }
}
