import 'package:elte_learn/firebase_ref/references.dart';
import 'package:get/get.dart';

/// Load images from Firebase Storage
class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage.child("question_paper_images").child("${imgName.toLowerCase()}.png");
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      print("FirebaseStorageService: $e");
      return null;
    }
  }
}
