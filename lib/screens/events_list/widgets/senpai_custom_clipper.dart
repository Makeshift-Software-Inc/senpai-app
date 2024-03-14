import 'package:flutter/material.dart';

class SenpaiCustomClipper extends CustomClipper<Path> {
  SenpaiCustomClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(20, 0.0)
      ..arcToPoint(
        const Offset(80, 0),
        clockwise: false,
        radius: const Radius.circular(4),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(130, size.height);

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(SenpaiCustomClipper oldClipper) => true;
}
