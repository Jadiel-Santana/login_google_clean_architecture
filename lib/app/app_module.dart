import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/core/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => Connectivity()),
    /*Bind.factory((i) => Dio()),
    Bind.factory((i) => GithubDatasource(i())),
    Bind.factory((i) => SearchRepositoryImpl(i())),
    Bind.factory((i) => SearchByTextImp(i())),*/
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ChildRoute('/logged', child: (_, args) => Container(color: Colors.red,)),
  ];
}