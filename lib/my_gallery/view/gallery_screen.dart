import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:promedia_task/Theme/theme.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/my_gallery/controller/api/get_galeries_api.dart';
import 'package:promedia_task/my_gallery/controller/api/upload_galery_api.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:promedia_task/my_gallery/controller/provider/state_on_upload_gallery_click.dart';
import 'package:promedia_task/my_gallery/view/widgets/gallery_item.dart';
import 'package:promedia_task/my_gallery/view/widgets/walved_container.dart';
import 'package:promedia_task/utilties/app_size_config.dart';
import 'package:promedia_task/utilties/widgets/custom_button_widget.dart';
import 'package:promedia_task/utilties/widgets/default_text_widget.dart';
import 'package:promedia_task/utilties/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xffDDCDFF).withOpacity(.4),
              Color(0xffEA94D7),
              Color(0xffFFDADA),
              Color(0xffffffff),
              // Color(0xffDaEcD8),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
        ),
        child: Stack(
          children: [
             PositionedDirectional(end: 0.w,top: 0.h,child: WavedContainer(width: 150.w, height: 180.h, color: ThemeClass.moveColor)),
            Consumer2<LoginProvider, GalleryProvider>(
              builder: (context, loginProvider, galleryProvider, _) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: TextDefaultWidget(title: "Welcome ${loginProvider.user.name}",
                              color: ThemeClass.blackColor,
                              fontSize: 30.sp, fontWeight: FontWeight.w500,),
                          ),
                          CircleAvatar(radius: 35.r,backgroundImage: AssetImage("assets/images/default_user.png"),)
                        ],
                      ),
                      SizedBox(height: 40.h),
                      Row(
                        children: [
                        CustomButton(
                          width: SizeConfig.width > 500 ? SizeConfig.width / 5 : 143.w, height: 100.h,
                            textColor: ThemeClass.blackColor,
                            horizontalPadding: 10.w,
                            title: "Log Out",
                            backgroundColor: ThemeClass.greyLiteColor,
                            iconWidget: SvgPicture.asset("assets/images/logout.svg"),
                            onTap: (){}),
                        SizedBox(width: 60.w),
                          UploadGalleryApi().isWaiting ? const Center(child: LoadingAnimationWidget(),): CustomButton(
                          width: SizeConfig.width > 500 ? SizeConfig.width / 5 : 143.w, height: 100.h,
                            textColor: ThemeClass.blackColor,
                            horizontalPadding: 10.w,
                            title: "Upload",
                            backgroundColor: ThemeClass.greyLiteColor,
                            iconWidget: SvgPicture.asset("assets/images/upload.svg"),
                            onTap: ()=> StateOnUploadGalleryClick(context).onUploadGalleryClick(context)),

                      ],),
                      SizedBox(height: 10.h),
                      GetGalleriesApi().isWaiting ? const Center(child: LoadingAnimationWidget()) :  Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: galleryProvider.myGallery.length,
                          itemBuilder: (context, index) {
                            return GalleryItem(image: galleryProvider.myGallery[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            )
            //),



          ],
        ),
      ),
    );
  }
}
