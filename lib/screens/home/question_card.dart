import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;

  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.height * 0.01),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: UIParameters.cardBorderRadius,
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    height: Get.height * 0.10,
                    width: Get.width * 0.15,
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl!,
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                    ),
                    // model.imageUrl == null || model.imageUrl!.isEmpty ? Image.asset("assets/images/app_splash_logo.png") : Image.network(model.imageUrl!),
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.025),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(model.title),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height * 0.01, bottom: Get.height * 0.01),
                      child: AutoSizeText(model.description),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
