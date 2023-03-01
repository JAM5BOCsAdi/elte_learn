import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const DrawerButton({Key? key, required this.icon, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: getHeight * 0.035,
            color: kOnSurfaceTextColor,
          ),
          Gap(getWidth * 0.05),
          AutoSizeText(
            label,
            style: const TextStyle(
              color: kOnSurfaceTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
