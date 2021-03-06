import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/modules/login/domain/usecases/login_with_google.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
    $LoginWithGoogleImpl,
  ];

  @override
  List<ModularRoute> get routes => [];
}