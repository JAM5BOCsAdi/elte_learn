import 'package:elte_learn/controllers/contact_controller.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight * 0.5,
                    width: double.maxFinite,
                    child: FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                        center: controller.getInitialPosition,
                        zoom: 16.0,
                        maxZoom: 18.0,
                        interactiveFlags: InteractiveFlag.all,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: controller.getInitialPosition,
                              builder: (_) => const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: controller.resetMap,
                        child: Text('Reset Map'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
