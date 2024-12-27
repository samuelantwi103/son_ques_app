import 'package:flutter/material.dart';

class OctagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double factor = 0.3; // Adjust this for the size of the corners

    Path path = Path();
    path.moveTo(w * factor, 0); // Top-left corner
    path.lineTo(w * (1 - factor), 0); // Top-right corner
    path.lineTo(w, h * factor); // Right-top corner
    path.lineTo(w, h * (1 - factor)); // Right-bottom corner
    path.lineTo(w * (1 - factor), h); // Bottom-right corner
    path.lineTo(w * factor, h); // Bottom-left corner
    path.lineTo(0, h * (1 - factor)); // Left-bottom corner
    path.lineTo(0, h * factor); // Left-top corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
