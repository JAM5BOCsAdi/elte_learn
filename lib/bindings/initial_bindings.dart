import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/system_chrome/set_system_chrome.dart';
import '../controllers/auth_controller.dart';
import '../controllers/news_controller.dart';
import '../controllers/question_paper/data_uploader.dart';
import '../controllers/theme_controller.dart';
import '../controllers/zoom_drawer_controller.dart';
import '../services/firebase_storage_service.dart';

/// Executed before app boots
class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SetSystemChrome());
    Get.put(DataUploader());
    Get.put(ThemeController()); // Get.put(ThemeController(), tag: "theme");
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true); // Get.put(AuthController(), tag: "auth", permanent: true);
    // Get.put(NotificationService());
    Get.lazyPut(() => FirebaseStorageService());
    // Get.put(NewsController());
    // Get.put(ContactController());
    // Get.put(MyZoomDrawerController());
  }
}
