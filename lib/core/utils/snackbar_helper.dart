import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otlob/core/app.dart';
import 'package:otlob/core/extensions/theme_extensions.dart';
import 'package:otlob/core/res/color_manager.dart';
import 'package:otlob/core/ui_kit/shapes/gradient_border_side.dart';
import 'package:otlob/core/utils/overlays/zesty_snack.dart';

// error message
enum ErrorMessage {
  snackBar,
  toast;

  bool get isSnackBar => this == ErrorMessage.snackBar;

  bool get isToast => this == ErrorMessage.toast;
}

class SnackbarHelper {
  void showMessage(
    String message,
    ErrorMessage type, {
    int snackbarSeconds = 4,
    bool isError = false,
    List<Widget> actions = const [],
  }) {
    if (type.isSnackBar) {
      _showSnackbar(message, snackbarSeconds, isError, actions);
    } else {
      _showToast(message);
    }
  }

  static void _showSnackbar(
    String message, [
    int snackbarSeconds = 3,
    bool isError = false,
    List<Widget> actions = const [],
  ]) {
    final context = NAVIGATOR_KEY.currentContext;
    final textStyle =
        context != null ? Theme.of(context).textTheme.labelMedium : null;

    ZestySnack.instance.show(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ...actions,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    smoothness: 1,
                    side: GradientBorderSide(
                      color: isError ? ColorM.danger : ColorM.primary,
                      width: 1,
                    ),
                  ),
                ),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  message,
                  softWrap: true,
                  style: textStyle ??
                      TextStyle(
                        color: isError ? ColorM.danger : ColorM.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: snackbarSeconds),
    );
  }

  static void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: ColorM.primary,
      textColor: Colors.white,
      fontSize:
          SCAFFOLD_MESSENGER_KEY.currentContext?.labelMedium.fontSize ?? 14,
    );
  }
}
