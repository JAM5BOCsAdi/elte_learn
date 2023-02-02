import '../../controllers/news_controller.dart';
import '../../packages_barrel/packages_barrel.dart';
import '../../widgets/news_card.dart';
import '../../widgets/search_bar.dart';

class NewsScreen extends StatelessWidget {
  final newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    // Call the search method with the default query when the page loads
    newsController.search('ELTE SEK');

    return Scaffold(
      appBar: AppBar(
        title: Text('ELTE SEK News'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(onSearch: (query) => newsController.search(query)),
          ),
          Expanded(
            child: GetBuilder<NewsController>(
              init: NewsController(),
              builder: (newsController) {
                if (newsController.news.isEmpty) {
                  return Center(
                    child: Text('No news articles found'),
                  );
                }
                return ListView.builder(
                  itemCount: newsController.news.length,
                  itemBuilder: (context, index) {
                    return NewsCard(article: newsController.news[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
