import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/app_icons.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/content_area.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../home/question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body: Container(
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
                    const Icon(
                      AppIcons.menuLeft,
                    ),
                    Gap(Get.height * 0.025),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
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
  }
}
