import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/app_splash_logo.png"),
            ],
          ),
        ),
      ),
    );
  }
}
