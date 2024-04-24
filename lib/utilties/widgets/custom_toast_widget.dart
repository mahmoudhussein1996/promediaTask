// import 'package:flutter/material.dart';
// import 'package:yaqees/utilties/app_size_config.dart';
// import 'package:yaqees/utilties/theme.dart';
// enum ToastType{
//   success,
//   error,
//   warning
// }
//
// class CustomToastWidget extends StatelessWidget {
//   final String message;
//   final ToastType toastType;
//   final Widget? widget;
//   const CustomToastWidget(
//       {Key? key,
//       required this.message,
//       required this.toastType,
//       this.widget
//       })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomStackWidget(
//     children: [
//       Container(
//         decoration: BoxDecoration(
//           color: toastType == ToastType.success ?
//           ThemeClass.primaryColor : toastType == ToastType.error ?ThemeClass.redColor : ThemeClass.yellowColor,
//           borderRadius:  BorderRadius.circular(
//               SizeConfig.height * 0.006
//           ),
//         ),
//         constraints: BoxConstraints(
//           minHeight: SizeConfig.height * 0.089,
//           // maxHeight: SizeConfig.height * 0.1,
//         ),
//       ),
//       PositionedDirectional(
//         start: SizeConfig.height * 0.004,
//         top: SizeConfig.height * 0.001,
//         end: 0,
//         child: Container(
//           height: SizeConfig.height * 0.089,
//           width: SizeConfig.height * 0.422,
//           alignment: AlignmentDirectional.centerStart,
//           // margin: EdgeInsetsDirectional.only(end: SizeConfig.height * 0.008),
//           padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.height * 0.008, vertical: SizeConfig.height * 0.01,
//           ),
//           decoration: BoxDecoration(
//             color: ThemeClass.textFieldBackgroundColor,
//             borderRadius: BorderRadius.circular(SizeConfig.height * 0.006),
//             boxShadow: [
//               BoxShadow(
//                 color: ThemeClass.greyDarkColor,
//                 blurRadius: SizeConfig.height * 0.006,
//                 offset: Offset(0, SizeConfig.height * 0.006),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     toastType == ToastType.success
//                         ? "success".tr
//                         : toastType == ToastType.error
//                         ? "error".tr
//                         : "warning".tr,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                       color: toastType == ToastType.success
//                           ? ThemeClass.primaryColor
//                           : toastType == ToastType.error
//                           ? ThemeClass.redColor
//                           : ThemeClass.yellowColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: SizeConfig.height * 0.017,
//                     ),
//                   ),
//                   0.008.heightBox,
//                   Flexible(
//                     child: Text(
//                       message,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall!
//                           .copyWith(
//                         color: ThemeClass.blackColor,
//                         fontWeight: FontWeight.w400,
//                         fontSize: SizeConfig.height * 0.016,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                   ),
//                 ],
//               ),
//               Spacer(),
//               // TextButton(onPressed: (){}, child: TextDefaultWidget(title: "share_now".tr, color: ThemeClass.primaryColor, fontWeight: FontWeight.bold,))
//               widget ?? SizedBox()
//             ],
//           ),
//         ),
//       ),
//     ],
//     );
//   }
// }
