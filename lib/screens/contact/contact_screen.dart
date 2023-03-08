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
                    child: Stack(
                      children: [
                        FlutterMap(
                          mapController: controller.mapController,
                          options: MapOptions(
                            center: controller.getInitialPosition,
                            zoom: 16.0,
                            maxZoom: 18.0,
                            interactiveFlags: InteractiveFlag.all,
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate: controller.getUrlTemplate,
                              subdomains: controller.getSubdomains,
                            ),
                            MarkerLayerOptions(
                              markers: [
                                Marker(
                                  // width: getWidth * 0.05,
                                  // height: getHeight * 0.05,
                                  point: controller.getInitialPosition,
                                  builder: (_) => Icon(
                                    Icons.location_pin,
                                    color: Colors.red,
                                    size: getHeight * 0.05,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                              // Gap(getHeight * 0.025),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          child: ElevatedButton(
                            onPressed: controller.resetMap,
                            child: Text('Reset Map'),
                          ),
                        ),
                      ],
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
