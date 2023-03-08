import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:latlong2/latlong.dart';

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

  void zoomIn() => mapController.move(getInitialPosition, mapController.zoom + 1);

  void zoomOut() => mapController.move(getInitialPosition, mapController.zoom - 1);
}
