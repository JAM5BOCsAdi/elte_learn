import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/contact/elte_sek_contact_screen_map.dart';
import 'package:elte_learn/screens/news/news_screens.dart';
import 'package:latlong2/latlong.dart';

class ContactController extends GetxController {
  final LatLng _initialPosition = LatLng(47.230528336798976, 16.611700263845446);
  final String _urlTemplate = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final List<String> _subdomains = ['a', 'b', 'c'];

  LatLng get getInitialPosition => _initialPosition;
  String get getUrlTemplate => _urlTemplate;
  List<String> get getSubdomains => _subdomains;

  void email() {
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: "sekrh@elte.hu",
    );
    _launch(emailLaunchUri);
  }

  Future<void> website() async {
    await Get.to(() => const NewsScreens(isElteSekWebsite: true, isBackButton: true));
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw "Sikertelen $url";
    }
  }

  Future<void> map() async {
    await Get.to(() => const ElteSekContactScreenMap());
  }
}
