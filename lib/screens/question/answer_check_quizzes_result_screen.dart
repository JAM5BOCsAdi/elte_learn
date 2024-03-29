import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/answer_card.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/content_area.dart';
import '../../controllers/questions_controller.dart';
import '../../routes/route_names.dart';
import '../../widgets/custom_app_bar.dart';

class AnswerCheckQuizzesResultScreen extends GetView<QuestionsController> {
  const AnswerCheckQuizzesResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(
          () => AutoSizeText(
            "K${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}",
            style: appBarText,
          ),
        ),
        showActionIcon: true,
        onMenuActionTap: () => Get.toNamed(RouteNames.resultScreenRoute),
      ),
      body: BackgroundDecoration(
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: getHeight * 0.025),
                      child: Column(
                        children: [
                          AutoSizeText(controller.currentQuestion.value!.question, style: questionText),
                          Gap(getHeight * 0.025),
                          GetBuilder<QuestionsController>(
                            id: "answer_check_review_list",
                            builder: (_) {
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, index) {
                                  final answer = controller.currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller.currentQuestion.value!.correctAnswer;
                                  final String answerText = "${answer.identifier}. ${answer.answer}";

                                  if (correctAnswer == selectedAnswer && answer.identifier == selectedAnswer) {
                                    // Correct answer selected
                                    return CorrectAnswer(answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    // Not selected any answer
                                    return NotAnswered(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer && answer.identifier == selectedAnswer) {
                                    // Wrong answer selected
                                    return WrongAnswer(answer: answerText);
                                  } else if (correctAnswer == answer.identifier) {
                                    // Correct answer selected
                                    return CorrectAnswer(answer: answerText);
                                  }
                                  return AnswerCard(
                                    answer: answerText,
                                    isSelected: false,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
