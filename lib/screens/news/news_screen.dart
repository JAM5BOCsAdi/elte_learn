import '../../controllers/news_controller.dart';
import '../../packages_barrel/packages_barrel.dart';
import '../../services/news_service.dart';
import '../../widgets/news_card.dart';
import '../../widgets/search_bar.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.search('ELTE SEK');

    return Scaffold(
      appBar: AppBar(
        title: Text('ELTE SEK Hírek'),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(onSearch: (query) => controller.search(query)),
            ),
            Expanded(
              child: FutureBuilder(
                future: NewsService.fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text('Nincsenek hírek'),
                    );
                  }
                  print("Adatok (NINCS):");
                  print(snapshot.data);
                  return Text("Something");
                  // return ListView.builder(
                  //   itemCount: snapshot.data.length,
                  //   itemBuilder: (context, index) {
                  //     return NewsCard(article: snapshot.data[index]);
                  //   },
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
