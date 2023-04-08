import 'package:elte_learn/packages_barrel/packages_barrel.dart';

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
        title: contactsTitle,
        appBarHeight: getHeight * 0.02,
        leading: AppCircleButton(
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
                                  image: AssetImage(contactsScreenPng),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Gap(getWidth * 0.025),
                            const AutoSizeText(
                              elteSekTitle,
                              style: TextStyle(color: kOnSurfaceTextColor, fontWeight: FontWeight.bold),
                              minFontSize: 20,
                            ),
                            Gap(getWidth * 0.05),
                            Column(
                              children: [
                                ContactRow(
                                  icon: Icons.location_on,
                                  text: elteSekLocationTitle,
                                  enabled: true,
                                  onTap: () => controller.map(),
                                ),
                                Gap(getHeight * 0.015),
                                const ContactRow(
                                  icon: Icons.phone,
                                  text: elteSekPhoneTitle,
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.mail,
                                  text: elteSekMailTitle,
                                  enabled: true,
                                  onTap: () => controller.email(path: elteSekMailTitle),
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.web,
                                  text: websiteUrl,
                                  enabled: true,
                                  onTap: () =>
                                      controller.website(title: elteSekWebsiteTitle, url: websiteUrl, color: primaryLightLT),
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
                                  image: AssetImage(contactsScreenMePng),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Gap(getWidth * 0.025),
                            const AutoSizeText(
                              meTitle,
                              style: TextStyle(color: kOnSurfaceTextColor, fontWeight: FontWeight.bold),
                              minFontSize: 20,
                            ),
                            Gap(getWidth * 0.05),
                            Column(
                              children: [
                                Gap(getHeight * 0.015),
                                const ContactRow(
                                  icon: Icons.phone,
                                  text: mePhoneTitle,
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.mail,
                                  text: meMailTitle,
                                  enabled: true,
                                  onTap: () => controller.email(path: meMailTitle),
                                ),
                                Gap(getHeight * 0.015),
                                ContactRow(
                                  icon: Icons.web,
                                  text: portfolioWebsite,
                                  enabled: true,
                                  onTap: () =>
                                      controller.website(title: portfolioTitle, url: myWebsite, color: myWebsiteBGColor),
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
