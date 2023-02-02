import '../models/news_article.dart';
import '../packages_barrel/packages_barrel.dart';

class ArticleDetails extends StatelessWidget {
  final NewsArticle article;

  const ArticleDetails({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title, style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text(article.content),
              SizedBox(height: 8),
              article.imageUrl != null ? Image.network(article.imageUrl) : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
