import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../widgets/app_circle_button.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../routes/route_names.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  final double? appBarHeight;
  final double? leftPadding;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.onMenuActionTap,
    this.appBarHeight,
    this.leftPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mobileScreenPadding, vertical: appBarHeight ?? mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Padding(
                      padding: EdgeInsets.only(left: leftPadding!.toDouble()),
                      child: Center(
                        child: AutoSizeText(
                          title,
                          style: appBarText,
                        ),
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, size: getHeight * 0.035),
                        onPressed: () => Get.back(),
                      ),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: AppCircleButton(
                      onTap: onMenuActionTap ?? () => Get.toNamed(RouteNames.quizzesResultScreenRoute),
                      child: Icon(AppIcons.menu, size: getHeight * 0.035),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // implement preferredSize
  Size get preferredSize => Size(double.maxFinite, getHeight);
}
