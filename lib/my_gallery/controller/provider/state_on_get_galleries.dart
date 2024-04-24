import 'package:flutter/material.dart';
import 'package:promedia_task/my_gallery/controller/api/get_galeries_api.dart';
import 'package:promedia_task/my_gallery/controller/provider/gallery_provider.dart';
import 'package:provider/provider.dart';

class StateOnGalleries{

  GalleryProvider galleryProvider = GalleryProvider();

  StateOnGalleries(BuildContext context){
    galleryProvider = Provider.of<GalleryProvider>(context, listen: false);
  }


  Future getGalleries(BuildContext context) async {
    await GetGalleriesApi().getUploadedGalleries(context: context);
  }

}