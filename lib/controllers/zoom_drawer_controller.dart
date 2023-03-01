import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../controllers/auth_controller.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Kvízek',
      'children': [
        {
          'title': 'ELTE',
          'routeName': '/elte_quiz',
        },
        {
          'title': 'ELTE SEK',
          'routeName': '/elte_sek_quiz',
        },
        {
          'title': 'ELTE SEK PTI',
          'routeName': '/elte_sek_quiz',
        },
      ],
    },
    {
      'title': 'Információk',
      'children': [
        {
          'title': 'ELTE',
          'routeName': '/elte_history',
        },
        {
          'title': 'ELTE SEK',
          'routeName': '/elte_sek_history',
        },
        {
          'title': 'ELTE SEK PTI',
          'routeName': '/elte_sek_pti_history',
        },
      ],
    },
    {
      'title': 'Hírek',
      'routeName': '/news',
    },
    {
      'title': 'Kapcsolat',
      'routeName': '/contact',
    },
  ];

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
  }

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
