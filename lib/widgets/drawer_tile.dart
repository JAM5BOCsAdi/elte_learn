import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final String routeName;
  const DrawerTile({Key? key, required this.title, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(
        title,
        style: const TextStyle(color: kOnSurfaceTextColor),
      ),
      onTap: () => Get.toNamed(routeName),
    );
  }
}
