import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/contact/elte_sek_contact_screen_map.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/app_light_theme.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../utils/consts.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/contact_row.dart';
import '../../widgets/custom_app_bar.dart';

class ElteSekContactScreen extends GetView<ContactController> {
  const ElteSekContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyZoomDrawerController myZoomDrawerController = Get.find();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Kapcsolat",
        appBarHeight: getHeight * 0.02,
        leading: AppCircleButton(
          // clipBehavior: Clip.none,
          onTap: myZoomDrawerController.toggleDrawer,
          child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(mobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: getHeight * 0.015),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            const AutoSizeText(
                              "ELTE Savaria Egyetemi Központ",
                              style: TextStyle(color: kOnSurfaceTextColor, fontWeight: FontWeight.bold),
                              minFontSize: 20,
                            ),
                            Gap(getWidth * 0.05),
                            Column(
                              children: [
                                ContactRow(
                                  icon: Icons.location_on,
                                  text: "9700 Szombathely,\n Károlyi Gáspár tér 4.",
                                  enabled: true,
                                  onTap: () => controller.map(),
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
                                  onTap: () => controller.email(path: "sekrh@elte.hu"),
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.web,
                                  text: "https://sek.elte.hu/",
                                  enabled: true,
                                  onTap: () =>
                                      controller.website(title: "ELTE SEK Weboldal", url: websiteUrl, color: primaryLightLT),
                                ),
                              ],
                            ),
                            Gap(getWidth * 0.05),
                            Container(
                              width: getWidth * 0.5,
                              height: getHeight * 0.15,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/images/me.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Gap(getWidth * 0.025),
                            const AutoSizeText(
                              "Horváth Ádám - Mobilfejlesztő",
                              style: TextStyle(color: kOnSurfaceTextColor, fontWeight: FontWeight.bold),
                              minFontSize: 20,
                            ),
                            Gap(getWidth * 0.05),
                            Column(
                              children: [
                                Gap(getHeight * 0.015),
                                const ContactRow(
                                  icon: Icons.phone,
                                  text: "06/30 - 134 - 4567",
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.mail,
                                  text: "oradam@elte.hu",
                                  enabled: true,
                                  onTap: () => controller.email(path: "oradam@elte.hu"),
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.web,
                                  text: "https://oradam.web.elte.hu/\nportfolio-website-1/",
                                  enabled: true,
                                  onTap: () =>
                                      controller.website(title: "Portfólió oldal", url: myWebsite, color: myWebsiteBGColor),
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}
