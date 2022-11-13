import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../themes/ui_parameters.dart';

TextStyle detailText = TextStyle(fontSize: Get.height * 0.015);

TextStyle cardTitles(context) => TextStyle(
      color: UIParameters.isDarkMode() ? Theme.of(context).textTheme.bodyText1!.color : Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: Get.height * 0.02,
    );
