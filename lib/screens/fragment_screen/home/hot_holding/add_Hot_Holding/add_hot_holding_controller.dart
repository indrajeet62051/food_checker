import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddHotHoldingController {
  File? uploadedImage;
  final ImagePicker picker = ImagePicker();
  final title = TextEditingController();
  final recipe = TextEditingController();
  final temperature = TextEditingController();

  bool get isValid =>
      uploadedImage != null &&
          title.text.isNotEmpty &&
          recipe.text.isNotEmpty &&
          temperature.text.isNotEmpty;

  Future<void> pickImage(ImageSource source) async {
    final XFile? picked = await picker.pickImage(source: source);
    if (picked != null) {
      uploadedImage = File(picked.path);
    }
  }

  void resetForm() {
    uploadedImage = null;
    title.clear();
    recipe.clear();
    temperature.clear();
  }

  void dispose() {
    title.dispose();
    recipe.dispose();
    temperature.dispose();
  }
}
