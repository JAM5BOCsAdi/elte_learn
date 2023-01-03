import 'package:elte_learn/packages_barrel/packages_barrel.dart';
import 'package:elte_learn/widgets/background_decoration.dart';

import '../../widgets/custom_app_bar.dart';
import '../../controllers/questions_controller.dart';

class QuizzesResultScreen extends GetView<QuestionsController> {
  const QuizzesResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kvíz Áttekintése",
      ),
      body: SafeArea(
        child: BackgroundDecoration(
          child: Center(
            child: AutoSizeText("Teszt"),
          ),
        ),
      ),
    );
  }
}
