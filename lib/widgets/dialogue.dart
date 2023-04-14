import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() => _singleton;

  static AlertDialog questionStartDialogue({required VoidCallback onTapOK, required VoidCallback onTapCancel}) {
    return AlertDialog(
      backgroundColor: kOnSurfaceTextColor,
      title: const Text('Kvíz megkezdése sikertelen!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const [
            Text('Kvíz megkezdéséhez kérem jelentkezzen be.'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapOK,
          child: Text('OK', style: TextStyle(color: Theme.of(Get.context!).primaryColor)),
        ),
        TextButton(
          onPressed: onTapCancel,
          child: const Text('Mégse', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  static AlertDialog showTimeUpDialogue({required VoidCallback onTapOK}) {
    return AlertDialog(
      backgroundColor: kOnSurfaceTextColor,
      title: const Text('Lejárt az idő!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const [
            Text('Legközelebb jobban fog menni :)'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapOK,
          child: Text('OK', style: TextStyle(color: Theme.of(Get.context!).primaryColor)),
        ),
      ],
    );
  }
}
