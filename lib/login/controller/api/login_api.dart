import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:promedia_task/login/controller/provider/login_provider.dart';
import 'package:promedia_task/login/model/user_model.dart';
import 'package:promedia_task/services/api_handler/general_api_state.dart';
import 'package:promedia_task/services/api_handler/http_request_handler.dart';
import 'package:promedia_task/services/api_handler/urls.dart';
import 'package:provider/provider.dart';

class LoginApi extends GeneralApiState{
  factory LoginApi() {
    _this ??= LoginApi._();
    return _this!;
  }
  static LoginApi? _this;
  LoginApi._();

  LoginProvider loginProvider = LoginProvider();



  Future login({required BuildContext context}) async {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);

    LoginApi().setWaiting();
    try {
      await HttpHelper.postRequest(
        url: ProMediaEndPoints.login,
        body: {
          "email": loginProvider.userName.text,
          "password":loginProvider.password.text,
        }
      ).then((value) async {
        LoginApi().setHasData();
        loginProvider.setUser(User.fromJson(value));
      }).catchError((error, stackTrace) {
        debugPrint("catchError --------------> ${ProMediaEndPoints.baseServerURL}${ProMediaEndPoints.login}\n error= $error");
        if (error.toString() == "internet") {
          LoginApi().setConnectionError();
        }
        else {
          LoginApi().setHasError();
          LoginApi().setError(error);
        }
      });
    }catch(error){
      if (kDebugMode) {
        log("What happened??? ${error.toString()}");
      }
    }
  }

}