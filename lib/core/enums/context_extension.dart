import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/permanently_denied_dialogue.dart';

extension ContextExtension on BuildContext {
  void showConfirmDialog({
    required String message,
    required Function() onConfirmed,
    Function()? onDenied,
    bool showCancelBtn = true,
    bool barrierDismissible = true,
    Color? confirmButtonColor,
    Color? confirmBtnFontColor,
    Color? cancelFontColor,
  }) async {
    final bool? state = await showDialog(
        context: this,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return PermanentlyDeniedDialog(
            message: message,
            onConfirmed: onConfirmed,
            showCancelBtn: showCancelBtn,
            onDenied: onDenied,
            cancelFontColor: cancelFontColor,
            confirmBtnFontColor: confirmBtnFontColor,
            confirmButtonColor: confirmButtonColor,
          );
        });
    if (state != null && state) {
      onConfirmed();
    }
  }
}
