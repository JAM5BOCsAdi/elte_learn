import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_article.dart';

class NewsService {
  static const String apiKey = '5050a9d8b3a144c7852d3e0c01bff74c';
  static const String apiUrl = 'https://newsapi.org/v2/everything';

  // Method for fetching news articles from the API
  static Future<List<NewsArticle>> fetchNews({String query = ''}) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$query&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      // If the API call was successful, parse the JSON response
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> articles = jsonResponse['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      // If the API call was unsuccessful, throw an error
      throw Exception('Failed to load news articles');
    }
  }
}
