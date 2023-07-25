import 'dart:async';
import 'dart:ffi';

import 'package:age_calculator_horoscope/screens/home.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut);
    
    /*
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ScreenHome())));
    */
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /*
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SPLASH'),
            Text('SCREEN'),
            Text('HERE'),
          ],
        ),
      ),
      */

      backgroundColor: Colors.purple,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: HeartPainter(progress: _animation.value),
              child: Container(
                width: 200,
                height: 200,
              ),
            );
          },
        ),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  final double? progress;

  HeartPainter({this.progress});

  @override
  void paint(Canvas canvas, dynamic size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 4;
    final double controlPointDistance = radius * 2.5;

    final double x0 = centerX + radius * progress;
    final double y0 = centerY;
    final double x1 = centerX;
    final double y1 = centerY - controlPointDistance * progress;
    final double x2 = centerX - radius * progress;
    final double y2 = centerY;
    final double x3 = centerX;
    final double y3 = centerY + controlPointDistance * progress;

    Path path = Path()
      ..moveTo(x0, y0)
      ..cubicTo(x1, y1, x2, y2, x3, y3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
