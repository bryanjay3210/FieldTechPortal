import 'package:flutter/material.dart';

showDialogShared(BuildContext context, Widget page,
    {EdgeInsets? padding}) async {
  return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      builder: (_) => Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            insetPadding: padding,
            child: page,
          ));
}

Future<void> getDialogResult(BuildContext? context,
    TextEditingController ctrler, Widget widget, String title) async {
  final result = await showDialog(context: context!, builder: (_) => widget);
  if (result == null) {
    return;
  }
  ctrler.text = result;
}

Future<bool> showConfirmDialog(
  BuildContext context,
  String question,
) async {
  var res = false;
  await showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(question),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Confirm',
            ),
            onPressed: () {
              res = true;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  return res;
}
