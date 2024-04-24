import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHelper
{
  static navigationHandler({required BuildContext context,required Widget screen, bool isReplacement = false})
  {
    if(Platform.isIOS)
      {
        if(isReplacement == false)
          {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => screen,
              ),
            );
          }
        else
          {
            Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => screen,
              ),
            );
          }

      }
    else
      {
        if(isReplacement == false)
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => screen,
              ),
            );
          }
        else
          {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => screen,
              ),
            );
          }

      }
  }
}