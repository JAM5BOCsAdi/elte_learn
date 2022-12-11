import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../widgets/background_decoration.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundDecorations(
          child: AutoSizeText("Hi"),
          // showGradient: ,
        ),
      ),
    );
  }
}
