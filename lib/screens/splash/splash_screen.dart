import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../configs/themes/app_colors.dart';
import '../../utils/consts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(gradient: mainGradient()),
            child: Image.asset(
              appSplashLogoPng,
              width: getWidth * 0.5,
              height: getHeight * 0.25,
            ),
          ),
        ),
      ),
    );
  }
}
