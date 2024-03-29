import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../themes/ui_parameters.dart';

TextStyle detailText = TextStyle(fontSize: getHeight * 0.015);
TextStyle appBarText = TextStyle(fontSize: getHeight * 0.025, fontWeight: FontWeight.bold, color: kOnSurfaceTextColor);
TextStyle headerText = TextStyle(fontSize: getHeight * 0.030, fontWeight: FontWeight.w700, color: kOnSurfaceTextColor);

TextStyle questionText = TextStyle(fontSize: getHeight * 0.025, fontWeight: FontWeight.w800);

TextStyle cardTitles(context) => TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: getHeight * 0.02,
    );

TextStyle countDownTimerText() => TextStyle(
      letterSpacing: 2,
      color: UIParameters.isDarkMode() ? kOnSurfaceTextColor : Theme.of(Get.context!).primaryColor,
    );
