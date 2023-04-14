import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../widgets/answer_card.dart';

class QuizzesResultsCard extends StatelessWidget {
  final int index;
  final AnswersStatus? status;
  final VoidCallback onTap;

  const QuizzesResultsCard({
    Key? key,
    required this.index,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Theme.of(context).primaryColor;

    switch (status) {
      case AnswersStatus.ANSWERED:
        _backgroundColor = Get.isDarkMode ? Theme.of(context).cardColor : Theme.of(context).primaryColor;
        break;
      case AnswersStatus.CORRECT:
        _backgroundColor = correctAnswersColor;
        break;
      case AnswersStatus.WRONG:
        _backgroundColor = wrongAnswersColor;
        break;
      case AnswersStatus.NOT_ANSWERED:
        _backgroundColor = Get.isDarkMode ? Colors.red.withOpacity(0.5) : Theme.of(context).primaryColor.withOpacity(0.35);
        break;

      default:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.35);
    }

    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.all(getHeight * 0.025),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: UIParameters.cardBorderRadius,
        ),
        child: Center(
          child: AutoSizeText(
            "$index",
            style: TextStyle(
              color: status == AnswersStatus.NOT_ANSWERED ? Theme.of(context).primaryColor : null,
            ),
          ),
        ),
      ),
    );
  }
}
