import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../routes/route_names.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../utils/consts.dart';
import '../../widgets/app_circle_button.dart';

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
                    introductionTitle,
                    style: TextStyle(fontSize: 18.0, color: kOnSurfaceTextColor),
                    textAlign: TextAlign.center,
                  ),
                  Gap(getHeight * 0.025),
                  AppCircleButton(
                    onTap: () => Get.offAndToNamed(RouteNames.myZoomDrawerScreenRoute),
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
