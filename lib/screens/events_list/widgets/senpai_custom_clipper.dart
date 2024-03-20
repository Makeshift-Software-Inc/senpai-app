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

class SenpaiCosplayCustomClipper extends CustomClipper<Path> {
  SenpaiCosplayCustomClipper();

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, 0) // Move to the top-right corner
      ..lineTo(size.width - 20, 0) // Draw line to the left
      ..arcToPoint(
        Offset(size.width - 80, 0), // Arc to the left
        clockwise: true, // Change arc direction to clockwise
        radius: const Radius.circular(4),
      )
      ..lineTo(0, 0) // Draw line to the top-left corner
      ..lineTo(0, size.height) // Draw line down the left side
      ..lineTo(size.width - 130, size.height); // Draw line to the right

    path.lineTo(
        size.width, size.height); // Draw line to the bottom-right corner

    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(SenpaiCosplayCustomClipper oldClipper) => true;
}
