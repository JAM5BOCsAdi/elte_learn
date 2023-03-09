import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_light_theme.dart';
import '../../configs/themes/ui_parameters.dart';

class PopUp extends GetView<ContactController> {
  final Function() onTapClose;

  const PopUp({super.key, required this.onTapClose});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // title: const Center(child: Text('ELTE SEK')),
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(getHeight * 0.025),
          child: SizedBox(
            height: getHeight * 0.5,
            width: double.maxFinite,
            child: Stack(
              children: [
                GestureDetector(
                  onScaleUpdate: (ScaleUpdateDetails details) => controller.onScaleUpdate(details: details),
                  child: FlutterMap(
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
                ),
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryLightLT),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                        ),
                        onPressed: () => controller.zoomIn(),
                        child: const Icon(Icons.add),
                      ),
                      Gap(getHeight * 0.025),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(primaryLT),
                          minimumSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                        ),
                        onPressed: () => controller.zoomOut(),
                        child: const Icon(Icons.remove),
                      ),
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
          ),
        ),
      ),
    );
  }
}
