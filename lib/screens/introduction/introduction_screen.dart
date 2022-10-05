import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../widgets/app_circle_button.dart';

/// Introduction in a few sentences
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(gradient: mainGradient(context)),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 65.0),
                const Gap(40.0),
                const AutoSizeText(
                  "This is a study app. You can use it as you want. If you understand how tis works, you would be able to scale it. With this you will master firebase backend and flutter frontend.",
                  style: TextStyle(fontSize: 18.0, color: onSurfaceTextColor),
                  textAlign: TextAlign.center,
                ),
                const Gap(40.0),
                AppCircleButton(
                  onTap: () => Get.offAndToNamed("/home"),
                  child: const Icon(Icons.arrow_forward, size: 35.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
