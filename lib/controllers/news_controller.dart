import '../packages_barrel/packages_barrel.dart';

class NewsController extends GetxController {
  late WebViewController webViewController;
  String mobileUrl = "https://m.facebook.com/elte.sek";

  @override
  void onInit() {
    super.onInit();
    initWebViewController();
  }

  void initWebViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setBackgroundColor(Color.fromARGB(0, 255, 255, 255))
      ..setNavigationDelegate(
        NavigationDelegate(
          // onProgress: (int progress) {
          //   // Update loading bar.
          // },
          onPageStarted: (String url) {
            print("Oldal töltődik");
            // Get.snackbar("Oldal töltődik", "Oldal töltődik");
          },
          onPageFinished: (String url) {
            print("Oldal betöltődött");
            // Get.snackbar("Oldal betöltődött", "Oldal betöltődött");
          },
          onWebResourceError: (WebResourceError error) {
            Get.snackbar("Hiba az oldal betöltésekor", "Az oldal nem tudott betöltődni");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(mobileUrl)) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      );
  }

  Future<void> loadWebView() async {
    await webViewController.loadRequest(Uri.parse(mobileUrl));
  }

  Future<void> reload() async {
    await webViewController.reload();
  }
}
