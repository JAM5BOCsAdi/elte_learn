import 'package:webview_flutter/webview_flutter.dart';

import '../../controllers/news_controller.dart';
import '../../packages_barrel/packages_barrel.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = "https://www.facebook.com/elte.sek";
    String mobileUrl = "https://m.facebook.com/";

    final webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromARGB(0, 255, 255, 255))
      ..reload()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('http')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://m.facebook.com/elte.sek"));

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<NewsController>(
          init: NewsController(),
          builder: (_) => FutureBuilder(
            future: _.loadWebView(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return RefreshIndicator(
                  onRefresh: () => _.reload(),
                  child: WebViewWidget(
                    controller: webViewController,
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
      ),
    );
  }
}
