import 'dart:async';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../controllers/auth_controller.dart';
import '../widgets/dialogue.dart';
import '../firebase_ref/loading_status.dart';
import '../firebase_ref/references.dart';
import '../models/question_paper_model.dart';
import '../routes/route_names.dart';

class QuestionsController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  Rxn<Questions> currentQuestion = Rxn<Questions>();

  Timer? _timer;
  int remainedSeconds = 1;
  final time = "00:00".obs;

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    loadData(_questionPaper);
    super.onReady();
  }

  @override
  void onClose() {
    _timer!.cancel();
    super.onClose();
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
      }
    } catch (e) {
      throw Exception("loadData ERROR $e");
    }
    if (questionPaper.questions != null && questionPaper.questions!.isNotEmpty) {
      allQuestions.assignAll(questionPaper.questions!);

      currentQuestion.value = questionPaper.questions![0];

      _startTimer(questionPaper.timeSeconds);

      loadingStatus.value = LoadingStatus.completed;
    } else {
      loadingStatus.value = LoadingStatus.error;
    }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(["answers_list", "answer_check_review_list"]);
  }

  String get completedQuiz {
    final answered = allQuestions.where((element) => element.selectedAnswer != null).toList().length;
    return "$answered / ${allQuestions.length} megválaszolt kérdés";
  }

  void jumpToQuestion(int index, {bool isGoBack = true}) {
    questionIndex.value = index;
    currentQuestion.value = allQuestions[index];
    if (isGoBack) {
      Get.back();
    }
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) {
      return;
    } else {
      questionIndex.value++;
    }
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void previousQuestion() {
    if (questionIndex.value <= 0) {
      return;
    } else {
      questionIndex.value--;
    }
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void complete() {
    _timer!.cancel();
    Get.toNamed(RouteNames.resultScreenRoute, arguments: questionPaperModel);
  }

  void navigateToHome() {
    _timer!.cancel();
    Get.offNamedUntil(RouteNames.myZoomDrawerScreenRoute, (route) => false);
  }

  // void goBack() {
  //   _timer!.cancel();
  //   final previousRoute = Get.previousRoute;
  //   print("Prev. Screen: $previousRoute");
  // }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainedSeconds = seconds;
    AuthController _auth = Get.find<AuthController>();

    _timer = Timer.periodic(
      duration,
      (Timer timer) {
        if (remainedSeconds <= 0) {
          Get.dialog(Dialogs.showTimeUpDialogue(onTapOK: () => navigateToHome()));

          timer.cancel();
        } else {
          int minutes = remainedSeconds ~/ 60;
          int seconds = remainedSeconds % 60;

          time.value = "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";

          remainedSeconds--;
        }
      },
    );
  }
}
