import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddCleaningController {
  File? uploadedImage;
  final ImagePicker picker = ImagePicker();
  final title = TextEditingController();
  final description = TextEditingController();
  final location = TextEditingController();
  final requirement = TextEditingController();


  bool get isValid =>
      uploadedImage != null &&
          title.text.isNotEmpty &&
          description.text.isNotEmpty &&
          location.text.isNotEmpty &&
          requirement.text.isNotEmpty;


  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(source: source);
    if (picked != null) {
      uploadedImage = File(picked.path);
    }
  }

  void resetForm() {
    uploadedImage = null;
    title.clear();
    description.clear();
    location.clear();
    requirement.clear();
  }

  void dispose() {
    title.dispose();
    description.dispose();
    location.dispose();
    requirement.dispose();
  }
}
