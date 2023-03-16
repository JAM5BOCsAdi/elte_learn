import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/news_controller.dart';

class ElteSekFacebookScreen extends GetView<NewsController> {
  const ElteSekFacebookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _facebookUrl = "https://m.facebook.com/elte.sek";
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: controller.loadWebView(url: _facebookUrl),
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
