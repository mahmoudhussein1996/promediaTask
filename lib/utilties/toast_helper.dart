import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promedia_task/Theme/theme.dart';


class ToastHelper {
  static Future showError(
      {required String message, Color? backgroundColor}) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor ?? Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static Future showSuccess(
      {required String message, Color? backgroundColor}) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: backgroundColor ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.sp);
  }
}


class ShowToastFunctions{
  static  FToast fToast=FToast();

  ShowToastFunctions._();



  static showToast({required BuildContext context,required bool isTranslate,required String msg,double? margin=0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // margin: EdgeInsets.only(bottom: SizeConfig.height*0.02,left:SizeConfig.height*0.02,right: SizeConfig.height*0.02 ),
        content: Text(msg),
        elevation: 0,
        backgroundColor: ThemeClass.blackColor,
      ),

    );

  }

  static showPublicConnectionToast({required BuildContext context,required String msg,required bool connected,double? margin=0}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width:16.w),
              Icon(
                connected?Icons.wifi:Icons.wifi_off_sharp,
                color:ThemeClass.whiteColor,
              ),
              SizedBox(width: 15.w),

              Expanded(
                child: Text(
                  msg,
                  textAlign:TextAlign.start,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: ThemeClass.whiteColor,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
        backgroundColor:connected? ThemeClass.whiteColor:ThemeClass.greyColor,
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(
          bottom:4.h,
          // left:AppLocalizations.of(context)!.locale.languageCode=='en'?(connected?SizeConfig.height * 0.02:SizeConfig.height * 0.06):(connected?SizeConfig.height * 0.07:SizeConfig.height * 0.11),
          // right:AppLocalizations.of(context)!.locale.languageCode=='en'?(connected?SizeConfig.height * 0.02:SizeConfig.height * 0.06):(connected?SizeConfig.height * 0.07:SizeConfig.height * 0.11),
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25),),),
      ),
    );
  }

}