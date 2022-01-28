import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:login/app/core/errors/errors.dart';
import 'package:login/app/core/util/constants.dart';
import 'package:login/app/modules/login/domain/entities/user.dart';
import 'package:login/app/modules/login/domain/errors/errors.dart';
import 'package:login/app/modules/login/domain/repositories/login_repository.dart';

part 'login_with_google.g.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, User>> call();
}

@Injectable()
class LoginWithGoogleImpl implements LoginWithGoogle {
  final LoginRepository repository;
  final ConnectivityService connectivityService;

  LoginWithGoogleImpl(this.repository, this.connectivityService);

  @override
  Future<Either<Failure, User>> call() async {
    final isOnline = await connectivityService.isOnline();
    if(!isOnline) {
      return Left(LoginError(message: Constants.OFFLINE_CONNECTION));
    }
    return await repository.executeLoginGoogle();
  }
}