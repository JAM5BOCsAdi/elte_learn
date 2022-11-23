import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/ui_parameters.dart';

TextStyle detailText = TextStyle(fontSize: getHeight * 0.015);
TextStyle headerText = TextStyle(fontSize: getHeight * 0.025, fontWeight: FontWeight.w700, color: kOnSurfaceTextColor);

TextStyle cardTitles(context) => TextStyle(
      color: UIParameters.isDarkMode() ? Theme.of(context).textTheme.bodyText1!.color : Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: getHeight * 0.02,
    );
