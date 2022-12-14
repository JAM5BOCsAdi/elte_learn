import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter/foundation.dart';

import '../firebase_ref/loading_status.dart';
import '../firebase_ref/references.dart';
import '../models/question_paper_model.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print(_questionPaper.id);
    loadData(_questionPaper);
    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRef.doc(questionPaper.id).collection("questions").get();

      final questions = questionQuery.docs.map((snapshot) => Questions.fromSnapshot(snapshot)).toList();

      questionPaper.questions = questions;

      for (Questions _question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery = await questionPaperRef
            .doc(questionPaper.id)
            .collection("questions")
            .doc(_question.id)
            .collection("answers")
            .get();

        final answers = answersQuery.docs.map((answer) => Answers.fromSnapshot(answer)).toList();
        _question.answers = answers;

        if (questionPaper.questions != null && questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);

          currentQuestion.value = questionPaper.questions![0];

          if (kDebugMode) {
            print(questionPaper.questions![0].question);
          }
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
