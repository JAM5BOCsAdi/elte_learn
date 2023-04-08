import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/consts.dart';
import '../../widgets/button.dart';
import '../../configs/themes/app_colors.dart';

class LoginScreen extends GetView<AuthController> {
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
                  appSplashLogoPng,
                  height: getHeight * 0.25,
                  width: getWidth * 0.5,
                ),
                Gap(getHeight * 0.05),
                Button(
                  onTap: () => controller.signInWithGoogle(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          googleSvg,
                        ),
                      ),
                      Center(
                        child: AutoSizeText(
                          googleSignInTitle,
                          minFontSize: 18,
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
