import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../configs/themes/ui_parameters.dart';
import '../../models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;
  const QuestionCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Padding(
      padding: const EdgeInsets.all(_padding),
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
                    height: Get.height * 0.15,
                    width: Get.width * 0.15,
                    // child: CachedNetworkImage(
                    //   imageUrl: _questionPaperController.allPapers[index].imageUrl!,
                    //   placeholder: (context, url) => Container(
                    //     alignment: Alignment.center,
                    //     child: const CircularProgressIndicator(),
                    //   ),
                    //   errorWidget: (context, url, error) => Image.asset("assets/images/app_splash_logo.png"),
                    // ),
                    child: model.imageUrl == null || model.imageUrl!.isEmpty ? Image.asset("assets/images/app_splash_logo.png") : Image.network(model.imageUrl!),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(model.title),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
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
