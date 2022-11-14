import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/home/question_card.dart';
import 'package:elte_learn/widgets/app_circle_button.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    // QuestionPaperModel model = Get.find();
    // MyZoomDrawerController _myZoomDrawerController = Get.find<MyZoomDrawerController>();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return ZoomDrawer(
            controller: _.zoomDrawerController,
            borderRadius: 50.0,
            showShadow: true,
            angle: 0.0,
            style: DrawerStyle.defaultStyle,
            menuBackgroundColor: Colors.white.withOpacity(0.5),
            slideWidth: Get.width * 0.6,
            menuScreen: Text("Hi", style: TextStyle(color: Colors.black)),
            mainScreen: Container(
              decoration: BoxDecoration(gradient: mainGradient()),
              child: SafeArea(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(mobileScreenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCircleButton(
                            onTap: controller.toggleDrawer,
                            clipBehavior: Clip.none,
                            // TODO: Drawer Menu Problem to fix
                            child: Icon(AppIcons.menuLeft, size: Get.height * 0.035),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: Get.height * 0.025),
                            child: Row(
                              children: [
                                const Icon(AppIcons.peace),
                                AutoSizeText(
                                  "Hello xy",
                                  style: detailText.copyWith(color: kOnSurfaceTextColor),
                                  minFontSize: 20.0,
                                ),
                              ],
                            ),
                          ),
                          AutoSizeText(
                            "Mit szeretnél ma tanulni?",
                            minFontSize: 16.0,
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
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
