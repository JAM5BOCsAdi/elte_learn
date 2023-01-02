import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/ui_parameters.dart';

import '../packages_barrel/packages_barrel.dart';

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(vertical: getHeight * 0.025, horizontal: getWidth * 0.025),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: isSelected ? answerSelectedColor() : Theme.of(context).cardColor,
          border: Border.all(color: isSelected ? answerSelectedColor() : answerBorderColor()),
        ),
        child: AutoSizeText(
          answer,
          style: TextStyle(
            color: isSelected ? kOnSurfaceTextColor : null,
          ),
        ),
      ),
    );
  }
}
