import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class add_cooking_controller{
  File ? UploadedImage;
  final ImagePicker picker = ImagePicker();
  final DishName = TextEditingController();
  final Recipe = TextEditingController();
  final Temperature = TextEditingController();


  bool get  isValid=>
      UploadedImage !=null &&
          DishName.text.isNotEmpty &&
          Recipe.text.isNotEmpty &&
          Temperature.text.isNotEmpty
  ;


  Future <void> PickedImage(ImageSource Source)async{
    final XFile? picked = await picker.pickImage(source: Source);
    if(picked != null)
    {
      UploadedImage = File(picked.path);
    }
  }

  void ResetForm(){
    UploadedImage = null;
    DishName.clear();
    Recipe.clear();
    Temperature.clear();

  }

  void dispose(){
    DishName.dispose();
    Recipe.dispose();
    Temperature.dispose();
  }

}