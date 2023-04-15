import 'dart:ui';

import 'package:elte_learn/configs/themes/app_light_theme.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../models/question_paper_model.dart';
import '../../utils/consts.dart';
import '../../widgets/icon_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  final QuestionPaperModel model;

  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _padding = getHeight * 0.01;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: kOnSurfaceTextColor,
      ),
      child: InkWell(
        onTap: () => controller.navigateToQuestions(paper: model, tryAgain: false),
        child: Padding(
          padding: EdgeInsets.all(_padding),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => imgDialog(model: model),
                    child: ClipRRect(
                      borderRadius: UIParameters.cardBorderRadius,
                      child: ColoredBox(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        child: SizedBox(
                          height: getHeight * 0.1 / 1.25,
                          width: getWidth * 0.2 / 1.25,
                          child: Center(
                            child: buildImage(model: model),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(getWidth * 0.025),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          model.title,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: getHeight * 0.01, bottom: getHeight * 0.01),
                          child: AutoSizeText(model.description),
                        ),
                        Row(
                          children: [
                            IconText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                "${model.questionsCount} kérdés",
                                style: detailText.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Gap(getWidth * 0.025),
                            IconText(
                              icon: Icon(
                                Icons.timer,
                                color: Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                "${model.timeInMinutes()} perc",
                                style: detailText.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -_padding,
                right: -_padding,
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: _padding, horizontal: _padding * 2),
                    decoration: BoxDecoration(
                      color: primaryLT,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cardBorderRadius),
                        bottomRight: Radius.circular(cardBorderRadius),
                      ),
                    ),
                    child: const Icon(
                      AppIcons.trophyOutLine,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void imgDialog({required QuestionPaperModel model}) {
    Get.dialog(
      Dialog(
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  color: Theme.of(Get.context!).primaryColor.withAlpha(200),
                ),
              ),
            ),
            buildImage(model: model),
          ],
        ),
      ),
    );
  }

  Widget buildImage({required QuestionPaperModel model}) {
    return CachedNetworkImage(
      imageUrl: model.imageUrl!,
      placeholder: (context, url) => Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Image.asset(appSplashLogoPng),
    );
  }
}
