import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/home/menu_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../screens/home/question_card.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: ZoomDrawer(
            borderRadius: Get.height * 0.05,
            showShadow: false,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            slideWidth: Get.width * 0.65,
            androidCloseOnBackTap: true,
            controller: _.zoomDrawerController,
            menuScreen: const MenuScreen(),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            // clipBehavior: Clip.none,
                            onTap: controller.toggleDrawer,
                            child: Icon(AppIcons.menuLeft, size: Get.height * 0.035),
                          ),

                          // Gap(Get.height * 0.025),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace),
                                Gap(Get.width * 0.025),
                                AutoSizeText(
                                  "Hello xy",
                                  style: detailText.copyWith(color: kOnSurfaceTextColor),
                                  minFontSize: 20.0,
                                ),
                              ],
                            ),
                          ),
                          AutoSizeText(
                            "Mit szerenél tanulni ma?",
                            style: headerText,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(model: _questionPaperController.allPapers[index]);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Gap(Get.width * 0.05);
                            },
                            itemCount: _questionPaperController.allPapers.length,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
