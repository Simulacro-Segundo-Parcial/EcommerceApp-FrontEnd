// lib/core/errors/app_exception.dart
class AppException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic details;

  AppException(this.message, {this.statusCode, this.details});

  @override
  String toString() =>
      'AppException(statusCode: $statusCode, message: $message, details: $details)';
}

class NetworkException extends AppException {
  NetworkException(super.message, {super.statusCode, super.details});
}

class AuthException extends AppException {
  AuthException(super.message, {super.statusCode, super.details});
}
