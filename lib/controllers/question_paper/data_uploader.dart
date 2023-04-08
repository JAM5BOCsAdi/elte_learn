import 'dart:convert';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../firebase_ref/loading_status.dart';
import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; // value: 0

    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final papersInAssets =
        manifestMap.keys.where((path) => path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    print(papersInAssets);

    List<QuestionPaperModel> questionPapers = [];

    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    final fireStore = FirebaseFirestore.instance;
    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRef.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "image_title": paper.imageTitle,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });

      for (var questions in paper.questions!) {
        final questionPath = questionRef(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier,
            "answer": answer.answer,
          });
        }
      }
    }

    await batch.commit();

    loadingStatus.value = LoadingStatus.completed; // value: 1
  }
}
