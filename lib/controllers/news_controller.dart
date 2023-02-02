import '../models/news_article.dart';
import '../packages_barrel/packages_barrel.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  final news = RxList<NewsArticle>();
  // Method for searching for news articles
  void search(String query) async {
    news.value = await NewsService.fetchNews(query: query);
  }
}
