import 'package:elte_learn/controllers/zoom_drawer_controller.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String routeName;
  const DrawerTile({Key? key, required this.title, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isActive = Get.currentRoute == routeName;

    return ListTile(
      title: AutoSizeText(
        title,
        style: const TextStyle(color: kOnSurfaceTextColor),
      ),
      onTap: () {
        Get.toNamed(routeName);
        print("DrawerTile => Current_RouteName: $routeName");
        // print("RouteName:$isActive");
        Get.find<MyZoomDrawerController>().currentRoute(routeName);
      },
    );
  }
}
