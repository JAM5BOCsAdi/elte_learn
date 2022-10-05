import 'package:get/get.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import '../screens/splash/splash_screen.dart';

/// Different routes for the app screens
class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()), // "/" is the first page where Dart automatically navigates to.
        GetPage(name: "/introduction", page: () => const IntroductionScreen()),
        GetPage(
          name: "/home",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
          }),
        ),
      ];
}
