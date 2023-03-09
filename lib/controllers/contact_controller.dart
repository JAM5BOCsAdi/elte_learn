import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/routes/route_names.dart';
import 'package:elte_learn/screens/contact/popUp.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/dialogue.dart';

class ContactController extends GetxController {
  final LatLng _initialPosition = LatLng(47.230528336798976, 16.611700263845446);
  final String _urlTemplate = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  final List<String> _subdomains = ['a', 'b', 'c'];

  final mapController = MapController();

  LatLng get getInitialPosition => _initialPosition;
  String get getUrlTemplate => _urlTemplate;
  List<String> get getSubdomains => _subdomains;

  void resetMap() {
    mapController.move(getInitialPosition, 16.0);
    mapController.rotate(0.0);
  }

  void zoomIn() => mapController.move(mapController.center, mapController.zoom + 1);

  void zoomOut() => mapController.move(mapController.center, mapController.zoom - 1);

  void email() {
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: "sekrh@elte.hu",
    );
    _launch(emailLaunchUri);
  }

  Future<void> website() async {
    await Get.toNamed(RouteNames.websiteScreenRoute);
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw "Sikertelen $url";
    }
  }

  void focus(BuildContext context) {
    // Remove focus from the SelectableText when tapping outside its area
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Future<void> popUp() async {
    await Get.dialog(PopUp(onTapClose: () => Get.back()));
  }
}
