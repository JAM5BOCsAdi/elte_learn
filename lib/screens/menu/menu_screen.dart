import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../models/menu_item_model.dart';
import '../../routes/route_names.dart';
import '../../widgets/drawer_button.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;
  const MenuScreen({Key? key, required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.infinity,
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: kOnSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Column(
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
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExpansionTile(
                        textColor: kOnSurfaceTextColor,
                        collapsedTextColor: kOnSurfaceTextColor,
                        collapsedIconColor: kOnSurfaceTextColor,
                        iconColor: kOnSurfaceTextColor,
                        title: const AutoSizeText("Kvízek"),
                        children: [
                          buildMenuItem(MenuItems.elteQuiz),
                          buildMenuItem(MenuItems.elteSekQuiz),
                          buildMenuItem(MenuItems.elteSekPtiQuiz),
                        ],
                      ),
                      ExpansionTile(
                        textColor: kOnSurfaceTextColor,
                        collapsedTextColor: kOnSurfaceTextColor,
                        collapsedIconColor: kOnSurfaceTextColor,
                        iconColor: kOnSurfaceTextColor,
                        title: const AutoSizeText("Történetek"),
                        children: [
                          buildMenuItem(MenuItems.elteHistory),
                          buildMenuItem(MenuItems.elteSekHistory),
                          buildMenuItem(MenuItems.elteSekPtiHistory),
                        ],
                      ),
                      ExpansionTile(
                        textColor: kOnSurfaceTextColor,
                        collapsedTextColor: kOnSurfaceTextColor,
                        collapsedIconColor: kOnSurfaceTextColor,
                        iconColor: kOnSurfaceTextColor,
                        title: const AutoSizeText("Hírek"),
                        children: [
                          buildMenuItem(MenuItems.elteSekWebsite),
                          buildMenuItem(MenuItems.elteSekFacebook),
                        ],
                      ),
                      buildMenuItem(MenuItems.elteSekContact),
                    ],
                  ),
                ),
              ),
              Gap(getHeight * 0.025),
              Expanded(
                flex: 0,
                child: Obx(
                  () => DrawerButton(
                    icon: controller.user.value == null ? Icons.login : Icons.logout,
                    label: controller.user.value == null ? "Bejelentkezés" : "Kijelentkezés",
                    onPressed: controller.user.value == null
                        ? () => Get.toNamed(RouteNames.loginScreenRoute)
                        : () => controller.signOut(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) {
    return ListTileTheme(
      selectedColor: kOnSurfaceTextColor,
      textColor: kOnSurfaceTextColor,
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 20,
        title: Text(item.title),
        onTap: () => onSelectedItem(item),
      ),
    );
  }
}
