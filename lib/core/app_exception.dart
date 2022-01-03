import 'package:flutter/services.dart';

// CUONG.TRUONG on January/03/2022: Base class for app exceptions.
class AppException implements Exception {
  final String internalMessage;
  final String userFriendlyMessage;

  AppException(
      {required this.internalMessage,
      this.userFriendlyMessage =
          'Something went wrong, please try again later'});

  factory AppException.fromException(dynamic exception) {
    if (exception is AppException) {
      return exception;
    } else if (exception is PlatformException) {
      return AppException._fromPlatformException(exception);
    } else {
      return AppException(
        internalMessage: exception.toString(),
        userFriendlyMessage: 'Something went wrong, please try again later',
      );
    }
  }

  factory AppException._fromPlatformException(PlatformException exception) {
    String userFriendlyMessageUri =
        'Something went wrong, please try again later';
    return AppException(
      internalMessage: exception.message!,
      userFriendlyMessage: userFriendlyMessageUri,
    );
  }

  @override
  String toString() {
    return internalMessage;
  }
}

class UnauthorizedAppException extends AppException {
  UnauthorizedAppException() : super(internalMessage: '401 Unauthorized');
}
