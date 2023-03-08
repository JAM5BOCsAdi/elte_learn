import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class ContactController extends GetxController {
  final LatLng _initialPosition = LatLng(47.230528336798976, 16.611700263845446);

  final mapController = MapController();

  LatLng get getInitialPosition => _initialPosition;

  void resetMap() {
    mapController.move(
      getInitialPosition,
      16.0,
    );
    mapController.rotate(0.0);
  }
}
