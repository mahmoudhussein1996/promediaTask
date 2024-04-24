import 'package:flutter/material.dart';
import 'package:promedia_task/login/controller/api/login_api.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/my_gallery/controller/provider/state_on_get_galleries.dart';
import 'package:promedia_task/my_gallery/view/gallery_screen.dart';
import 'package:promedia_task/utilties/route/navigation_helper.dart';
import 'package:provider/provider.dart';

class StateOnLogin{

  LoginProvider loginProvider = LoginProvider();

  StateOnLogin(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }


  Future login(BuildContext context) async {

   await LoginApi().login(context: context);

   if(loginProvider.user.token != null){
     NavigationHelper.navigationHandler(context: context, screen: GalleryScreen());

     StateOnGalleries(context).getGalleries(context);
   }

  }

}