import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;

  const Button({
    Key? key,
    this.title = '',
    required this.onTap,
    this.enabled = true,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled == false ? null : onTap,
      child: Container(
        width: getWidth,
        height: getHeight * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getHeight * 0.025),
          color: color ?? Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(getWidth * 0.03),
          child: child ??
              Center(
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
