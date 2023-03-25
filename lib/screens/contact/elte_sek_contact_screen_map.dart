import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_light_theme.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/zoom_button.dart';

class ElteSekContactScreenMap extends GetView<ContactController> {
  const ElteSekContactScreenMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLightLT,
        centerTitle: true,
        title: const AutoSizeText("ELTE SEK Helyzete"),
        leading: AppCircleButton(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, size: getHeight * 0.035),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: controller.mapController,
            options: MapOptions(
              center: controller.getInitialPosition,
              zoom: 16.0,
              maxZoom: 18.0,
              // interactiveFlags: InteractiveFlag.all,
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
                      color: primaryLT,
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
                ZoomButton(zoom: () => controller.zoomIn(), icon: Icons.add, color: primaryLightLT),
                Gap(getHeight * 0.025),
                ZoomButton(zoom: () => controller.zoomOut(), icon: Icons.remove, color: primaryLT),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 16.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade400),
                // minimumSize: MaterialStateProperty.all<Size>(const Size(20, 40)),
              ),
              onPressed: controller.resetMap,
              child: const AutoSizeText('Visszaállítás'),
            ),
          ),
        ],
      ),
    );
  }
}