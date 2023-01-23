import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/routes/route_names.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/result_controller_extension.dart';
import '../../widgets/answer_card.dart';
import '../../widgets/quizzes_results_card.dart';
import '../../widgets/background_decoration.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _textColor = Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SizedBox(height: getHeight * 0.05),
        title: controller.correctAnsweredQuestions,
      ),
      body: BackgroundDecoration(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/bulb.svg"),
                      Padding(
                        padding: EdgeInsets.only(top: getHeight * 0.025, bottom: getHeight * 0.025),
                        child: AutoSizeText(
                          "Gratulálunk",
                          style: headerText.copyWith(color: _textColor),
                        ),
                      ),
                      AutoSizeText(
                        "${controller.points} pontot szereztél",
                        style: TextStyle(color: _textColor),
                      ),
                      Gap(getHeight * 0.025),
                      const AutoSizeText(
                        "Valami ",
                        textAlign: TextAlign.center,
                      ), // Tap below question numbers to view correct answers
                      Gap(getHeight * 0.025),
                      Expanded(
                        child: GridView.builder(
                          itemCount: controller.allQuestions.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getWidth ~/ 75,
                            childAspectRatio: 1,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            final _question = controller.allQuestions[index];
                            AnswersStatus _status = AnswersStatus.NOT_ANSWERED;
                            final _selectedAnswer = _question.selectedAnswer;
                            final _correctAnswer = _question.correctAnswer;
                            if (_selectedAnswer == _correctAnswer) {
                              _status = AnswersStatus.CORRECT;
                            } else if (_question.selectedAnswer == null) {
                              _status = AnswersStatus.WRONG;
                            } else {
                              _status = AnswersStatus.WRONG;
                            }
                            return QuizzesResultsCard(
                              index: index + 1,
                              status: _status,
                              onTap: () {
                                controller.jumpToQuestion(index, isGoBack: false);
                                Get.toNamed(RouteNames.answerCheckQuizzesResultScreenRoute);
                              },
                            );
                          },
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
    );
  }
}
