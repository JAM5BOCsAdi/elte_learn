import 'package:elte_learn/packages_barrel/packages_barrel.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() => _singleton;

  static Widget questionStartDialogue({required VoidCallback onTapOK, required VoidCallback onTapCancel}) {
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
}
// ORIGINAL:
// AlertDialog(
// content: Column(
//   mainAxisSize: MainAxisSize.min,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: const [
//     Text(
//       "Hi",
//       style: TextStyle(fontWeight: FontWeight.bold),
//     ),
//     Text("Kvíz kitöltéséhez előbb kérem lépjen be"),
//   ],
// ),
// actions: [
//   TextButton(onPressed: onTap, child: const AutoSizeText("OK")),
// ],
// );
