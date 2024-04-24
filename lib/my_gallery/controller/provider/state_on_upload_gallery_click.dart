import 'package:flutter/material.dart';
import 'package:promedia_task/my_gallery/controller/api/upload_galery_api.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:promedia_task/my_gallery/controller/provider/state_on_get_galleries.dart';
import 'package:promedia_task/utilties/helper.dart';
import 'package:provider/provider.dart';

class StateOnUploadGalleryClick{

  GalleryProvider galleryProvider = GalleryProvider();

  StateOnUploadGalleryClick(BuildContext context){
    galleryProvider = Provider.of<GalleryProvider>(context, listen: false);
  }


  Future onUploadGalleryClick(BuildContext context) async {
    galleryProvider.setPickedImage(await Helper.pickImage(context: context));
    if(galleryProvider.pickedImage != null){
      await UploadGalleryApi().upload(context: context, image: galleryProvider.pickedImage!);

      StateOnGalleries(context).getGalleries(context);
    }
    else{
      print("no images selected");
    }
  }

}