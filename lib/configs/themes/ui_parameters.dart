import 'package:elte_learn/packages_barrel/packages_barrel.dart';

double _mobileScreenPadding = Get.width * 0.075;
double _cardBorderRadius = Get.width * 0.03;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius => BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding => EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() => Get.isDarkMode ? true : false;
}
