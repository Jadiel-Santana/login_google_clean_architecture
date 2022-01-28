import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/app_colors.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Google - Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
    ).modular();
  }
}