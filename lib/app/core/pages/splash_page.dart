import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login/app/app_colors.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  splashScreenPage() async {
    Future.delayed(Duration(seconds: 3))
        .whenComplete(() => Modular.to.pushNamed('/logged'));
  }

  @override
  void initState() {
    splashScreenPage();
    animationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.white,
        child: FadeTransition(
          opacity: _fadeInFadeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/clean_architecture.png',
                height: 350,
                width: 350,
              ),
              SizedBox(height: 20),
              Text(
                'Login Google\nClean Architecture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  animationController() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}