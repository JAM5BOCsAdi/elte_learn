import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/routes/route_names.dart';
import 'package:elte_learn/widgets/drawer_button.dart';
import 'package:elte_learn/widgets/drawer_tile.dart';
import 'package:elte_learn/widgets/expandable_drawer_tile.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.infinity,
      // decoration: BoxDecoration(color: Colors.transparent),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: kOnSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Obx(
                    () => controller.user.value == null
                        ? InkWell(
                            onTap: () => Get.toNamed(RouteNames.loginScreenRoute),
                            child: AutoSizeText(
                              "Jelentkezz be",
                              style: detailText.copyWith(color: kOnSurfaceTextColor),
                              minFontSize: 20.0,
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              controller.user.value!.displayName ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: kOnSurfaceTextColor,
                              ),
                            ),
                          ),
                  ),
                  Gap(getHeight * 0.025),
                  // TODO: If something is not OK with the MenuScreen, there is this:
                  // SingleChildScrollView(
                  //   child: Column(
                  //     children: const [
                  //       ExpandableDrawerTile(
                  //         title: "Kvízek",
                  //         children: [
                  //           DrawerTile(
                  //             title: "ELTE",
                  //             routeName: "/elte_quiz",
                  //           ),
                  //           DrawerTile(
                  //             title: "ELTE SEK",
                  //             routeName: "/elte_sek_quiz",
                  //           ),
                  //         ],
                  //       ),
                  //       ExpandableDrawerTile(
                  //         title: "ELTE",
                  //         children: [
                  //           DrawerTile(
                  //             title: "ELTE",
                  //             routeName: "/elte_history",
                  //           ),
                  //           DrawerTile(
                  //             title: "ELTE SEK",
                  //             routeName: "/elte_sek_history",
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // const DrawerTile(title: "Hírek", routeName: "/news"),
                  // const DrawerTile(title: "Kapcsolat", routeName: "/contact"),
                  SingleChildScrollView(
                    child: Column(
                      children: controller.items.map((item) {
                        if (item.containsKey('children')) {
                          return ExpandableDrawerTile(
                            title: item['title'],
                            children: item['children']
                                .map((child) {
                                  return DrawerTile(
                                    title: child['title'],
                                    routeName: child['routeName'],
                                  );
                                })
                                .toList()
                                .cast<DrawerTile>(),
                          );
                        } else {
                          return DrawerTile(
                            title: item['title'],
                            routeName: item['routeName'],
                          );
                        }
                      }).toList(),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Obx(
                    () => DrawerButton(
                      icon: controller.user.value == null ? Icons.login : Icons.logout,
                      label: controller.user.value == null ? "Bejelentkezés" : "Kijelentkezés",
                      onPressed: controller.user.value == null
                          ? () => Get.toNamed(RouteNames.loginScreenRoute)
                          : () => controller.signOut(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
