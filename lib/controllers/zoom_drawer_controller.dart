import 'package:elte_learn/controllers/auth_controller.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter_zoom_drawer/config.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}
  void signIn() {}
  void contactUs() {}
  void email() {
    final emailLaunchUri = Uri(
      scheme: "mailto",
      path: "oradam200@gmail.com",
    );
    _launch(emailLaunchUri);
  }

  Future<void> _launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw "Sikertelen $url";
    }
  }
}
