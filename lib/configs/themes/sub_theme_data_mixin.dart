import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/app_colors.dart';

/// Mixin: In DART a class can inherit only 1 class, NOT multiple
mixin SubThemeData {
  TextTheme getTextTheme() {
    return GoogleFonts.quicksandTextTheme(
      const TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: kOnSurfaceTextColor, size: 16.0);
  }
}
