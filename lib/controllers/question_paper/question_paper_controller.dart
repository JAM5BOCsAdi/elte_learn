// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/app_logger.dart';
import '../../firebase_ref/references.dart';
import '../../models/question_paper_model.dart';
import '../../routes/route_names.dart';
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
    // List<String> imgName = [
    //   "biology",
    //   "chemistry",
    //   "maths",
    //   "physics",
    // ];

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
        // Get.back();
        Get.toNamed(RouteNames.questionsScreenRoute, arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(RouteNames.questionsScreenRoute, arguments: paper);
        print("Logged in");
      }
    } else {
      print("Cim: ${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }
}
