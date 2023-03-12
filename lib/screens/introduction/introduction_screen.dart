import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../routes/route_names.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/app_circle_button.dart';

/// Introduction in a few sentences
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: getHeight * 0.1),
                  Gap(getHeight * 0.025),
                  const AutoSizeText(
                    "auctor ligula, tempor mollis tellus purus sed sem. Donec at orci ut risus tincidunt sollicitudin ac et nibh. Vivamus aliquam augue non enim posuere, nec molestie magna rhoncus. Sed dolor sapien, tristique in tortor at, rhoncus dignissim ante. Praesent blandit facilisis urna",
                    style: TextStyle(fontSize: 18.0, color: kOnSurfaceTextColor),
                    textAlign: TextAlign.center,
                  ),
                  Gap(getHeight * 0.025),
                  AppCircleButton(
                    onTap: () => Get.offAndToNamed(RouteNames.myZoomDrawerScreenRoute),
                    // clipBehavior: Clip.hardEdge,
                    child: Icon(Icons.arrow_forward, size: getHeight * 0.05),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
