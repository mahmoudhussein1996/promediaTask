import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/login/model/user_model.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:promedia_task/services/api_handler/general_api_state.dart';
import 'package:promedia_task/services/api_handler/http_request_handler.dart';
import 'package:promedia_task/services/api_handler/urls.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GetGalleriesApi extends GeneralApiState{
  factory GetGalleriesApi() {
    _this ??= GetGalleriesApi._();
    return _this!;
  }
  static GetGalleriesApi? _this;
  GetGalleriesApi._();

  GalleryProvider galleryProvider = GalleryProvider();
  LoginProvider loginProvider = LoginProvider();



  Future getUploadedGalleries({required BuildContext context}) async {
    galleryProvider = Provider.of<GalleryProvider>(context, listen: false);
    loginProvider = Provider.of<LoginProvider>(context, listen: false);

    GetGalleriesApi().setWaiting();
    try {
      await HttpHelper.getRequest(
          url: ProMediaEndPoints.myGallery,
          token: loginProvider.user.token
      ).then((value) async {
        GetGalleriesApi().setHasData();
        galleryProvider.setMyGallery(List<String>.from(value["data"]["images"]!.map((image) => image)));
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${ProMediaEndPoints.baseServerURL}${ProMediaEndPoints.myGallery}\n error= $error");
        if (error.toString() == "internet") {
          GetGalleriesApi().setConnectionError();
        }
        else {
          GetGalleriesApi().setHasError();
          GetGalleriesApi().setError(error);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
      }
    }
  }

}