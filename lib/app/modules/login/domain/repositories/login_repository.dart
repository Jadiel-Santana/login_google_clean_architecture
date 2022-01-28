import 'package:dartz/dartz.dart';
import 'package:login/app/core/errors/errors.dart';
import 'package:login/app/modules/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> executeLoginGoogle();
}