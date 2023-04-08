import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../screens/quizzes/question_card.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../utils/consts.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';

class QuizzesScreen extends GetView<MyZoomDrawerController> {
  final String title;
  final List<String> paperIds;
  const QuizzesScreen({Key? key, required this.title, required this.paperIds}) : super(key: key);

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
                    onTap: controller.toggleDrawer,
                    child: Icon(AppIcons.menuLeft, size: getHeight * 0.035),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: getHeight * 0.02),
                    child: Row(
                      children: [
                        Icon(AppIcons.peace, size: getWidth * 0.075),
                        Gap(getWidth * 0.025),
                        Obx(
                          () => controller.user.value == null
                              ? SizedBox(
                                  child: Text(
                                    newbieTitle,
                                    style: detailText.copyWith(color: kOnSurfaceTextColor, fontSize: getWidth * 0.05),
                                    maxLines: 1,
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Hello ${controller.user.value!.displayName ?? ""} ",
                                    style: appBarText.copyWith(color: kOnSurfaceTextColor, fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    title,
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
                      final paper = _questionPaperController.allPapers[index];
                      if (paperIds.contains(paper.id)) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: getHeight * 0.025),
                          child: QuestionCard(model: paper),
                        );
                      } else {
                        return const SizedBox(height: 0, width: 0);
                      }
                    },
                    separatorBuilder: (_, int index) {
                      return const SizedBox(height: 0, width: 0);
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
