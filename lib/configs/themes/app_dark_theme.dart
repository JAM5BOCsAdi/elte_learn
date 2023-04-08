import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/app_light_theme.dart';
import '../themes/sub_theme_data_mixin.dart';

const Color primaryDarkDT = Color(0xFF2E3C62);
const Color primaryDT = Color(0xFF99ACE1);

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorLT,
        displayColor: mainTextColorLT,
      ),
    );
  }
}
