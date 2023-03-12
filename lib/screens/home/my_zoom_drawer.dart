import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/screens/home/main_screen.dart';
import 'package:flutter_zoom_drawer/config.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../screens/home/menu_screen.dart';

class MyZoomDrawer extends GetView<MyZoomDrawerController> {
  const MyZoomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: ZoomDrawer(
              borderRadius: getHeight * 0.05,
              showShadow: false,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              slideWidth: getWidth * 0.7,
              androidCloseOnBackTap: true,
              controller: _.zoomDrawerController,
              mainScreenTapClose: true,
              // menuScreenWidth: Get.width,
              menuScreen: const MenuScreen(),
              mainScreen: controller.getScreen(), //const MainScreen()
            ),
          );
        },
      ),
    );
  }
}
