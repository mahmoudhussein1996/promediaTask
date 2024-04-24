import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promedia_task/Theme/theme.dart';

class TextDefaultWidget extends StatelessWidget {
  const TextDefaultWidget(
      {Key? key,
      required this.title,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.gradientColors,
      this.maxLines,
      this.underlineText,
      this.lineThrough,
      this.textBaseline,this.textAlign, this.textOverflow, this.height,})
      : super(key: key);
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final Paint? gradientColors;
  final String title;
  final int? maxLines;
  final bool? underlineText;
  final bool? lineThrough;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: "montserrat",
          color: color ?? ThemeClass.whiteColor,
          textBaseline: textBaseline,
          foreground: gradientColors,
          overflow:textOverflow?? TextOverflow.ellipsis,
          height: height,
          decoration: underlineText == true
              ? TextDecoration.underline
              : lineThrough == true ?  TextDecoration.lineThrough : TextDecoration.none,
      ),
      maxLines: maxLines??5,
      overflow:textOverflow?? TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}

