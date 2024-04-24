import 'package:flutter/material.dart';
class ShapeWidget extends StatelessWidget {
  Color shapeColor;
  double width;
  double height;

   ShapeWidget({super.key, required this.shapeColor, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: shapeColor),
    );
  }
}
