import 'package:elte_learn/packages_barrel/packages_barrel.dart';

double _getHeight = Get.height;
double _getWidth = Get.width;
double _mobileScreenPadding = _getHeight * 0.035;
double _cardBorderRadius = _getWidth * 0.035;

double get getHeight => _getHeight;
double get getWidth => _getWidth;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode() => Get.isDarkMode ? true : false;
}
