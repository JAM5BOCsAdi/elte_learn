import 'package:elte_learn/controllers/auth_controller.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/utils/app_logger.dart';

import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../../services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRef.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();

    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed();
      } else {
        // Get.toNamed();
      }
    } else {
      print("The title is ${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }
}
