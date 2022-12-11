import 'dart:ui';

import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../../widgets/background_decoration.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundDecorations(
          child: Center(
            child: AutoSizeText(
              "Hi",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          // showGradient: ,
        ),
      ),
    );
  }
}
