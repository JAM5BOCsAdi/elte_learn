import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:elte_learn/packages_barrel/packages_barrel.dart';

import '../utils/consts.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() => _singleton;

  static AlertDialog dialogue({
    required String title,
    required String listBodyTitle,
    required VoidCallback onTapOK,
    bool isOnTapCancel = false,
    VoidCallback? onTapCancel,
  }) {
    return AlertDialog(
      backgroundColor: kOnSurfaceTextColor,
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(listBodyTitle),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTapOK,
          child: Text(quizOKTitle, style: TextStyle(color: Theme.of(Get.context!).primaryColor)),
        ),
        _buildCancelTextButton(isOnTapCancel, onTapCancel),
      ],
    );
  }

  static Widget _buildCancelTextButton(bool isOnTapCancel, VoidCallback? onTapCancel) {
    if (isOnTapCancel) {
      return TextButton(
        onPressed: onTapCancel,
        child: const Text(quizCancelTitle, style: TextStyle(color: Colors.black)),
      );
    }
    return const SizedBox(height: 0, width: 0);
  }
}
