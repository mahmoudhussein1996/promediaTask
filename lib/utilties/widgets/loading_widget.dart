import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promedia_task/Theme/theme.dart';
import 'package:promedia_task/utilties/app_size_config.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const LoadingAnimationWidget({Key? key,this.size, this.color,this.padding,}) : super(key: key);


  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {

  normalLoading({double? size,EdgeInsetsGeometry? padding,Color? color,}){

    return Container(
      color: Colors.transparent,
      margin: padding ,
      width: size ?? SizeConfig.height * 0.075,
      height: size ?? SizeConfig.height * 0.075,
      child:CupertinoActivityIndicator(
        radius: size ?? SizeConfig.height * 0.02,
        color:color?? ThemeClass.greyColor,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return normalLoading(size:widget.size,padding: widget.padding??EdgeInsets.zero );
  }
}
