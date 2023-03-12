import 'dart:math';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/history/elte_sek_history_screen.dart';
import 'package:elte_learn/screens/home/main_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../controllers/auth_controller.dart';
import '../routes/route_names.dart';
import '../screens/history/elte_history_screen.dart';
import '../screens/history/elte_sek_pti_history_screen.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();
  RxString currentRoute = "".obs;

  final random = Random();
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
      'title': 'Történetek',
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
      'children': [
        {
          'title': 'ELTE SEK Facebook',
          'routeName': '/elte_sek_facebook',
        },
        {
          'title': 'ELTE SEK Weboldal',
          'routeName': '/elte_sek_website',
        },
      ],
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

  Widget getScreen() {
    final getScreenCurrentRoute = currentRoute.toString();
    print("getScreenCurrentRoute: $getScreenCurrentRoute");
    switch (getScreenCurrentRoute) {
      case RouteNames.elteHistoryScreenRoute:
        return const ElteHistoryScreen();
      case RouteNames.elteSekHistoryScreenRoute:
        return const ElteSekHistoryScreen();
      case RouteNames.elteSekPtiHistoryScreenRoute:
        return const ElteSekPtiHistoryScreen();

      default:
        return const MainScreen();
    }
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    print("Toggle Tapped");
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {
    Get.find<AuthController>().signInWithGoogle();
  }
}
