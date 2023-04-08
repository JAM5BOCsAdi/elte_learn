import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/sub_theme_data_mixin.dart';

const Color primaryLightLT = Color(0xFF3AC3CB);
const Color primaryLT = Color(0xFFF85187);
const Color mainTextColorLT = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryLT,
      cardColor: cardColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorLT,
        displayColor: mainTextColorLT,
      ),
    );
  }
}
