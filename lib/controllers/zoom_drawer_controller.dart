import 'dart:math';

import 'package:elte_learn/models/menu_item_model.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/history/elte_sek_history_screen.dart';
import 'package:elte_learn/screens/quizzes/elte_quiz_screen.dart';
import 'package:elte_learn/screens/home/my_zoom_drawer.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../controllers/auth_controller.dart';
import '../routes/route_names.dart';
import '../screens/contact/elte_sek_contact_screen.dart';
import '../screens/history/elte_history_screen.dart';
import '../screens/history/elte_sek_pti_history_screen.dart';
import '../screens/news/elte_sek_facebook_screen.dart';
import '../screens/news/elte_sek_website_screen.dart';
import '../screens/quizzes/elte_sek_pti_quiz_screen.dart';
import '../screens/quizzes/elte_sek_quiz_screen.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  Rxn<User?> user = Rxn();
  RxString currentRoute = "".obs;

  final random = Random();
  // final List<Map<String, dynamic>> items = [
  //   {
  //     'title': 'Kvízek',
  //     'children': [
  //       {
  //         'title': 'ELTE',
  //         'routeName': '/elte_quiz',
  //       },
  //       {
  //         'title': 'ELTE SEK',
  //         'routeName': '/elte_sek_quiz',
  //       },
  //       {
  //         'title': 'ELTE SEK PTI',
  //         'routeName': '/elte_sek_quiz',
  //       },
  //     ],
  //   },
  //   {
  //     'title': 'Történetek',
  //     'children': [
  //       {
  //         'title': 'ELTE',
  //         'routeName': '/elte_history',
  //       },
  //       {
  //         'title': 'ELTE SEK',
  //         'routeName': '/elte_sek_history',
  //       },
  //       {
  //         'title': 'ELTE SEK PTI',
  //         'routeName': '/elte_sek_pti_history',
  //       },
  //     ],
  //   },
  //   {
  //     'title': 'Hírek',
  //     'children': [
  //       {
  //         'title': 'ELTE SEK Facebook',
  //         'routeName': '/elte_sek_facebook',
  //       },
  //       {
  //         'title': 'ELTE SEK Weboldal',
  //         'routeName': '/elte_sek_website',
  //       },
  //     ],
  //   },
  //   {
  //     'title': 'Kapcsolat',
  //     'routeName': '/contact',
  //   },
  // ];

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
        return const ElteSekWebsiteScreen();

      case MenuItems.elteSekFacebook:
        return const ElteSekFacebookScreen();

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
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:zoom_drawer/zoom_drawer.dart';

// class MenuItemModel {
//   final String title;
//   final IconData icon;

//   const MenuItemModel({
//     required this.title,
//     required this.icon,
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ZoomDrawer(
//       angle: 0.0,
//       menuScreen: Builder(builder: (context) {
//         return MenuPage();
//       }),
//       mainScreen: Obx(() => getScreen(Get.find<MenuController>().currentItem.value)),
//     );
//   }

//   Widget getScreen(MenuItemModel item) {
//     switch (item) {
//       case MenuItems.quiz1:
//         return const ElteQuiz();

//       case MenuItems.quiz2:
//         return const ElteSekQuiz();

//       case MenuItems.quiz3:
//         return const ElteSekPtiQuiz();

//       case MenuItems.history1:
//         return const ElteHistory();

//       case MenuItems.history2:
//         return const ElteSekHistory();

//       case MenuItems.history3:
//         return const ElteSekPtiHistory();

//       case MenuItems.facebook:
//         return const ElteSekFacebook();

//       case MenuItems.website:
//         return const ElteSekWebsite();

//       case MenuItems.contact:
//         return const ElteSekContact();
//       default:
//         return const ElteSekQuiz();
//     }
//   }
// }

// class MenuItems {
//   static const quiz1 = MenuItemModel(title: 'ELTE', icon: Icons.payment);
//   static const quiz2 = MenuItemModel(title: 'ELTE SEK', icon: Icons.payment);
//   static const quiz3 = MenuItemModel(title: 'ELTE SEK PTI', icon: Icons.payment);

//   static const history1 = MenuItemModel(title: 'ELTE ', icon: Icons.payment);
//   static const history2 = MenuItemModel(title: 'ELTE SEK ', icon: Icons.payment);
//   static const history3 = MenuItemModel(title: 'ELTE SEK PTI ', icon: Icons.payment);

//   static const website = MenuItemModel(title: 'ELTE SEK Weboldal', icon: Icons.payment);
//   static const facebook = MenuItemModel(title: 'ELTE SEK Facebook', icon: Icons.payment);

//   static const contact = MenuItemModel(title: 'Kapcsolat', icon: Icons.payment);

//   static const all = <MenuItemModel>[
//     quiz1,
//     quiz2,
//     quiz3,
//     history1,
//     history2,
//     history3,
//     website,
//     facebook,
//     contact,
//   ];
// }

// class MenuController extends GetxController {
//   var currentItem = MenuItems.quiz1.obs;

//   void onSelectedItem(MenuItemModel item) {
//     currentItem.value = item;
//     ZoomDrawer.of(Get.context!)!.close();
//   }
// }

// class MenuPage extends StatelessWidget {
//   final menuController = Get.put(MenuController());

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.dark(),
//       child: Scaffold(
//         backgroundColor: Colors.indigo,
//         body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
