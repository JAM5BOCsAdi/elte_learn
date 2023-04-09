import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../controllers/auth_controller.dart';
import '../../controllers/questions_controller.dart';
import '../firebase_ref/references.dart';

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

  Future<void> saveTestResults() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();

    if (_user == null) {
      return;
    } else {
      batch.set(
        userRef.doc(_user.email).collection("my_recent_tests").doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": "$correctQuestionCount / ${allQuestions.length}",
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainedSeconds,
        },
      );
      batch.commit();
      goBack();
      navigateToHome();
    }
  }
}
