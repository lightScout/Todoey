import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    // properties to paint
    paint.color = Colors.lightBlueAccent[100];
    paint.style = PaintingStyle.fill;
    var path = Path();

    // Draw your path
    //TOP
    path.moveTo(0, size.height * 0.11);
    path.quadraticBezierTo(
        size.width / 5, size.height / 5, size.width, size.height * 0.11);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    //Bottom
    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
