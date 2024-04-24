import 'package:flutter/material.dart';

class ThemeClass {
  static Color blackColor = const Color(0xff4A4A4A);
  static Color moveColor = const Color(0xffDDCDFF);
  static Color greyColor = const Color(0xff988F8C);
  static Color greyLiteColor = const Color(0xffF7F7F7);
  static Color blueColor = const Color(0xff7BB3FF);
  static Color blueLiteColor = const Color(0xffEBF6FF);
  static Color whiteColor = const Color(0xffffffff);


  static LinearGradient screenGradient =  LinearGradient(
    colors: [
      Color(0xffDDCDFF),
      Color(0xffEA94D7),
      Color(0xffFFDADA),
      Color(0xffffffff),
      // Color(0xffDaEcD8),
    ],
    // stops: [
    //   0.0,
    //   0.4,
    //   0.55,
    //   0.7,
    //   0.9,
    // ],
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
  );
// static Shader shaderCallback (bounds) {
//   return  LinearGradient(
//     colors:currentIndex == 1 ? [
//       Color(0xff42DEBF),
//       Color(0xff6CA5C2),
//       Color(0xff4876B2),
//       Color(0xff315FAA),
//     ] :[
//       ThemeClass.blackColor,
//       ThemeClass.blackColor,
//     ],
//   ).createShader(bounds);
// }
//   static List<BoxShadow> primaryBoxShadow = [
//     BoxShadow(
//       color: const Color.fromRGBO(197, 197, 197, 0.5),
//       spreadRadius: 5.r,
//       blurRadius: 8.r,
//       offset: const Offset(0, 2), // changes position of shadow
//     ),
//   ];
//   static List<BoxShadow> secondaryBoxShadow = [
//     BoxShadow(
//       color: const Color.fromRGBO(197, 197, 197, 0.5),
//       spreadRadius: 1.r,
//       blurRadius: 1.r,
//       offset: const Offset(0, 0), // changes position of shadow
//     ),
//   ];

  static Gradient loginGradientColors = LinearGradient(
    colors: <Color>[
      Color(0xffFFDADA),
      Color(0xffDDCDFF),
      Color(0xffEA94D7),
    ],
  );

  // static TextStyle defaultTextStyle = TextStyle(
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.w500,
  //     color: ThemeClass.blackColor);
  //
  // static TextStyle getTextStyle(
  //         {Color? color, FontWeight? fontWeight, double? fontSize}) =>
  //     TextStyle(
  //         fontSize: fontSize!,
  //         fontWeight: fontWeight,
  //         color: color,
  //         fontFamily: 'Tajawal',);
  //
  // static BoxDecoration defaultDecoration = BoxDecoration(
  //   color: Colors.white,
  //   borderRadius: BorderRadius.circular(10.w),
  //   boxShadow: ThemeClass.secondaryBoxShadow,
  // );
  // static BoxDecoration customDecoration = BoxDecoration(
  //   color: Colors.white,
  //   image: const DecorationImage(
  //       image: AssetImage('assets/images/lists/AD Bar - 1.png'),
  //       fit: BoxFit.cover),
  //   borderRadius: BorderRadius.circular(10.w),
  // );
}
