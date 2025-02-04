import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  String buttonText = "OK",
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(buttonText),
          )
        ],
      );
    },
  );
}
