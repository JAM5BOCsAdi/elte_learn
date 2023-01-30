import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/routes/route_names.dart';
import 'package:elte_learn/widgets/drawer_button.dart';
import 'package:elte_learn/widgets/drawer_tile.dart';
import 'package:elte_learn/widgets/expandable_drawer_tile.dart';

import '../../configs/themes/app_colors.dart';
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
                        ? const SizedBox()
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
                  SingleChildScrollView(
                    child: Column(
                      children: const [
                        ExpandableDrawerTile(
                          title: "Kvízek",
                          children: [
                            DrawerTile(
                              title: "ELTE",
                              routeName: "/elte_quiz", // TODO: DO the Navigations
                            ),
                            DrawerTile(
                              title: "ELTE SEK",
                              routeName: "/elte_sek_quiz", // TODO: DO the Navigations
                            ),
                          ],
                        ),
                        ExpandableDrawerTile(
                          title: "ELTE",
                          children: [
                            DrawerTile(
                              title: "ELTE",
                              routeName: "/elte_history", // TODO: DO the Navigations
                            ),
                            DrawerTile(
                              title: "ELTE SEK",
                              routeName: "/elte_sek_history", // TODO: DO the Navigations
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const DrawerTile(title: "Hírek", routeName: "/news"), // TODO: DO the Navigations
                  const DrawerTile(title: "Kapcsolat", routeName: "/contact"), // TODO: DO the Navigations
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
