import 'package:flutter/material.dart';
import 'package:promedia_task/login/view/login_screen.dart';

class Routes
{
  static  Map<String,Widget Function(BuildContext)> routesMap = {
    "/LoginScreen": (context) =>  const LoginScreen(),
  };
}