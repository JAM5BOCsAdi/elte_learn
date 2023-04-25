import 'package:elte_learn/configs/themes/ui_parameters.dart';

import '../packages_barrel/packages_barrel.dart';
import '../utils/consts.dart';

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
            Get.snackbar(snackBar1, snackBar2);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(urlStartsWith)) {
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
    return SizedBox(
      height: getHeight,
      width: getWidth,
      child: const Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
