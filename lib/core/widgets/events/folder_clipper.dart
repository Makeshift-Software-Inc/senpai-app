import 'package:flutter/material.dart';

class FolderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    // first curve
    Offset controlPoint = Offset(0, size.height - 22);
    Offset endPoint = Offset(20, size.height - 20);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width - 30, size.height - 20);

    // second cubic curve now
    Offset controlPoint1 = Offset(size.width, size.height - 20);
    Offset controlPoint2 = Offset(size.width - 30, 0);
    Offset endPoint1 = Offset(size.width, 0);
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint1.dx,
      endPoint1.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
