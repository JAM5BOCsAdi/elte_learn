import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/app_dark_theme.dart';
import '../configs/themes/app_light_theme.dart';

/// Switches between Light and Dark theme
class ThemeController extends GetxController {
  // static ThemeController get to => Get.find<ThemeController>(tag: "theme");

  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  /// [onInit()] Called immediately after the widget is allocated in memory.
  /// You might use this to initialize something for the controller.
  /// This method gets called before everything (F.E.: Get data from server).
  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
