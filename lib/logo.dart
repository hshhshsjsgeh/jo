import 'package:flutter/material.dart';

enum AlignmentJO { top, right, bottom, left }

class JOPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path()
      ..moveTo(1, size.height)
      ..relativeLineTo(0, -(size.height / 2))
      ..relativeLineTo(size.width / 5, 1)
      ..relativeLineTo(0, size.width / 5)
      ..relativeLineTo(size.width / 5, 0)
      ..relativeLineTo(0, -(size.height - size.width / 5))
      ..relativeLineTo(size.width / 5 * 3, 0)
      ..relativeLineTo(0, size.height)
      ..relativeLineTo(-(size.width), 0)
      ..moveTo(size.width / 5 * 4, size.width / 5)
      ..relativeLineTo(-(size.width / 5), 0)
      ..relativeLineTo(0, size.height / 2)
      ..relativeLineTo(size.width / 5, 0)
      ..relativeLineTo(0, -(size.height / 2));

    final Paint paint = Paint()
      ..color = const Color(0xFFFF0000).withAlpha(1).withOpacity(1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..isAntiAlias = false;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
