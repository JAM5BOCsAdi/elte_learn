import 'package:elte_learn/controllers/result_controller_extension.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../widgets/background_decoration.dart';
import '../../widgets/content_area.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundDecoration(
          child: Column(
            children: [
              CustomAppBar(
                leading: const SizedBox(height: 80),
                title: controller.correctAnsweredQuestions, // TODO: controller.correctAnsweredQuestions
              ),
              Expanded(
                child: ContentArea(
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/images/bulb.svg"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
