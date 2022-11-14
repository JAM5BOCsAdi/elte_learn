import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/configs/themes/custom_text_styles.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/icon_text.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;

  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _padding = Get.height * 0.01;
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: UIParameters.cardBorderRadius,
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: SizedBox(
                      height: Get.height * 0.1 / 1.25,
                      width: Get.width * 0.2 / 1.25,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: model.imageUrl!,
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                      // model.imageUrl == null || model.imageUrl!.isEmpty ? Image.asset("assets/images/app_splash_logo.png") : Image.network(model.imageUrl!),
                    ),
                  ),
                ),
                Gap(Get.width * 0.025),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        model.title,
                        style: cardTitles(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01),
                        child: AutoSizeText(model.description),
                      ),
                      Row(
                        children: [
                          IconText(
                            icon: Icon(
                              Icons.help_outline_sharp,
                              color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              "${model.questionsCount} kérdés",
                              style: detailText.copyWith(
                                color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Gap(Get.width * 0.025),
                          IconText(
                            icon: Icon(
                              Icons.timer,
                              color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor,
                            ),
                            text: Text(
                              "${model.timeInMinutes()} perc",
                              style: detailText.copyWith(
                                color: Get.isDarkMode ? kOnSurfaceTextColor : Theme.of(context).primaryColor,
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
                  child: Icon(
                    Icons.wine_bar,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardBorderRadius),
                      bottomRight: Radius.circular(cardBorderRadius),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
