import 'package:elte_learn/packages_barrel/packages_barrel.dart';

double _mobileScreenPadding = Get.width * 0.1;
double _cardBorderRadius = Get.width * 0.01;

// double get mobileScreenPadding => _mobileScreenPadding;
// double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius => BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding => EdgeInsets.all(_mobileScreenPadding);

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
