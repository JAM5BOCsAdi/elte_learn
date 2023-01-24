import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() => _singleton;

  static AlertDialog questionStartDialogue({required VoidCallback onTapOK, required VoidCallback onTapCancel}) {
    return AlertDialog(
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
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: onTapCancel,
          child: const Text('Mégse'),
        ),
      ],
    );
  }

  static AlertDialog showTimeUpDialogue({required VoidCallback onTapOK}) {
    return AlertDialog(
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
          child: const Text('OK'),
        ),
      ],
    );
  }
}
