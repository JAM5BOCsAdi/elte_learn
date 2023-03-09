import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/app_light_theme.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/contact_row.dart';
import '../../widgets/custom_app_bar.dart';

class ContactScreen extends GetView<ContactController> {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kapcsolat",
        appBarHeight: getHeight * 0.02,
        leading: AppCircleButton(
          // clipBehavior: Clip.none,
          // onTap: controller.toggleDrawer,
          child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getWidth * 0.5,
                    height: getHeight * 0.15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/elte_sek.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Gap(getWidth * 0.025),
                  Column(
                    children: [
                      ContactRow(
                        icon: Icons.location_on,
                        text: "9700 Szombathely,\n Károlyi Gáspár tér 4.",
                        enabled: true,
                        onTap: controller.popUp,
                      ),
                      Gap(getHeight * 0.015),
                      const ContactRow(
                        icon: Icons.phone,
                        text: "(94) 504 300",
                      ),
                      Gap(getHeight * 0.015),
                      ContactRow(
                        icon: Icons.mail,
                        text: "sekrh@elte.hu",
                        enabled: true,
                        onTap: controller.email,
                      ),
                      Gap(getHeight * 0.015),
                      ContactRow(
                        icon: Icons.web,
                        text: "https://sek.elte.hu/",
                        enabled: true,
                        onTap: controller.website,
                      ),
                    ],
                  ),
                  Gap(getHeight * 0.025),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(getHeight * 0.025),
                  //   child: SizedBox(
                  //     height: getHeight * 0.5,
                  //     width: double.maxFinite,
                  //     child: Stack(
                  //       children: [
                  //         FlutterMap(
                  //           mapController: controller.mapController,
                  //           options: MapOptions(
                  //             center: controller.getInitialPosition,
                  //             zoom: 16.0,
                  //             maxZoom: 18.0,
                  //             // interactiveFlags: InteractiveFlag.all,
                  //           ),
                  //           layers: [
                  //             TileLayerOptions(
                  //               urlTemplate: controller.getUrlTemplate,
                  //               subdomains: controller.getSubdomains,
                  //             ),
                  //             MarkerLayerOptions(
                  //               markers: [
                  //                 Marker(
                  //                   // width: getWidth * 0.05,
                  //                   // height: getHeight * 0.05,
                  //                   point: controller.getInitialPosition,
                  //                   builder: (_) => Icon(
                  //                     Icons.location_pin,
                  //                     color: primaryLT,
                  //                     size: getHeight * 0.05,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //         Positioned(
                  //           bottom: 16.0,
                  //           right: 16.0,
                  //           child: Column(
                  //             children: [
                  //               ElevatedButton(
                  //                 style: ButtonStyle(
                  //                   backgroundColor: MaterialStateProperty.all<Color>(primaryLightLT),
                  //                   minimumSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  //                 ),
                  //                 onPressed: () => controller.zoomIn(),
                  //                 child: const Icon(Icons.add),
                  //               ),
                  //               Gap(getHeight * 0.025),
                  //               ElevatedButton(
                  //                 style: ButtonStyle(
                  //                   backgroundColor: MaterialStateProperty.all<Color>(primaryLT),
                  //                   minimumSize: MaterialStateProperty.all<Size>(const Size(50, 50)),
                  //                 ),
                  //                 onPressed: () => controller.zoomOut(),
                  //                 child: const Icon(Icons.remove),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Positioned(
                  //           bottom: 10.0,
                  //           left: 16.0,
                  //           child: ElevatedButton(
                  //             style: ButtonStyle(
                  //               backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade400),
                  //               // minimumSize: MaterialStateProperty.all<Size>(const Size(20, 40)),
                  //             ),
                  //             onPressed: controller.resetMap,
                  //             child: const AutoSizeText('Visszaállítás'),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
