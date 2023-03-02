import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../routes/route_names.dart';
import '../../widgets/drawer_tile.dart';
import '../../widgets/expandable_drawer_tile.dart';
import '../../widgets/drawer_button.dart';
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
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: getHeight * 0.015),
                                child: Container(
                                  // height: getHeight * 0.25,
                                  width: getWidth * 0.5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.randomColor(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: AutoSizeText(
                                      "${controller.getFirstLetter(controller.user.value)}",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.w900,
                                        fontSize: getHeight * 0.1,
                                        color: kOnSurfaceTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: AutoSizeText(
                                  controller.user.value!.displayName ?? "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: getHeight * 0.025,
                                    color: kOnSurfaceTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  Gap(getHeight * 0.015),
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
