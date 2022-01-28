import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showLoadingIndicator(
  BuildContext context,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      );
    },
  );
}

void hideLoadingIndicator(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
