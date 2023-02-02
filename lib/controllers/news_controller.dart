import '../models/news_article_model.dart';
import '../packages_barrel/packages_barrel.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  final news = RxList<NewsArticleModel>();

  void search(String query) async {
    news.value = await NewsService.fetchNews(query: query);
  }
}
