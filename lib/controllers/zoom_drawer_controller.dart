import 'dart:math';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../models/menu_item_model.dart';
import '../../controllers/auth_controller.dart';
import '../configs/themes/app_colors.dart';
import '../configs/themes/app_light_theme.dart';
import '../screens/contact/elte_sek_contact_screen.dart';
import '../screens/history/histories_screen.dart';
import '../screens/news/news_screens.dart';
import '../screens/quizzes/quizzes_screen.dart';
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
  }

  Widget getScreen(Rx<MenuItemModel> currentItem) {
    switch (currentItem.value) {
      case MenuItems.elteQuiz:
        return QuizzesScreen(paperIds: eltePaperIds);

      case MenuItems.elteSekQuiz:
        return QuizzesScreen(paperIds: elteSekPaperIds);

      case MenuItems.elteSekPtiQuiz:
        return QuizzesScreen(paperIds: elteSekPtiPaperIds);

      case MenuItems.elteHistory:
        return const HistoriesScreen(title: elteHistoryTitle, source: elteHistoryTxt);

      case MenuItems.elteSekHistory:
        return const HistoriesScreen(title: elteSekHistoryTitle, source: elteSekHistoryTxt);

      case MenuItems.elteSekPtiHistory:
        return const HistoriesScreen(title: elteSekPtiHistoryTitle, source: elteSekPtiHistoryTxt, leftPadding: true);

      case MenuItems.elteSekWebsite:
        return const NewsScreens(
          title: elteSekWebsiteTitle,
          url: websiteUrl,
          backgroundColor: primaryLightLT,
        );

      case MenuItems.elteSekFacebook:
        return const NewsScreens(
          title: elteSekFacebookTitle,
          url: facebookUrl,
          backgroundColor: blueColor,
        );

      case MenuItems.elteSekContact:
        return const ElteSekContactScreen();
      default:
        return QuizzesScreen(paperIds: elteSekPtiPaperIds);
    }
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
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
