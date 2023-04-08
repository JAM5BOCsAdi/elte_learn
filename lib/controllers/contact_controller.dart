import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:latlong2/latlong.dart';

import '../../screens/contact/elte_sek_contact_screen_map.dart';
import '../../screens/news/news_screens.dart';

class ContactController extends GetxController {
  final LatLng _initialPosition = LatLng(47.230528336798976, 16.611700263845446);
  final String _urlTemplate = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final List<String> _subdomains = ['a', 'b', 'c'];

  LatLng get getInitialPosition => _initialPosition;
  String get getUrlTemplate => _urlTemplate;
  List<String> get getSubdomains => _subdomains;

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw "Sikertelen $url";
    }
  }

  void email({required String path}) {
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: path,
    );
    _launch(emailLaunchUri);
  }

  Future<void> website({required String title, required String url, required Color color}) async {
    await Get.to(() => NewsScreens(
          title: title,
          url: url,
          backgroundColor: color,
          isBackButton: true,
        ));
  }

  Future<void> map() async {
    await Get.to(() => const ElteSekContactScreenMap());
  }
}
