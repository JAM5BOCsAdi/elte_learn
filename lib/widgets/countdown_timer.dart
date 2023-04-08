import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';

class CountdownTimer extends StatelessWidget {
  final Color? color;
  final String time;

  const CountdownTimer({Key? key, this.color, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        Gap(getWidth * 0.015),
        AutoSizeText(time, style: countDownTimerText().copyWith(color: color)),
      ],
    );
  }
}
