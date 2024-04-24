import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promedia_task/Theme/theme.dart';
import 'package:promedia_task/utilties/widgets/custom_button_widget.dart';


class GalleryProvider extends ChangeNotifier {
  // singleton
  factory GalleryProvider() {
    _this ??= GalleryProvider._();
    return _this!;
  }

  static GalleryProvider? _this;
  GalleryProvider._();

  File? _pickedImage;
  File? get pickedImage=> _pickedImage;
  setPickedImage(File? pickedImage){
    _pickedImage = pickedImage;
    notifyListeners();
  }
  List<String> _myGallery = [];
  List<String> get myGallery => _myGallery;
  setMyGallery(List<String> myGallery){
    _myGallery = myGallery;
    notifyListeners();
  }

  void listen(){
    notifyListeners();
  }
}
