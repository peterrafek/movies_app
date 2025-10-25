 import 'package:flutter/material.dart';
import 'package:movies_app/utiles/dialogs/custom_dialog_content.dart';


abstract final class Dialogs {
  static Future customDialog({
    required BuildContext context,
    List<Widget>? actions,
    Widget? content,
    bool isBarrierDismissible = true,
  }) {
    return showDialog(
      barrierDismissible: isBarrierDismissible,
      useSafeArea: true,
      context: context,
      builder: (context) =>
          CustomDialogContent(content: content, actions: actions),
    );
  }
}