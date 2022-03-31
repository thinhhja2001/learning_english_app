import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:learning_english_app/utils/colors.dart';

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({Key? key, this.diameter = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = kcGreyColor;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, -size.height / 6),
        height: size.width * 1.2,
        width: size.width * 1.5,
      ),
      0,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
