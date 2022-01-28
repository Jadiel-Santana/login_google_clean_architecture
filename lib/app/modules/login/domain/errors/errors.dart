import 'package:login/app/core/errors/errors.dart';

class LoginError extends Failure {
  final String message;

  LoginError({
    this.message,
  });
}