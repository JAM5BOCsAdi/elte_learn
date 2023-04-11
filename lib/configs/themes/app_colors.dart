import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/app_dark_theme.dart';
import '../themes/app_light_theme.dart';
import '../themes/ui_parameters.dart';

const Color kOnSurfaceTextColor = Colors.white;
const Color kCustomScaffoldColor1 = Color.fromARGB(255, 98, 115, 164);
const Color kCustomScaffoldColor2 = Color.fromARGB(255, 240, 237, 255);
const Color correctAnswersColor = Color(0XFF3AC3CB);
const Color wrongAnswersColor = Color(0XFFF85187);
const Color notAnswersColor = Color(0XFF2A3C65);
const Color myWebsiteBGColor = Color(0XFF27AE60);
const Color blueColor = Colors.blue;
Color resetMapColor = Colors.blue.shade400;

const kMainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightLT,
    primaryLT,
  ],
);

const kMainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkDT,
    primaryDT,
  ],
);

LinearGradient mainGradient() => UIParameters.isDarkMode() ? kMainGradientDark : kMainGradientLight;

Color answerSelectedColor() =>
    UIParameters.isDarkMode() ? Theme.of(Get.context!).cardColor.withOpacity(0.5) : Theme.of(Get.context!).primaryColor;

Color answerBorderColor() =>
    UIParameters.isDarkMode() ? const Color.fromARGB(255, 20, 46, 158) : const Color.fromARGB(255, 221, 221, 221);

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode() ? kCustomScaffoldColor1 : kCustomScaffoldColor2;
