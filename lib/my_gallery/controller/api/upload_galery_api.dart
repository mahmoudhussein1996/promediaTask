import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:promedia_task/services/api_handler/general_api_state.dart';
import 'package:promedia_task/services/api_handler/http_request_handler.dart';
import 'package:promedia_task/services/api_handler/urls.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UploadGalleryApi extends GeneralApiState{
  factory UploadGalleryApi() {
    _this ??= UploadGalleryApi._();
    return _this!;
  }
  static UploadGalleryApi? _this;
  UploadGalleryApi._();

  GalleryProvider galleryProvider = GalleryProvider();
  LoginProvider loginProvider = LoginProvider();




  Future upload({required BuildContext context,required File image}) async {
    galleryProvider = Provider.of<GalleryProvider>(context, listen: false);
    loginProvider = Provider.of<LoginProvider>(context, listen: false);

    UploadGalleryApi().setWaiting();
    try {
      await HttpHelper.postRequest(
          url: ProMediaEndPoints.uploadImage,
          token: loginProvider.user.token,
          files: [
              await http.MultipartFile.fromPath("img", image.path),
          ], body: {}
      ).then((value) async {
        UploadGalleryApi().setHasData();
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${ProMediaEndPoints.baseServerURL}${ProMediaEndPoints.uploadImage}\n error= $error");
        if (error.toString() == "internet") {
          UploadGalleryApi().setConnectionError();
        }
        else {
          UploadGalleryApi().setHasError();
          UploadGalleryApi().setError(error);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
      }
    }
  }

}