import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/news_controller.dart';

class ElteSekWebsiteScreen extends GetView<NewsController> {
  const ElteSekWebsiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _websiteUrl = "https://sek.elte.hu/";
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.loadWebView(url: _websiteUrl),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return RefreshIndicator(
                onRefresh: () => controller.reload(),
                child: WebViewWidget(
                  controller: controller.webViewController,
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
