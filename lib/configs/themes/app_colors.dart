import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/app_dark_theme.dart';
import '../themes/app_light_theme.dart';
import '../themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightLT,
    primaryLT,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkDT,
    primaryDT,
  ],
);

LinearGradient mainGradient() => UIParameters.isDarkMode() ? mainGradientDark : mainGradientLight;
