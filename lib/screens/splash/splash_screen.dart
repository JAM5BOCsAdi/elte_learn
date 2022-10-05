import 'package:elte_learn/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// The logo pops up for a few seconds
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient(context)),
        child: Image.asset(
          "assets/images/app_splash_logo.png",
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}
