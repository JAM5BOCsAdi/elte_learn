import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../widgets/background_decoration.dart';
import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';

class QuizzesResultScreen extends GetView<QuestionsController> {
  const QuizzesResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.completedQuiz,
      ),
      extendBodyBehindAppBar: true,
      body: const BackgroundDecoration(
        child: SafeArea(
          child: Center(
            child: AutoSizeText("Teszt"),
          ),
        ),
      ),
    );
  }
}
