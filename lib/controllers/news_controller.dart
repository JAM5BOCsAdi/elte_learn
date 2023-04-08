import '../packages_barrel/packages_barrel.dart';

class NewsController extends GetxController {
  late WebViewController webViewController;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initWebViewController();
  }

  void initWebViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading.value = true;
          },
          onPageFinished: (String url) {
            isLoading.value = false;
          },
          onWebResourceError: (WebResourceError error) {
            Get.snackbar("Hiba az oldal betöltésekor", "Az oldal nem tudott betöltődni");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://")) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      );
  }

  Future<void> loadWebView({required String url}) async {
    await webViewController.loadRequest(Uri.parse(url));
  }

  Future<void> reload() async {
    await webViewController.reload();
  }

  Widget loadingWidget() {
    return const Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
