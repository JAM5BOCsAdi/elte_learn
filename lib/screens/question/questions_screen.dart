import 'dart:ui';

import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/answer_card.dart';
import 'package:elte_learn/widgets/content_area.dart';

import '../../controllers/questions_controller.dart';
import '../../firebase_ref/loading_status.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/button.dart';
import '../../widgets/question_place_holder.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorations(
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
                              builder: (context) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: getHeight * 0.025),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    final answer = controller.currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answer: "${answer.identifier}. ${answer.answer}",
                                      onTap: () => controller.selectedAnswer(answer.identifier),
                                      isSelected: answer.identifier == controller.currentQuestion.value!.selectedAnswer,
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) => Gap(getHeight * 0.015),
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
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                                controller.isLastQuestion ? Container() : controller.nextQuestion();
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
