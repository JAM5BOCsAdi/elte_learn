import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/answer_card.dart';
import 'package:elte_learn/widgets/background_decoration.dart';
import 'package:elte_learn/widgets/content_area.dart';

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

                                  // TODO: Something wrong with the GREEN (correctAnswers) and RED (wrongAnswers) answers
                                  // There are too much good answers (green)
                                  // Video: from 4:58:00 to 5:12:00
                                  if (correctAnswer == selectedAnswer && answer.identifier == selectedAnswer) {
                                    // Correct answer selected
                                    return CorrectAnswer(answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    // Not selected any answer
                                    return NotAnswered(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer && answer.identifier == selectedAnswer) {
                                    // Wrong answer selected
                                    return WrongAnswer(answer: answerText);
                                  } else if (correctAnswer != answer.identifier) {
                                    // Correct answer selected
                                    return CorrectAnswer(answer: answerText);
                                  }
                                  return AnswerCard(
                                    answer: answerText,
                                    isSelected: false,
                                    onTap: () {},
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
