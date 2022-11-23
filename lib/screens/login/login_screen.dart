import 'package:elte_learn/configs/themes/ui_parameters.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/button.dart';

import '../../configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: getWidth,
        height: getHeight,
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(mobileScreenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/app_splash_logo.png",
                  height: getHeight * 0.25,
                  width: getWidth * 0.5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getHeight * 0.025),
                  child: const AutoSizeText(
                    "Sed tempor nisi in gravida congue. Cras elementum mi sit amet neque blandit faucibus. Donec turpis dui",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kOnSurfaceTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Button(
                  onTap: () {
                    print("Tap");
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          "assets/icons/google.svg",
                        ),
                      ),
                      Center(
                        child: AutoSizeText(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
