import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/ui_parameters.dart';

enum AnswersStatus {
  CORRECT,
  WRONG,
  ANSWERED,
  NOT_ANSWERED,
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback? onTap;

  const AnswerCard({
    Key? key,
    required this.answer,
    this.isSelected = false,
    this.onTap,
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

class CorrectAnswer extends StatelessWidget {
  final String answer;
  const CorrectAnswer({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(vertical: getHeight * 0.025, horizontal: getWidth * 0.025),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnswersColor.withOpacity(0.1),
      ),
      child: AutoSizeText(
        answer,
        style: const TextStyle(
          color: correctAnswersColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  final String answer;
  const WrongAnswer({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(vertical: getHeight * 0.025, horizontal: getWidth * 0.025),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: wrongAnswersColor.withOpacity(0.1),
      ),
      child: AutoSizeText(
        answer,
        style: const TextStyle(
          color: wrongAnswersColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  final String answer;
  const NotAnswered({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(vertical: getHeight * 0.025, horizontal: getWidth * 0.025),
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: notAnswersColor.withOpacity(0.1),
      ),
      child: AutoSizeText(
        answer,
        style: const TextStyle(
          color: notAnswersColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
