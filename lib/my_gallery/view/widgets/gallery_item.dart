import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promedia_task/Theme/theme.dart';

class GalleryItem extends StatelessWidget {
 final String image;
  const GalleryItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108.w, height: 108.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: ThemeClass.greyColor.withOpacity(.4),
        image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))
      ),
    );
  }
}
