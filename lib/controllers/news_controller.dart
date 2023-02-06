import '../packages_barrel/packages_barrel.dart';

class NewsController extends GetxController {
  late NewsController controller;

  Future<void> reload() async {
    controller.reload();
  }

  Future<void> loadWebView() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<void> urlLaunch(String url) async {
    // final Uri _url = Uri.parse('https://www.facebook.com/elte.sek');

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
