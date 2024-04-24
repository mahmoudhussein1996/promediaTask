import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promedia_task/Theme/theme.dart';
import 'package:promedia_task/login/controller/api/login_api.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/login/controller/provider/state_on_login.dart';
import 'package:promedia_task/login/view/widgets/shape_widget.dart';
import 'package:promedia_task/services/api_handler/general_api_state.dart';
import 'package:promedia_task/utilties/widgets/custom_button_widget.dart';
import 'package:promedia_task/utilties/widgets/custom_textfeild_widget.dart';
import 'package:promedia_task/utilties/widgets/default_text_widget.dart';
import 'package:promedia_task/utilties/widgets/loading_widget.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xffDDCDFF),
              Color(0xffEA94D7),
              Color(0xffFFDADA),
              Color(0xffffffff),
              // Color(0xffDaEcD8),
            ],
            //stops: [0.03,0,2,0.4,0.2],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: Stack(
          children: [
            PositionedDirectional(start: 7.w,top: -63.h,child: SvgPicture.asset("assets/images/Vector 2014.svg", width: 213.w, height: 204.h,)),
            PositionedDirectional(start: -12.w,top: -82.h,child: SvgPicture.asset("assets/images/Vector 2013.svg", width: 251.w, height: 241.h,)),
            PositionedDirectional(start: -24.w,top: -94.h,child: SvgPicture.asset("assets/images/Vector 2009.svg", width: 276.w, height: 265.h,)),
            PositionedDirectional(start: -40.w,top: -108.h,child: SvgPicture.asset("assets/images/Vector 2010.svg",width: 309.w, height: 294.h,)),
            PositionedDirectional(start: -57.w,top: -126.h,child: SvgPicture.asset("assets/images/Vector 2011.svg",width: 343.w, height: 330.h,)),
            PositionedDirectional(start: -72.w,top: -140.h,child: SvgPicture.asset("assets/images/Vector 2012.svg",width: 371.w, height: 357.h,)),
            PositionedDirectional(start: 64.w,top: 48.h,child: Image.asset("assets/images/love_photography.png", width: 131.w, height: 131.h)),


            PositionedDirectional(start: 90.w,top: 206.h,child: TextDefaultWidget(title: "My Gallery",
              color: ThemeClass.blackColor,
              fontSize: 50.sp, fontWeight: FontWeight.w700,)),

            PositionedDirectional(start: 280.w,top: 470.h,child: ShapeWidget(shapeColor: Colors.amber, width: 104.w, height: 104.h,)),
            PositionedDirectional(start: 310.w,top: 530.h,child: ShapeWidget(shapeColor: Colors.white.withOpacity(.5), width: 82.w, height: 82.h,)),
            PositionedDirectional(start: 260.w,top: 500.h,child: ShapeWidget(shapeColor: Colors.white.withOpacity(.5), width: 110.w, height: 110.h,)),
            PositionedDirectional(start: 240.w,top: 500.h,child: ShapeWidget(shapeColor: Colors.white.withOpacity(.5), width: 82.w, height: 82.h,)),


            PositionedDirectional(start: 50.w,top: 480.h,child: SvgPicture.asset("assets/images/Rectangle 12.svg", width: 150.w, height: 80.w,)),
            PositionedDirectional(start: 50.w,top: 530.h,child: SvgPicture.asset("assets/images/Union.svg",width: 100.w, height: 77.h,)),


            PositionedDirectional(start: 184.w,top: 930.h,child: SvgPicture.asset("assets/images/Rectangle 12.svg", width: 90.w, height: 84.h,)),
            PositionedDirectional(start: 220.w.w,top: 960.h,child: SvgPicture.asset("assets/images/Polygon 1.svg", width: 54.w, height: 48.h,)),
            
            PositionedDirectional(
                start: 41.w,top: 456.h,
                child: Consumer2<LoginProvider, GeneralApiState>(
                  builder: (context, loginProvider, generalApiState, _) {
                    return Container(
                      width: 345.w, height: 588.h,
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42.r),
                          color: ThemeClass.whiteColor.withOpacity(.6)),
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
                          TextDefaultWidget(title: "LOG IN", color: ThemeClass.blackColor, fontWeight: FontWeight.w700, fontSize: 30.sp,),
                          SizedBox(height: 90.h),
                          CustomTextFieldWidget(borderRadiusValue: 32.r,hint: "User Name",
                            controller: loginProvider.userName,
                            backGroundColor: ThemeClass.greyLiteColor, borderColor: Colors.transparent,),
                          SizedBox(height: 60.h),
                          CustomTextFieldWidget(borderRadiusValue: 32.r,hint: "Password",
                            obscure: true,
                            controller: loginProvider.password,
                            backGroundColor: ThemeClass.greyLiteColor, borderColor: Colors.transparent,),
                          SizedBox(height: 60.h),
                          LoginApi().isWaiting ? const Center(child: LoadingAnimationWidget(),): CustomButton(title: "SUBMIT",height: 110.h,backgroundColor: ThemeClass.blueColor, radius: 20.r,onTap: ()=> StateOnLogin(context).login(context))
                        ],
                      ),
                    );
                  }
                )),

          ],
        ),
      ),
    );
  }
}
