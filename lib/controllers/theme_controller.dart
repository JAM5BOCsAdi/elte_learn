import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/app_dark_theme.dart';
import '../configs/themes/app_light_theme.dart';

class ThemeController extends GetxController with WidgetsBindingObserver {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    updateThemeMode();
  }

  void initializeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;

  void updateThemeMode() {
    final brightness = MediaQuery.of(Get.context!).platformBrightness;
    if (brightness == Brightness.dark) {
      Get.changeThemeMode(ThemeMode.dark);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        // systemNavigationBarDividerColor: Colors.white,
      ));
      // update();
    } else {
      Get.changeThemeMode(ThemeMode.light);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        // systemNavigationBarDividerColor: Colors.white,
      ));
      // update();
    }
  }
}
