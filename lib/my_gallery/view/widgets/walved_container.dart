import 'package:flutter/material.dart';

class WavedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const WavedContainer({super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavedClipper(),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class WavedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(size.width * 3 / 4, size.height / 2, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}