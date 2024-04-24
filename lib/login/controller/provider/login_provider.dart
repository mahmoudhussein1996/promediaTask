import 'package:flutter/material.dart';
import 'package:promedia_task/login/model/user_model.dart';


class LoginProvider extends ChangeNotifier {
  // singleton
  factory LoginProvider() {
    _this ??= LoginProvider._();
    return _this!;
  }

  static LoginProvider? _this;
  LoginProvider._();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  User _user = User();
  User get user => _user;
  setUser(User user){
    _user = user;
    listen();
  }
  // BaseResponseModel _baseModel = BaseResponseModel.fromJson({});
  // BaseResponseModel get baseModel=> _baseModel;
  // setBaseResponseModel(BaseResponseModel baseResponseModel){
  //   _baseModel = baseResponseModel;
  //   notifyListeners();
  // }

  void resetData(){
    userName.clear();
    password.clear();
  }
  void listen(){
    notifyListeners();
  }
}
