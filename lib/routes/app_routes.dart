import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/question/quizzes_results_screen.dart';

import '../../controllers/zoom_drawer_controller.dart';
import '../../routes/route_names.dart';
import '../../screens/login/login_screen.dart';
import '../controllers/question_paper/question_paper_controller.dart';
import '../controllers/questions_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/introduction/introduction_screen.dart';
import '../screens/question/questions_screen.dart';
import '../screens/splash/splash_screen.dart';

/// Different routes for the app screens
class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: RouteNames.splashScreenRoute, page: () => const SplashScreen()),
        GetPage(name: RouteNames.introductionScreenRoute, page: () => const IntroductionScreen()),
        GetPage(
          name: RouteNames.homeScreenRoute,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(
          name: RouteNames.loginScreenRoute,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: RouteNames.questionsScreenRoute,
          page: () => const QuestionsScreen(),
          binding: BindingsBuilder(() => Get.put<QuestionsController>(QuestionsController())),
        ),
        GetPage(
          name: RouteNames.quizzesResultScreenRoute,
          page: () => const QuizzesResultScreen(),
          // binding: BindingsBuilder.put(() => QuestionsController()),
        ),
      ];
}
