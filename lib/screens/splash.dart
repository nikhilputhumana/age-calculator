import 'dart:async';
import 'package:age_calculator_horoscope/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  /*
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScreenHome())));
  }
  */

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.purple,
      splash: 'assets/images-png/splash.png',
      nextScreen: ScreenHome(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 5,
      pageTransitionType: PageTransitionType.fade,
    );

  }
}
