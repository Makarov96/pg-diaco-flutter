import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String valueTextButton,
  required void Function()? onPressed,
  required String title,
  required String content,
}) {
  // set up the buttons
  final remindButton = TextButton(
    onPressed: onPressed,
    child: Text(valueTextButton),
  );

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void showLoadingDialog({
  required BuildContext context,
  required String title,
  required Widget? content,
}) {
  // set up the buttons

  // set up the AlertDialog
  final alert = AlertDialog(
    title: Text(title),
  );

  // show the dialog
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
