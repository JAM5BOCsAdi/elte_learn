import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/app_dark_theme.dart';
import '../themes/app_light_theme.dart';
import '../themes/ui_parameters.dart';

const Color kOnSurfaceTextColor = Colors.white;
const Color kCustomScaffoldColor1 = Color(0XFF2E3C62);
const Color kCustomScaffoldColor2 = Color.fromARGB(255, 240, 237, 255);

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

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode() ? kCustomScaffoldColor1 : kCustomScaffoldColor2;
