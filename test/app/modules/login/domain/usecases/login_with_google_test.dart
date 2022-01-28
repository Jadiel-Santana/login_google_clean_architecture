import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:login/app/core/util/constants.dart';
import 'package:login/app/modules/login/domain/entities/user.dart';
import 'package:login/app/modules/login/domain/errors/errors.dart';
import 'package:login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:login/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}
class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  final repository = LoginRepositoryMock();
  final connectivityService = ConnectivityServiceMock();
  final usecase = LoginWithGoogleImpl(repository, connectivityService);

  test('test Failure call usecase', () async {
    when(() => connectivityService.isOnline()).thenAnswer((_) async => false);

    final result = await usecase();
    expect(result.leftMap((failure) => failure is LoginError), Left(true));
    expect(result.fold((failure) => failure.message, id), Constants.OFFLINE_CONNECTION);
  });

  test('test Success call usecase', () async {
    final user = User(uid: '4321', name: 'User Test', email: 'user@email.com');

    when(() => connectivityService.isOnline()).thenAnswer((_) async => true);
    when(() => repository.executeLoginGoogle()).thenAnswer((_) async => Right(user));

    final result = await usecase();
    expect(result, Right(user));
    expect(result.fold(id, (user) => user.name), 'User Test');
  });
}