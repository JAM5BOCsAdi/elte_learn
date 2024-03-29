import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/auth_controller.dart';
import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../../routes/route_names.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPapers = <QuestionPaperModel>[].obs;
  final isLoading = true.obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRef.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      // allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.imageTitle);
        paper.imageUrl = imgUrl;

        // Here it updates the database to show "image_url"
        var batch = fireStore.batch();
        batch.update(questionPaperRef.doc(paper.id), {"image_url": imgUrl});
        await batch.commit();
      }
      allPapers.assignAll(paperList);
      isLoading.value = false;
    } catch (e) {
      throw Exception("getAllPapers ERROR: $e");
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();

    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.toNamed(RouteNames.questionsScreenRoute, arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(RouteNames.questionsScreenRoute, arguments: paper);
      }
    } else {
      _authController.showLoginAlertDialogue();
    }
  }
}
