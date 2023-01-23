import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/answer_card.dart';
import 'package:elte_learn/widgets/button.dart';
import 'package:elte_learn/widgets/content_area.dart';
import 'package:elte_learn/widgets/countdown_timer.dart';
import 'package:elte_learn/widgets/quizzes_results_card.dart';

import '../../configs/themes/app_colors.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';

class QuizzesResultScreen extends GetView<QuestionsController> {
  const QuizzesResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.completedQuiz,
      ),
      extendBodyBehindAppBar: true,
      body: BackgroundDecoration(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CountdownTimer(
                            time: "",
                            color: UIParameters.isDarkMode()
                                ? Theme.of(context).textTheme.bodyText1!.color
                                : Theme.of(context).primaryColor,
                          ),
                          Obx(
                            () => AutoSizeText(
                              "${controller.time} maradt",
                              style: countDownTimerText(),
                            ),
                          ),
                        ],
                      ),
                      Gap(getHeight * 0.025),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.allQuestions.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getWidth ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: getWidth * 0.025,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            AnswersStatus? _answersStatus;
                            if (controller.allQuestions[index].selectedAnswer != null) {
                              _answersStatus = AnswersStatus.ANSWERED;
                            }
                            return QuizzesResultsCard(
                              index: index + 1,
                              status: _answersStatus,
                              onTap: () => controller.jumpToQuestion(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ColoredBox(
                color: UIParameters.isDarkMode() ? kCustomScaffoldColor1 : kCustomScaffoldColor2,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Button(
                    onTap: () => controller.complete(),
                    title: "Befejez",
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
