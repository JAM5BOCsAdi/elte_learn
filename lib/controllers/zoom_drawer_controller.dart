import 'dart:math';

import 'package:elte_learn/models/menu_item_model.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/history/elte_sek_history_screen.dart';
import 'package:elte_learn/screens/quizzes/elte_quiz_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../../controllers/auth_controller.dart';
import '../configs/themes/app_light_theme.dart';
import '../screens/contact/elte_sek_contact_screen.dart';
import '../screens/history/elte_history_screen.dart';
import '../screens/history/elte_sek_pti_history_screen.dart';
import '../screens/news/news_screens.dart';
import '../screens/quizzes/elte_sek_pti_quiz_screen.dart';
import '../screens/quizzes/elte_sek_quiz_screen.dart';
import '../utils/consts.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();
  RxString currentRoute = "".obs;

  final random = Random();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  String? getFirstLetter(User? user) {
    if (user != null) {
      return user.displayName?.substring(0, 1).toUpperCase();
    } else {
      return "";
    }
  }

  Color randomColor() {
    Color randomColor;
    do {
      randomColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    } while (randomColor == Colors.white);
    return randomColor;
  }

  void getCurrentRoute(String currentRouteName) {
    currentRoute.value = currentRouteName;
    print("currentRoute.value: $currentRoute.value");
  }

  Widget getScreen(Rx<MenuItemModel> currentItem) {
    switch (currentItem.value) {
      case MenuItems.elteQuiz:
        return const ElteQuizScreen();

      case MenuItems.elteSekQuiz:
        return const ElteSekQuizScreen();

      case MenuItems.elteSekPtiQuiz:
        return const ElteSekPtiQuizScreen();

      case MenuItems.elteHistory:
        return const ElteHistoryScreen();

      case MenuItems.elteSekHistory:
        return const ElteSekHistoryScreen();

      case MenuItems.elteSekPtiHistory:
        return const ElteSekPtiHistoryScreen();

      case MenuItems.elteSekWebsite:
        return NewsScreens(
          title: "ELTE SEK Weboldal",
          url: websiteUrl,
          backgroundColor: primaryLightLT,
        );

      case MenuItems.elteSekFacebook:
        return NewsScreens(
          title: "ELTE SEK Facebook",
          url: facebookUrl,
          backgroundColor: Colors.blue,
        );

      case MenuItems.elteSekContact:
        return const ElteSekContactScreen();
      default:
        return const ElteSekQuizScreen();
    }
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    print("Toggle Tapped");
    update();
  }

  void closeDrawer() {
    zoomDrawerController.close?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
  }
}
