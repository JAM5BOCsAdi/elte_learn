import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getWidth,
        height: getHeight,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                "assets/images/app_splash_logo.png",
                height: getHeight * 0.5,
                width: getWidth * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
