import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> appShowAlertDialog(BuildContext context,
    {required String title, required String alertMessage}) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(alertMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}

Future<void> appShowErrorDialog(BuildContext context, dynamic exception) async {
  String errorMessage = exception.toString();
  if (exception is FirebaseException) {
    errorMessage = exception.message!;
  }
  appShowAlertDialog(context, title: 'Error', alertMessage: errorMessage);
}

Future<void> appShowRetryDialog(BuildContext context,
    {required String title,
    required String retryMessage,
    required Future retryAction}) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(retryMessage),
        actions: [
          TextButton(
            onPressed: () async {
              await retryAction;
              Navigator.of(context).pop();
            },
            child: const Text('Retry'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          )
        ],
      );
    },
  );
}
