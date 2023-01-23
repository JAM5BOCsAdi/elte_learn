import 'package:elte_learn/configs/themes/app_icons.dart';
import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/routes/route_names.dart';
import 'package:elte_learn/widgets/app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.onMenuActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: AutoSizeText(
                        title,
                        style: appBarText,
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
                leading ?? Transform.translate(offset: const Offset(-14, 0), child: const BackButton()),
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
