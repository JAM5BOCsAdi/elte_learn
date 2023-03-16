import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/home/question_card.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';

class ElteSekPtiQuizScreen extends GetView<MyZoomDrawerController> {
  const ElteSekPtiQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      child: SafeArea(
        bottom: false,
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
                    child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight * 0.015),
                    child: Row(
                      children: [
                        const Icon(AppIcons.peace),
                        Gap(getWidth * 0.025),
                        Obx(
                          () => controller.user.value == null
                              ? SizedBox(
                                  child: AutoSizeText(
                                    "Hello újonc kérlek lépj be",
                                    style: detailText.copyWith(color: kOnSurfaceTextColor),
                                    minFontSize: 20.0,
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    "Hello ${controller.user.value!.displayName ?? ""} ",
                                    style: detailText.copyWith(color: kOnSurfaceTextColor),
                                    minFontSize: 20.0,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    "Mit szeretnél tanulni ma?",
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
                      return Gap(getWidth * 0.05);
                    },
                    itemCount: _questionPaperController.allPapers.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
