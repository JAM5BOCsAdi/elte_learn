import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';

/// The logo pops up for a few seconds
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient()),
          child: Image.asset(
            "assets/images/app_splash_logo.png",
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
