import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../configs/themes/ui_parameters.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final Text text;
  const IconText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Gap(getWidth * 0.01),
        text,
      ],
    );
  }
}
