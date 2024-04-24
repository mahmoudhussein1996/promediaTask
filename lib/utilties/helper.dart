import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promedia_task/Theme/theme.dart';
import 'package:promedia_task/utilties/widgets/custom_button_widget.dart';

extension HexColor on Color {
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}


extension ContextExtensions on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Helper{
  static Future<bool?> _getImageSource(BuildContext context)async {
    bool? isGallery;
    await showDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: true,
        builder: (context) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: 270.w,
            height: 353.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(52.r),
                color: ThemeClass.whiteColor.withOpacity(.4)
            ),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                CustomButton(
                    width: 184.w, height: 100.h,
                    textColor: ThemeClass.blackColor,
                    horizontalPadding: 10.w,
                    title: "Gallery",
                    backgroundColor: ThemeClass.moveColor,
                    iconWidget: SvgPicture.asset("assets/images/gallery.svg"),
                    onTap: (){
                      Navigator.of(context).pop();
                      isGallery = true;
                    }),
                SizedBox(height: 40.h),
                CustomButton(
                    width: 184.w, height: 100.h,
                    textColor: ThemeClass.blackColor,
                    horizontalPadding: 10.w,
                    title: "Camera",
                    backgroundColor: ThemeClass.blueLiteColor,
                    iconWidget: SvgPicture.asset("assets/images/camera.svg"),
                    onTap: (){
                      Navigator.of(context).pop();
                      isGallery = false;
                    }),
              ],
            ),
          ),
        ),
      );
    }
    );
    return isGallery;
  }

  static Future<File?> pickImage({required BuildContext context})async {
    bool? isGallery = await Helper._getImageSource(context);
    if(isGallery==null) return null;
    final XFile? file = await ImagePicker().pickImage(source: isGallery?ImageSource.gallery:ImageSource.camera, requestFullMetadata: false);
    if(file!=null) return File(file.path);
    return null;
  }
}





