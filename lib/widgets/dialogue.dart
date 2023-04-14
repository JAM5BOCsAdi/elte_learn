import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../utils/consts.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() => _singleton;

  static AlertDialog questionStartDialogue({required VoidCallback onTapOK, required VoidCallback onTapCancel}) {
    return AlertDialog(
      backgroundColor: kOnSurfaceTextColor,
      title: const Text(quizStartFailTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: const [
            Text(quizLoginTitle),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapOK,
          child: Text(quizOKTitle, style: TextStyle(color: Theme.of(Get.context!).primaryColor)),
        ),
        TextButton(
          onPressed: onTapCancel,
          child: const Text(quizCancelTitle, style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  static AlertDialog showTimeUpDialogue({required VoidCallback onTapOK}) {
    return AlertDialog(
      backgroundColor: kOnSurfaceTextColor,
      title: const Text(quizTimeIsUpTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: const [
            Text(quizTimeIsUpTextTitle),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapOK,
          child: Text(quizOKTitle, style: TextStyle(color: Theme.of(Get.context!).primaryColor)),
        ),
      ],
    );
  }
}
