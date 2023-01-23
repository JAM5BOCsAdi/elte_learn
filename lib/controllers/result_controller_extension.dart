import '../../controllers/questions_controller.dart';

extension ResultControllerExtension on QuestionsController {
  int get correctQuestionCount =>
      allQuestions.where((element) => element.selectedAnswer == element.correctAnswer).toList().length;

  String get correctAnsweredQuestions => "$correctQuestionCount / ${allQuestions.length} helyes válasz";

  String get points {
    double points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainedSeconds) /
        questionPaperModel.timeSeconds *
        100;

    return points.toStringAsFixed(2);
  }
}
