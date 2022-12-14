import 'dart:ui';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../controllers/questions_controller.dart';
import '../../firebase_ref/loading_status.dart';
import '../../widgets/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecorations(
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AutoSizeText(controller.currentQuestion.value!.question),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
