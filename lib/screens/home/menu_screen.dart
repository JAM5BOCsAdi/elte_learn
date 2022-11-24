import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/drawer_button.dart';

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
                  DrawerButton(
                    icon: Icons.contact_support_outlined,
                    label: "Contact Us",
                    onPressed: () => controller.contactUs(),
                  ),
                  const Spacer(flex: 1),
                  DrawerButton(
                    icon: Icons.logout,
                    label: "Kijelentkezés",
                    onPressed: () => controller.signOut(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
