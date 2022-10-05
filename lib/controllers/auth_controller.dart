import 'package:get/get.dart';

/// Class that navigates to the "/introduction" page, delayed by 2 sec.
class AuthController extends GetxController {
  // static AuthController get to => Get.find<AuthController>(tag: "auth");

  /// [onReady()] Called 1 frame after onInit().
  /// It is the perfect place to enter navigation events, like snack bar, dialogs, or a new route, or async request.
  /// This means: If you want to go to a new page [or others above] right after the app boots up, this could be a good place to do that.
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  Future<void> initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
