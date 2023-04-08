import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/answer_card.dart';
import '../../widgets/content_area.dart';
import '../../widgets/countdown_timer.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';
import '../../firebase_ref/loading_status.dart';
import '../../routes/route_names.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/button.dart';
import '../../widgets/question_place_holder.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: getHeight * 0.015, vertical: getWidth * 0.015),
          decoration: ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(color: kOnSurfaceTextColor, width: getWidth * 0.005),
            ),
          ),
          child: Obx(() => CountdownTimer(time: controller.time.value, color: kOnSurfaceTextColor)),
        ),
        showActionIcon: true,
        titleWidget: Obx(
          () => AutoSizeText("K ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}", style: appBarText),
        ),
      ),
      body: BackgroundDecoration(
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(child: ContentArea(child: QuestionPlaceHolder())),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ContentArea(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: getHeight * 0.025),
                        child: Column(
                          children: [
                            AutoSizeText(controller.currentQuestion.value!.question, style: questionText),
                            GetBuilder<QuestionsController>(
                              id: "answers_list",
                              builder: (_) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: getHeight * 0.025),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final answer = controller.currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answer: "${answer.identifier}. ${answer.answer}",
                                      onTap: () => controller.selectedAnswer(answer.identifier),
                                      isSelected: answer.identifier == controller.currentQuestion.value!.selectedAnswer,
                                    );
                                  },
                                  separatorBuilder: (_, index) => Gap(getHeight * 0.015),
                                  itemCount: controller.currentQuestion.value!.answers.length,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ColoredBox(
                  color: UIParameters.isDarkMode() ? kCustomScaffoldColor1 : kCustomScaffoldColor2,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: Row(
                      children: [
                        Visibility(
                          visible: controller.isFirstQuestion,
                          child: Padding(
                            padding: EdgeInsets.only(right: getHeight * 0.015),
                            child: SizedBox(
                              height: getHeight * 0.075,
                              width: getWidth * 0.25,
                              child: Button(
                                onTap: () => controller.previousQuestion(),
                                child: Icon(Icons.arrow_back_ios_new,
                                    color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Visibility(
                            visible: controller.loadingStatus.value == LoadingStatus.completed,
                            child: Button(
                              onTap: () {
                                controller.isLastQuestion
                                    ? Get.toNamed(RouteNames.quizzesResultScreenRoute)
                                    : controller.nextQuestion();
                              },
                              title: controller.isLastQuestion ? "Befejez" : "Tovább",
                            ),
                          ),
                        ),
                      ],
                    ),
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
