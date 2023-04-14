import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/sub_theme_data_mixin.dart';

const Color primaryDarkDT = Color(0xFF2E3C62);
const Color primaryDT = Color(0xFF8AA7FF);
const Color mainTextColorLT = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryDT,
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
