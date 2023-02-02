import 'package:elte_learn/widgets/article_details.dart';

import '../models/news_article_model.dart';
import '../packages_barrel/packages_barrel.dart';

class NewsCard extends StatelessWidget {
  final NewsArticleModel article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(article.content),
            SizedBox(height: 8),
            article.imageUrl != null ? Image.network(article.imageUrl) : SizedBox(),
            SizedBox(height: 8),
            FlatButton(
              onPressed: () => Get.to(ArticleDetails(article: article)),
              child: Text('Read more'),
            ),
          ],
        ),
      ),
    );
  }
}
